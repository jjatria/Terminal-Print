use Terminal::ANSIColor;
use Terminal::Print::BoxDrawing;
use Terminal::Print::Widget;
use Test;

class BoxWidget is Terminal::Print::Widget does Terminal::Print::BoxDrawing {
    method TWEAK { self.grid.disable }

    # Used in t/20-boxdrawing.t
    method border-check($expected, :$color, :$style) {
        self.draw-box(
            0, 0, self.w - 1, self.h - 1,
            |( :$color if $color ),
            |( :$style if $style )
        );

        my $cells = self.grid.grid.join;
        is $cells.&colorstrip, $expected,
            ( $style || 'default' ) ~ ( $color ?? ' with color' !! '' );

        return unless $color;

        is $cells.&uncolor,
            ( "$color reset" xx self.w * self.h - 1 ).join(' '),
            $color;
    }
}
