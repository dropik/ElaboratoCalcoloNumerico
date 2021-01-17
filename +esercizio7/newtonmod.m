% Modificated Newton's method of finding a root of an equation of type
% f(x) = 0, when multiplicity is known.
% @param f - function to find roots for.
% @param g - derivate of function f.
% @param x0 - initial guess.
% @param r - multiplicity.
% @param tol - precision tolerance.
% @param maxit - max amount of iterations, optional, default = 100.
function [root, iterations] = newtonmod(f, g, x0, r, tol, maxit)
    if ~exist('maxit', 'var')
        maxit = 100;
    end
    checkNewtonmodInputs(x0, r, tol, maxit);

    rootEnumerator = esercizio7.ModifiedNewtonRootEnumerator(f, g, x0, r, tol, maxit);
    rootFinder = esercizio5.RootFinder(rootEnumerator);
    [root, iterations] = rootFinder.find();
return