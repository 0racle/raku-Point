class Point {
    use nqp;
    has num $.x;
    has num $.y;

    method !SET-SELF(Num() \x, Num() \y) {
        $!x = x;
        $!y = y;
        self
    }

    method Str  { "($!x, $!y)" }
    method gist { "($!x, $!y)" }
    method list {   $!x, $!y   }

    proto method new(|) {*}

    # zero
    multi method new() {
        nqp::create(self)!SET-SELF(0, 0)
    }

    # positional
    multi method new(Real \x, Real \y) {
        nqp::create(self)!SET-SELF(x, y)
    }

    # list
    multi method new(@ [Real \x, Real \y]) {
        nqp::create(self)!SET-SELF(x, y)
    }

    # named
    multi method new(Real :$x!, Real :$y!) {
        nqp::create(self)!SET-SELF($x, $y)
    }

    multi method WHICH(Point:D:) {
        nqp::box_s(
            nqp::concat('Point|', nqp::concat($!x, nqp::concat(',', $!y))),
            ValueObjAt
        )
    }
}

multi infix:<+> (Point $a, Point $b) is export {
    Point.new($a.x + $b.x, $a.y + $b.y)
}

sub point(|c) is export {
    Point.new(|c)
}
