% Analyzes Lagrange method of polynomial interpolation for a given
% function on a given interval [a, b].
%
% @param a - lower bound of [a, b] interval.
% @param b - upper bound of [a, b] interval.
% @param n - polynom grades to analyze.
% @param f - function to use.
%
% @return errE - array of maximum errors using equidistant nodes.
% @return errC - array of maximum errors using Chebyshev nodes.
function [errE, errC] = analyzelagrange(a, b, n, f)
    % Allocating some memory.
    [~, nSize] = size(n);
    errE = zeros(1, nSize);
    errC = errE;
    
    % Getting original dataset.
    x = (a:0.01:b);
    y = feval(f, x);
    
    for i = 1:nSize
        % Building Lagrange polynom fit of i-th grade.
        
        % Calculating nodes for polynom.
        [xE, yE] = equidist(a, b, i, f);
        [xC, yC] = chebyshev(a, b, i, f);
        
        % Constructing Lagrange matrix.
        LE = lagrangematrix(xE);
        LC = lagrangematrix(xC);
        
        % Evaluating Lagrange polynoms.
        [~, errorsE] = lagrangeeval(LE, x, y, xE, yE);
        [~, errorsC] = lagrangeeval(LC, x, y, xC, yC);
        
        % Getting max errors.
        errE(i) = max(errorsE);
        errC(i) = max(errorsC);
    end
return