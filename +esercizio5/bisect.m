% Bisection method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param a0 - initial 'a' border of [a, b] interval.
% @param b0 - initial 'b' border of [a, b] interval.
% @param tol - precision tolerance.
function [root, iterations] = bisect(f, a, b, tol)
    checkBisectInputs(a, b, tol);

    rootEnumerator = esercizio5.BisectRootEnumerator(f, a, b, tol);
    rootFinder = esercizio5.RootFinder(rootEnumerator);
    [root, iterations] = rootFinder.find();
return