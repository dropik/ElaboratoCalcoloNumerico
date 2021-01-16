% Secant method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param x0 - initial value x0.
% @param x1 - initial value x1.
% @param tol - precision tolerance.
function [root, iterations] = secant(f, x0, x1, tol, maxit)
    if ~exist('maxit', 'var')
        maxit = 100;
    end
    checkSecantInputs(x0, x1, tol, maxit);

    rootEnumerator = esercizio5.SecantRootEnumerator(f, x0, x1, tol, maxit);
    rootFinder = esercizio5.RootFinder(rootEnumerator);
    [root, iterations] = rootFinder.find();
return