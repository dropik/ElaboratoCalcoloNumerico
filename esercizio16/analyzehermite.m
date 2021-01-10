% Analyzes Hermite method of polynomial interpolation for a given
% function on a given interval [a, b].
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - polynom grades to analyze.
% @param f - function to use.
% @param df - derivative of function to use.
%
% @return errE - array of maximum errors using equidistant nodes.
% @return errC - array of maximum errors using Chebyshev nodes.
function [errE, errC] = analyzehermite(a, b, n, f, df)
    % Allocating some memory.
    [~, nSize] = size(n);
    errE = zeros(1, nSize);
    errC = errE;
    
    % Getting original dataset.
    x = (a:0.01:b);
    y = feval(f, x);
    
    for i = 1:nSize
        % Building Hermite polynom fit of i-th grade.
        
        % Calculating nodes for polynom.
        [xE, yE] = equidist(a, b, i, f);
        [xC, yC] = chebyshev(a, b, i, f);
        
        % Calculating derivatives of given function in nodes.
        dyE = feval(df, xE);
        dyC = feval(df, xC);
        
        % Calculating Hermite polynom coefficients.
        HE = hermitefit(xE, yE, dyE);
        HC = hermitefit(xC, yC, dyC);
        
        % Evaluating Hermite polynoms.
        [~, errorsE] = hermiteeval(HE, x, y, xE);
        [~, errorsC] = hermiteeval(HC, x, y, xC);
        
        % Getting max errors.
        errE(i) = max(errorsE);
        errC(i) = max(errorsC);
    end
return