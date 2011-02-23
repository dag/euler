use v6;

# This is the optimized, less elegant version that still is too slow for
# this large number, but it does work.

my $num = 600851475143;

my @primes := 2, 3, -> $a is copy {
    my $square;
    repeat {
        $a += 2;
        $square = sqrt $a;
    } until all @primes.map: {
        last if $^b > $square;
        $a % $^b;
    }
    $a;
} ... *;

my @factors = @primes.grep: {
    last if $^a > sqrt $num;
    $num %% $^a;
}

say @factors.max;
