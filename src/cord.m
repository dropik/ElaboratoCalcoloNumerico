function x = cord(f, g, x0, tol, imax)
% CORD  Find a point at which the given function evaluates to zero using
% cord method.
%
%   X = CORD(F, G, X0, TOL) returns a point at which function F evaluates
%   to zero using cord method with G as first derivative of function F,
%   starting point X0, and within relative tolerance TOL.
%
%   X = CORD(F, G, X0, TOL, IMAX) in addition sets the limit for iterations
%   of the algorithm to IMAX.

    if (nargin == 4)
        imax = 100;
    end
    
    x = x0;
    gx0 = feval(g, x0);
    
    for i = 1:imax
        fx = feval(f, x);
        x = x - fx / gx0;
        
        % Exit criteria
        if (abs(x - x0) <= tol * (1 + abs(x0)))
            break
        end
        
        x0 = x;
    end
end