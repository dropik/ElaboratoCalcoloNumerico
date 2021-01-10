% Bisection method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param a0 - initial 'a' border of [a, b] interval.
% @param b0 - initial 'b' border of [a, b] interval.
% @param tol - precision tolerance.
% @param maxit - max iterations amount.
function [root, iterations] = bisect(f, a0, b0, tol, maxit)
    % check if maxit was set
    if ~exist('maxit', 'var')
        maxit = 100;
    end

    % calculating initial values
    a = a0;
    b = b0;
    root = (a + b) / 2;
    
    %executing algorithm
    for i = 1:maxit
        iterations = i;
        % check if already got a root
        froot = feval(f, root);
        if froot == 0
            break;
        end
        
        % Change interval. If f(a) * f(root) < 0, then use [a, root].
        % Use [root, b] otherwise.
        fa = feval(f, a);
        if fa * froot < 0
           b = root;
        else
            a = root;
        end
        
        % exit on desired precision.
        prev = root;
        root = (a + b) / 2;
        if abs(root - prev) <= tol * (1 + abs(prev))
            break;
        end    
    end
return