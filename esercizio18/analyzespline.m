% Analyzes Natural Cubic Spline method of polynomial interpolation for a given
% function on a given interval [a, b].
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - polynom grades to analyze.
% @param f - function to use.
%
% @return errE - array of maximum errors using equidistant nodes.
% @return errC - array of maximum errors using Chebyshev nodes.
function [errE, errC] = analyzespline(a, b, n, f)
    % Allocating some memory.
    [~, nSize] = size(n);
    errE = zeros(1, nSize);
    errC = errE;
    
    % Getting original dataset.
    x = (a:0.01:b);
    y = feval(f, x);
    
    for i = 1:nSize
        % Building Splines for i points.
        
        % Calculating knot values.
        [xE, yE] = equidist(a, b, n(i), f);
        [xC, yC] = chebyshev(a, b, n(i), f);
        
        % Building Splines.
        SE = splinenat(xE, yE, x);
        SC = splinenat(xC, yC, x);
        
        % Getting max errors.
        errE(i) = max(abs(SE - y));
        errC(i) = max(abs(SC - y));
    end
return