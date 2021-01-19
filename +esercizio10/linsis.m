function [A, b] = linsis(n, k, simme)
%
%  [A, b] = linsis(n, k, simme)     Crea una matrice A nxn ed un termine noto b,
%                                   in modo che la soluzione del sistema lineare 
%                                   A*x=b sia x = [1,2,...,n]^T.
%                                   k non ve lo dico a cosa serve.
%                                   simme, se specificato, crea una matrice
%                                   simmetrica e definita positiva.
%
    if ~exist('simme', 'var')
        simme = false;
    end

    sigma = 10^(-2*(1-k))/n;
    rng(0);
    [q1, ~] = qr(rand(n));
    if (simme)
        q2 = q1';
    else
        [q2, ~] = qr(rand(n));
    end
    d = diag([sigma 2/n:1/n:1]);
    A = q1 * d * q2;
    x = (1:n)';
    b = A * x;
return