use Test;

use lib 't/lib';

use BoxWidget;

my $widget = BoxWidget.new(x => 0, y => 0, h => 3, w => 3);

for %(
     default => '╔ ═ ╗║   ║╚ ═ ╝',
     ascii   => '+ - +|   |+ - +',
     light1  => '┌ ─ ┐│   │└ ─ ┘',
     light2  => '┌ ╌ ┐╎   ╎└ ╌ ┘',
     light3  => '┌ ┄ ┐┆   ┆└ ┄ ┘',
     light4  => '┌ ┈ ┐┊   ┊└ ┈ ┘',
     heavy1  => '┏ ━ ┓┃   ┃┗ ━ ┛',
     heavy2  => '┏ ╍ ┓╏   ╏┗ ╍ ┛',
     heavy3  => '┏ ┅ ┓┇   ┇┗ ┅ ┛',
     heavy4  => '┏ ┉ ┓┋   ┋┗ ┉ ┛',
     double  => '╔ ═ ╗║   ║╚ ═ ╝',
).kv -> $style, $expected {
    $widget.border-check(
        $expected,
        |( :$style unless $style eq 'default' )
    );

    $widget.border-check(
        $expected,
        |( :$style unless $style eq 'default' ),
        color => 'red',
    );
}

dies-ok { $widget.draw-box( 0, 0, 2, 2, style => 'missing' ) },
    'Validates style names without color';

dies-ok { $widget.draw-box( 0, 0, 2, 2, color => 'red', style => 'missing' ) },
    'Validates style names with color';


done-testing;
