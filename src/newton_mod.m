function [x, i] = newton_mod(f, g, x0, m, tol, imax)
% NEWTON  Find a point at which given function evaluates to zero using
% modified Newton's method.
%
%   X = NEWTON_MOD(F, G, X0, M, TOL) finds a point X, at which function F
%   evaluates to zero using modified Newton's method, first derivative G of
%   function F, with initial guess X0, known multiplicity M of the root and
%   within relative tolerance TOL.
%
%   X = NEWTON_MOD(F, G, X0, M, TOL, IMAX) in addition uses IMAX as a limit
%   for iterations number of the algorithm.

    if (nargin == 5)
        imax = 100;
    end

    x = x0;
    fx = feval(f, x);
    
    for i = 1:imax
        if (fx == 0)
            break
        end
        
        gx = feval(g, x);
        x = x - m * fx / gx;
        
        % Exit criteria
        if (abs(x - x0) <= tol * (1 + abs(x0)))
            break
        end
        
        x0 = x;
        fx = feval(f, x);
    end
end