% Generates a set of equidistant points on a given [a, b] interval.
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - grade of polynom.
% @param f - function to use to calculate Y.
%
% @return x - X coordinate of point.
% @return y - Y coordinate of point.
function [x, y] = equidist(a, b, n, f)
    x = 1:n+1;
    y = x;
    for i = 0:n
        x(i+1) = a + i * (b - a) / n;
        y(i+1) = feval(f, x(i+1));
    end
return