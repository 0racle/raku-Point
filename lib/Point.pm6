use nqp;

class Point:ver<1.2.1>:auth<zef:elcaro> {
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

sub point(\x, \y) is export {
    Point.new(x, y)
}

multi infix:<+> (Point \a, Point \b) is export {
    Point.new(nqp::add_n(a.x, b.x), nqp::add_n(a.y, b.y))
}
multi infix:<+> (Point \a, Num() \n) is export {
    Point.new(nqp::add_n(a.x, n), nqp::add_n(a.y, n))
}

multi infix:<-> (Point \a, Point \b) is export {
    Point.new(nqp::sub_n(a.x, b.x), nqp::sub_n(a.y, b.y))
}
multi infix:<-> (Point \a, Num() \n) is export {
    Point.new(nqp::sub_n(a.x, n), nqp::sub_n(a.y, n))
}
multi infix:<−> (Point \a, Point \b) is export {
    Point.new(nqp::sub_n(a.x, b.x), nqp::sub_n(a.y, b.y))
}
multi infix:<−> (Point \a, Num() \n) is export {
    Point.new(nqp::sub_n(a.x, n), nqp::sub_n(a.y, n))
}

multi infix:<*> (Point \a, Point \b) is export {
    Point.new(nqp::mul_n(a.x, b.x), nqp::mul_n(a.y, b.y))
}
multi infix:<×> (Point \a, Point \b) is export {
    Point.new(nqp::mul_n(a.x, b.x), nqp::mul_n(a.y, b.y))
}
multi infix:<*> (Point \a, Num() \n) is export {
    Point.new(nqp::mul_n(a.x, n), nqp::mul_n(a.y, n))
}
multi infix:<×> (Point \a, Num() \n) is export {
    Point.new(nqp::mul_n(a.x, n), nqp::mul_n(a.y, n))
}

multi infix:</> (Point \a, Point \b) is export {
    Point.new(nqp::div_n(a.x, b.x), nqp::div_n(a.y, b.y))
}
multi infix:<÷> (Point \a, Point \b) is export {
    Point.new(nqp::div_n(a.x, b.x), nqp::div_n(a.y, b.y))
}

multi infix:</> (Point \a, Num() \n) is export {
    Point.new(nqp::div_n(a.x, n), nqp::div_n(a.y, n))
}
multi infix:<÷> (Point \a, Num() \n) is export {
    Point.new(nqp::div_n(a.x, n), nqp::div_n(a.y, n))
}

multi prefix:<-> (Point \a) is export {
    Point.new(nqp::neg_n(a.x), nqp::neg_n(a.y))
}
multi prefix:<−> (Point \a) is export {
    Point.new(nqp::neg_n(a.x), nqp::neg_n(a.y))
}
