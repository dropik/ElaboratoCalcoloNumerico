% Solves linear equation of type Ax = b
% given LU decomposition of A matrix.
% @param LU - LU decomposition of A matrix.
% @param p - P matrix of LUP decomposition.
% @param b - b coefficients vector of Ax = b equation.
% @return x - result vector.
function x = lusolve(LU, p, b)
    % check if LU matrix is square.
    [m, n] = size(LU);
    if m ~= n
        error('inputs:LUMustBeSquare', 'Given LU matrix is not square');
    end
    
    y = esercizio9.forward(LU, p, b);
    x = esercizio9.backward(LU, y);
return