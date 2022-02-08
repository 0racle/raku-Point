NAME
====

Point - Point class


SYNOPSIS
========

This is a simple immutable Point class for Raku. It's implementation is loosely based on [Tuple](https://modules.raku.org/dist/Tuple:cpan:ELIZABETH) but is restricted to only accepting 2 Real numbers: an `x` and a `y`.

Internally, the values are stored as native `num`'s for speed, as well as allowing for decimal values, also useful when calculating the Euclidean distance (with the usual floating-point precision caveats).

Like `Tuple`, the `Point` is a value type, so `Point` objects will behave inside data structures such as `Set`.

```raku
use Point; # exports a 'point' sub

my $p = point(1,  1);
my $q = point(2, -3);

# addition between points returns a new point
say $p + $q;  # (3, -2)

# point values will behave inside a Set
say set($p, $p, $q);  # set((1, 1) (2, -3))

# maybe these subs will be included with the module in future?

sub cityblock-distance($p, $q = point(0, 0)) {
    abs($p.x + $q.x) + abs($p.y + $q.y)
}

sub euclidean-distance($p, $q = point(0, 0)) {
    (($p.x - $q.x)² + ($p.y - $q.y)²) ** 0.5
}

say cityblock-distance($p, $q);  # 5 
say euclidean-distance($p, $q);  # 4.123105625617661 
```

An addition (`+`) infix op is exported to support addition of points.

From Version 1.2.0, infix ops are also exported for
  * subtraction (infix `-` and `−`)
  * multipliction (infix `*` and `×`)
  * division (infix `/`,  `÷`)

... as well as unary prefix negation.

Here's a simple Eclidean vector implementation using some of those features

```raku
use Point;

class Vec {
    has $.pos = point(0, 0);  # position
    has $.vel = point(0, 0);  # velocity
    has $.acc = point(0, 0);  # acceleration
    has $.mas = 1;            # mass

    # magnitude of velocity
    method speed() {
        (.x² + .y²).sqrt given $!vel;
    }

    method apply-force(Point $f) {
        $!acc += $f ÷ $!mas;
    }

    method update() {
        $!vel += $!acc;
        $!pos += $!vel;
        $!acc ×= 0;
    }
}
```

I stopped short of export multi's for other math functions (`abs`, `floor`, etc) but if there is a great crying out of need for these, I would consider it. In the meantime, implementing these multi's in your own code is easy enough.

CAVEATS
=======

A `Point` object is not a `List`. It cannot be directly indexed into; just use the `.x` and `.y` methods. It will try to stay in `item` context most of the time. However if you want to (eg. to slip `x` and `y` to some external function) you can call `.list` (or any other method that indirectly calls `.list`) to get the `Num` values as a list, eg.

    my @p = |$p;
    say @p.raku;  # [1e0, 1e0]


LICENCE
=======

    The Artistic License 2.0

See LICENSE file in the repository for the full license text.
