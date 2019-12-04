NAME
====

Point - Point class


SYNOPSIS
========

This is a simple immutable Point class for Raku (née Perl 6). It's implementation is loosely based on [Tuple](https://modules.raku.org/dist/Tuple:cpan:ELIZABETH) but is restricted to only accepting 2 Real numbers: an `x` and a `y`.

Internally, the values are stored as native `num`'s for speed, as well as allowing for decimal values, also useful when calculating the Euclidean distance (with the usual floating-point precision caveats).

Like `Tuple`, the `Point` is a value type, so `Point` objects will behave inside data structures such as `Set`.

    use Point; # exports a 'point' sub

    # zero-arg call initialises point at (0, 0);
    say point();  # (0, 0)

    my $p = point(1,  1);
    my $q = point(2, -3);

    # addition between points returns a new point
    say $p + $q;  # (3, -2)

    # point values will behave inside a Set
    say set($p, $p, $q);  # set((1, 1) (2, -3))

    # maybe these subs will be included with the module in future?

    sub cityblock-distance($p, $q = point()) {
        abs($p.x + $q.x) + abs($p.y + $q.y)
    }

    sub euclidean-distance($p, $q) {
        (($p.x - $q.x)² + ($p.y - $q.y)²) ** 0.5
    }

    say cityblock-distance($p, $q);  # 5 
    say euclidean-distance($p, $q);  # 4.123105625617661 


CAVEATS
=======

A `Point` object is not a `List`. It cannot be directly indexed into; just use the `.x` and `.y` methods. It will try to stay in `item` context most of the time. However if you need to can call `.list` on it to get the values as a list, or any other method that indirectly calls `.list`, eg.

    my @p = |$p;
    say @p.raku;  # [1e0, 1e0]


LICENCE
=======

    The Artistic License 2.0

See LICENSE file in the repository for the full license text.
