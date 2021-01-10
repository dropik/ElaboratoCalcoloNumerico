% Metodo delle corde.
% @param f - function to find root for.
% @param a - 'a' border of [a, b] interval.
% @param b - 'b' border of [a, b] interval.
% @param tol - precision tolerance.
% @param maxit - max iterations amount.
function [root, iterations] = cord(f, a, b, tol, maxit)
    % check if maxit was set
    if ~exist('maxit', 'var')
        maxit = 100;
    end

    fb = feval(f, b);   % f(b) (fixed point)
    
    % executing algorithm
    for i = 1:maxit
        iterations = i;
        fa = feval(f, a);   % f(x.k)
        
        % calculating next iteration value
        root = b - fb*(a - b)/(fa - fb);
        
        % exit on desired precision
        if abs(root - a) <= tol * (1 + abs(a))
            break;
        end
        
        a = root;
    end
return