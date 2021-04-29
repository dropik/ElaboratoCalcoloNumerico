function [x, i] = secant(f, x0, x1, tol, imax)
% SECANT  Find a point at which the given function evaluates to zero using
% secant method.
%
%   X = SECANT(F, X0, X1, TOL) returns a point at which function F
%   evaluates to zero using secant method with starting points X0 and X1,
%   and within relative tolerance TOL.
%
%   X = SECANT(F, X0, X1, TOL, IMAX) in addition uses IMAX as a limit for
%   iterations of the algorithm.
%
%   [X, I] = SECANT(F, X0, X1, TOL) returns the root X and the number of
%   iterations I executed.

    if (nargin == 4)
        imax = 100;
    end
    
    x = x1;
    
    fxiMinus1 = feval(f, x0);
    
    for i = 1:imax
        fxi = feval(f, x1);
        
        x = (fxi * x0 - fxiMinus1 * x1) / (fxi - fxiMinus1);
        
        % Exit criteria
        if (abs(x - x1) <= tol * (1 + abs(x1)))
            break
        end
        
        x0 = x1;
        x1 = x;
        fxiMinus1 = fxi;
    end
end