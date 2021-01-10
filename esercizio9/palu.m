% Calculates a matrix with both L and U information stored for
% LU factorization with partial pivoting.
% @param A - matrix to decompose.
% @return LU - matrix with L and U information stored.
% @return p - related permutation vector (not permutation matrix).
function [LU, p] = palu(A)
    % check if A matrix is actually square.
    [m,n] = size(A);
    if m ~= n
        error('Not a square matrix');
    end

    LU = A;
    p = [1:n]';

    % executing Gaussian elimination
    for i = 1:n-1
        % finding max value and its index in current column
        [maxValue, maxId] = max(abs(LU(i:n, i)));
        
        % check if matrix is singular.
        if maxValue == 0
            error('Singular matrix')
        end

        % converting max value index to LU matrix scope
        maxId = i + maxId - 1;
        
        % swap rows if needed
        if maxId > i
            LU([i maxId],:) = LU([maxId i],:);
            p([i maxId]) = p([maxId i]);
        end
        
        % dividing next elements in current column by current element
        LU(i+1:n, i) = LU(i+1:n, i) / LU(i, i);
        
        % Subtracting current row from next rows, but without previous
        % columns, because we are not making just U matrix, we are making 
        % both L and U matrices in one single matrix, so that we don't have 
        % to memorize and invert linear transformations we just made to 
        % find L matrix, and only after that calculating the desired 
        % result, making the algorithm more efficient.
        LU(i+1:n, i+1:n) = LU(i+1:n, i+1:n) - LU(i+1:n, i)*LU(i, i+1:n);
    end
return