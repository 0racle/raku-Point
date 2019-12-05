use nqp;

class Point {
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

    method new(Real \x, Real \y) {
        nqp::create(self)!SET-SELF(x, y)
    }

    multi method WHICH(Point:D:) {
        nqp::box_s(
            nqp::concat('Point|', nqp::concat($!x, nqp::concat(',', $!y))),
            ValueObjAt
        )
    }
}

multi infix:<+> (Point \a, Point \b) is export {
    Point.new(nqp::add_n(a.x, b.x), nqp::add_n(a.y, b.y))
}

sub point(\x, \y) is export {
    Point.new(x, y)
}
