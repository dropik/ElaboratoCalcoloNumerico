function x = newton(f, g, x0, tol, imax)
% NEWTON  Find a point at which given function evaluates to zero using
% Newton's method.
%
%   X = NEWTON(F, G, X0, TOL) finds a point X, at which function F
%   evaluates to zero using Newton's method, first derivative G of function
%   F, with initial guess X0 and within relative tolerance TOL.
%
%   X = NEWTON(F, G, X0, TOL, IMAX) in addition uses IMAX as a limit for
%   iterations number of the algorithm.

    if (nargin == 4)
        imax = 100;
    end

    x = x0;
    
    for i = 1:imax
        fx = feval(f, x);
        gx = feval(g, x);
        x = x - fx / gx;
        
        % Exit criteria
        if (abs(x - x0) <= tol * (1 + abs(x0)))
            break
        end
        
        x0 = x;
    end
end