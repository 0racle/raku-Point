use Point;

use Test;

plan 7;

my $p = Point.new(x => 1, y => 1);
my $q = point(2, -3);

is $q.list, (2, -3), 'point.list';

is $q.gist, '(2, -3)', 'point.gist';

is $q.x, 2, 'point.x';

is $q.y, -3, 'point.y';

is $p + $q, point(3, -2), 'addition';

is point(), point(0, 0), 'zero-arg';

is set(point(1, 1), point(1, 1), point(1, 2)).keys.sort, (point(1,1), point(1, 2)), 'objat';

# vim: ft=perl6
