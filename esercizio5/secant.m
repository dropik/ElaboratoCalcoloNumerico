% Secant method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param x0 - initial value x0.
% @param x1 - initial value x1.
% @param tol - precision tolerance.
function [root, iterations] = secant(f, x0, x1, tol, maxit)
    % check if maxit was set
    if ~exist('maxit', 'var')
        maxit = 100;
    end

    % executing algorithm
    for i = 1:maxit
        iterations = i;
        fx = feval(f, x1);  % f(x.k)
        fx1 = feval(f, x0); % f(x.k-1)
        
        % calculating next iteration value
        root = x1 - (x1 - x0) / (fx - fx1) * fx;
        
        % exit on desired precision
        if abs(root - x1) <= tol * (1 + abs(x1))
            break;
        end
        
        x0 = x1;
        x1 = root;
    end
return