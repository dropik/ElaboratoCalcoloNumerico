% Generates a set of points using Gauss-Chebyshev method
% on a given [a, b] interval.
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - grade of polynom.
% @param f - function to use to calculate Y.
%
% @return x - X coordinate of point.
% @return y - Y coordinate of point.
function [x, y] = chebyshev(a, b, n, f)
    x = 1:n+1;
    y = x;
    for i = 0:n
        t = cos((2*i + 1)/(2*n + 2)*pi);
        x(i+1) = (a + b)/2 + (b - a)/2*t;
        y(i+1) = feval(f, x(i+1));
    end
return