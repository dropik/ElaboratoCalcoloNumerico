function yy = spline_nak(x, y, xx)
% SPLINE_NAK  evaluates a spline not-a-knot for given coordinates.
%
%   YY = SPLINE_NAK(X, Y, XX) returns an array of evaluated spline given X
%   and Y containing points on which piecewise polynomials are defined, and
%   array XX with x-coordinates of points to evaluate.
    [n, m] = size(x);
    n = max(n, m) - 1;    
    
    m = spline_coefs(x, y, n);
    yy = spline_eval(x, y, n, xx, m);
end