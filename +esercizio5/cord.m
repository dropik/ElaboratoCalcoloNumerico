% Metodo delle corde.
% @param f - function to find root for.
% @param g - derivate of function f.
% @param x0 - initial guess.
% @param tol - precision tolerance.
% @param maxit - max iterations amount.
function [root, iterations] = cord(f, g, x0, tol, maxit)
    % check if maxit was set
    if ~exist('maxit', 'var')
        maxit = 100;
    end
    checkCordInputs(x0, tol, maxit);

    rootEnumerator = esercizio5.CordRootEnumerator(f, g, x0, tol, maxit);
    rootFinder = esercizio5.RootFinder(rootEnumerator);
    [root, iterations] = rootFinder.find();
return