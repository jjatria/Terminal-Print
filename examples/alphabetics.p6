use v6;
use lib './lib';

use Terminal::Print;

my $p = Terminal::Print.new;

$p.initialize-screen;

#say $p.grid-indices.perl;

my @char-ranges = '■'..'◿','ぁ'..'ゟ','᠀'..'ᢨ','ᚠ'..'ᛰ','Ꭰ'..'Ᏼ','─'..'╿';
for @char-ranges.pick(*) -> @alphabet {
    for $p.grid-indices -> [$x,$y] {
        $p.print-cell($x, $y, @alphabet.roll)
            if $y %% 7 || ($x %% (0..5).roll || $y %% (0..6).roll);
    }
    $p.clear-screen;
}

$p.shutdown-screen;