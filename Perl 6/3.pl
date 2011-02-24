use v6;

# This one is currently too slow for the large number,
# due to Rakudo not yet short-circuiting junctions.
sub elegant($num = 13195) {
    my @primes := 2, 3, -> $a is copy {
        repeat { $a += 2 } until $a % all @primes ... * > sqrt $a;
        $a;
    } ... *;

    my @factors = grep $num %% *, (@primes ... * > sqrt $num);
    @factors.max;
}

sub fast($num is copy = 600851475143) {
    my $square = sqrt $num;
    while $num > $square {
        my $n = 3;
        while $n <= sqrt $num {
            if $num %% $n {
                $num /= $n;
                last;
            }
            $n += 2;
        }
    }
    $num;
}

multi sub MAIN('elegant') {
    say elegant;
}

multi sub MAIN('fast') {
    say fast;
}
