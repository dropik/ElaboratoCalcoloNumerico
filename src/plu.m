function [lu, p] = plu(a)
% PLU  Factorizes given square matrix A using LU method with partial
% pivoting.
%
%   [LU, P] = PLU(A) stores L and U factors of LU factorization of given
%   matrix A into unique matrix LU. The pivoting is stored in a vector P
%   containing indexes that represents the mapping between rows of original
%   matrix and matrix LU.
    [m,n] = size(a);
    
    if (m ~= n)
        error('plu:nonSquare', 'The given matrix is not a square matrix')
    end

    lu = a;
    p = linspace(1, n, n);

    for i = 1:n-1
        [maxValue, maxIdLocal] = max(abs(lu(i:n, i)));
        
        if (maxValue == 0)
            error('plu:singular', 'The given matrix is singular');
        end

        if maxIdLocal > 1
            maxIdGlobal = i + maxIdLocal - 1;
            lu([i maxIdGlobal],:) = lu([maxIdGlobal i],:);
            p([i maxIdGlobal]) = p([maxIdGlobal i]);
        end
                
        lu(i+1:n, i) = lu(i+1:n, i) / lu(i, i);
        lu(i+1:n, i+1:n) = lu(i+1:n, i+1:n) - lu(i+1:n, i)*lu(i, i+1:n);
    end
end