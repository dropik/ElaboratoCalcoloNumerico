function root = radn(x, n)
% Using Newton's method to calculate n-th root.
% Let x be the n-th root of a value A, then we
% have to find a positive real root of function
% f(x) = x^n - A
% Applying Newton's method, we get for each new iteration
% x.k+1 = x.k - f(x.k)/f'(x.k)
% where f(x.k) = x.k^n - A,
% ans f'(x.k) = n * x.k^(n-1);
% And we stop the algorithm when f(x.k) < epsilon

    esercizio = esercizio4.Esercizio(x, n);
    root = esercizio.radn();
return