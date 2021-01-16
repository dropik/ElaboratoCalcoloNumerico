% Newton's method of finding a root of an equation of type f(x) = 0.
% @param f - function to find roots for.
% @param g - derivate of function f.
% @param x0 - initial guess.
% @param tol - precision tolerance.
% @param maxit - max amount of iterations, optional, default = 100.
function [root, iterations] = newton(f, g, x0, tol, maxit)
    if (~exist('maxit', 'var'))
        maxit = 100;
    end
    checkNewtonInputs(x0, tol, maxit);
    
    rootEnumerator = esercizio5.NewtonRootEnumerator(f, g, x0, tol, maxit);
    rootFinder = esercizio5.RootFinder(rootEnumerator);
    [root, iterations] = rootFinder.find();
return