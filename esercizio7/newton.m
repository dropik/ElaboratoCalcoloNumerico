% Newton's method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param f1 - derivate of function f.
% @param x0 - initial guess.
% @param tol - precision tolerance.
% @param maxit - max amount of iterations, optional, default = 100.
function [root, iterations] = newton(f, f1, x0, tol, maxit)
    % check if 'maxit' parameter exists, and set it to default if doesn't
    if ~exist('maxit', 'var')
        maxit = 100;
    end

    % executing algorithm
    root = x0;
    for i = 1:maxit
        iterations = i;
        froot = feval(f, root);     % f(x.k)
        f1root = feval(f1, root);   % f'(x.k)
        
        % exist if derivate is null
        if f1root == 0
            break;
        end
        
        prev = root;
        
        % calculating next iteration value
        root = root - froot / f1root;
        
        % exit on desired precision
        if abs(root - prev) <= tol * (1 + abs(prev))
            break;
        end
    end
return