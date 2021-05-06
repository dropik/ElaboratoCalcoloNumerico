function x = mialu(lu, p, b)
% MIALU  Solves equation of type Ax=b using the LU factorizationg with
% partival pivoting of matrix A.
%
%   X = MIALU(LU, P, B) returns the solution for the AX=B equation given LU
%   matrix containing both L and U factors of lU factorization of a matrix
%   A, permutation vector P and the vector B.
    [m, n] = size(lu);
    
    if (m ~= n)
        error('mialu:nonSquare', 'Given LU matrix is non-square');
    end
    
    [pM, pN] = size(p);
    if ((pM ~= n) && (pN ~= n))
        error('mialu:pSizeMismatch', 'Given permutation vector P size is not matching LU size');
    end
    
    [bM, bN] = size(b);
    if ((bM ~= n) && (bN ~= n))
        error('mialu:bSizeMismatch', 'Given b vector size is not matching LU size');
    end
    
    y = zeros(n, 1);
    x = zeros(n, 1);
    
    for i=1:n
        y(i) = b(p(i)) - sum(y(1:i-1)' .* lu(i, 1:i-1));
    end
    
    for i=0:n-1
        if (lu(n-i, n-i) == 0)
            error('mialu:uIsSingular', 'Given U matrix is singular');
        end
        
        x(n-i) = (y(n-i) - sum(x(n-i+1:n)' .* lu(n-i, n-i+1:n))) / ...
                  lu(n-i, n-i);
    end
end