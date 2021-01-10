function [root, iterations] = aitken(f, f1, x0, tol, maxit)
    if ~exist('maxit', 'var')
        maxit = 100;
    end
    
    for i = 1:maxit
        iterations = i;
        
        fx0 = feval(f, x0);
        d = feval(f1, x0);
        x1 = x0 - fx0 / d;
        fx1 = feval(f, x1);
        d = feval(f1, x1);
        x2 = x1 - fx1 / d;
        
        root = x2;
        if abs(x2 - x1) <= tol * (1 + abs(x1))
            break;
        end
        x0 = x0 - ((x1 - x0).^2) / (x0 - 2*x1 + x2);
    end
return