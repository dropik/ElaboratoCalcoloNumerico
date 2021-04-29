function [x, i] = bisect(f, a, b, tol)
% BISECT  Find a point where given function evaluates to zero using
% bisection method.
%
%   X = BISECT(F, A, B, TOL) using bisection method, finds a point where
%   function F evaluates to zero on the given interval [A, B], within the
%   relative tolerance TOL.

    if (b < a)
        swap = b;
        b = a;
        a = swap;
    end
    
    i = 1;

    fa = feval(f, a);
    if (fa == 0)
        x = a;
        return
    end
    
    fb = feval(f, b);
    if (fb == 0)
        x = b;
        return
    end
    
    imax = ceil(log2(b - a) - log2(tol));
    for i = 1:imax
        x = (a + b) / 2;
        fx = feval(f, x);
        
        % Exit criteria
        gx = (fb - fa) / (b - a);
        tolf = abs(gx) * tol;
        if (abs(fx) < tolf)
            break
        end
        
        if (fx == 0)
            break
        elseif (fa * fx < 0)
            b = x;
            fb = fx;
        else
            a = x;
            fa = fx;
        end
    end
end

