function [x, i] = aitken(f, g, x0, tol, imax)
% AITKEN  Find a point at which given function evaluates to zero using
% Aitken's method.
%
%   X = AITKEN(F, G, X0, TOL) returns a point at which the function F
%   evaluates to zero, using Aitken's method, with first derivative G of
%   the function F, initial guess X0 and within relative tolerance TOL.
%
%   X = AITKEN(F, G, X0, TOL, IMAX) in addition sets the limit IMAX of
%   iterations to execute.
%
%   [X, I] = AITKEN(F, G, X0, TOL) returns the root X and the number of
%   iterations I executed.

    if (nargin == 4)
        imax = 100;
    end

    x = x0;
    
    for i = 1:imax
        x1 = x0 - feval(f, x0) / feval(g, x0);
        x2 = x1 - feval(f, x1) / feval(g, x1);
        
        x = (x2*x0 - x1^2) / (x2 - 2*x1 + x0);
        
        % Exit criteria
        if (abs(x - x0) <= tol * (1 + abs(x0)))
            break
        end
        
        x0 = x;
    end
end