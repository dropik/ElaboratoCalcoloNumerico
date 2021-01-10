% Using Newton's method to calculate n-th root.
% Let x be the n-th root of a value A, then we
% have to find a positive real root of function
% f(x) = x^n - A
% Applying Newton's method, we get for each new iteration
% x.k+1 = 1/n((n-1)*x.k + A / x.k^(n-1))
% which we could rewrite like
% x.k+1 = x.k + deltaX.k
% And to obtain the best precision possible, we stop
% the algorithm when x.k+1 = x.k, or deltaX.k < epsilonMachine.
function root = radn(x, n)
    % guessing initial value
    root = 100;
    
    % execute algorithm
    while 1
        % calculating iteration
        next = 1/n*((n - 1)*root + x/(root^(n - 1)));
        
        % exit on best precision
        if next == root
            break;
        end
        
        root = next;
    end
return