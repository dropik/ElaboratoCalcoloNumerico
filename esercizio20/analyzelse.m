% Analyzes Matlab's Spline method of polynomial interpolation for a given
% function on a given interval [a, b].
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - dataset size.
% @param m - polynom grades to analyze.
% @param f - function to use.
%
% @return err - array of errors.
function err = analyzelse(a, b, n, m, f)
    % Allocating some memory.
    [~, mSize] = size(m);
    err = zeros(1, mSize);
    
    % Getting original dataset.
    h = (b - a) / n;
    x = (a:h:b);
    y = feval(f, x);
    
    for i = 1:mSize
        % Building Least-Squares of i grade.
        p = polyfit(x, y, i);   % Fitting values.
        yFit = polyval(p, x);   % Evaluating fit.
        err(i) = norm(yFit - y);    % Getting errors.
    end
return