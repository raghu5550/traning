#!/usr/bin/env perl6

=begin pod

=TITLE Word-wrap paragraphs to a given length

=AUTHOR Scott Penrose

=end pod

use v6;

my $line_length = 50;

sub MAIN($input-file = $*SPEC.catdir($*PROGRAM-NAME.IO.dirname, "lorem.txt")) {
    for $input-file.IO.lines {
        wrap(.words);
    }
}

# Print words, new line at word wrap, new line for paragraph
sub wrap (@in) {
    my $length = 0;
    for @in -> $l {
        if ( ($length + $l.chars) < $line_length) {
            print $l ~ ' ';
            $length += $l.chars;
        }
        else {
            print "\n$l ";
            $length = $l.chars;
        }
    }
    say '';
}

# vim: expandtab shiftwidth=4 ft=perl6
