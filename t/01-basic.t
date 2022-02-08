#!/usr/bin/env raku

use Point;

use Test;

plan 13;

my $p = Point.new(1, 2);
my $q = point(2, -4);

is $q.list, (2e0, -4e0), 'point.list';

is $q.gist, '(2, -4)', 'point.gist';

is $q.x, 2e0, 'point.x';

is $q.y, -4e0, 'point.y';

is $p + $q, point(3, -2), 'addition';

is $p - $q, point(-1, 6), 'subtraction';
is $p − $q, point(-1, 6), 'subtraction alt';

is $p * $q, point(2, -8), 'multiplication';
is $p × $q, point(2, -8), 'multiplication alt';

is $q / $p, point(2, -2), 'division';
is $q ÷ $p, point(2, -2), 'division alt';

is -$q, point(-2, 4), 'negation';

is set(point(1, 1), point(1, 1), point(1, 2)).keys.sort, (point(1,1), point(1, 2)), 'objat';

# vim: ft=perl6
