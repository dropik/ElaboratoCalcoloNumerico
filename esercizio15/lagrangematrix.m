% Generates a matrix with some recalculated values for
% further calculation of Lagrange polynom, which is structured
% in the following manner:
%
% 0      x0-x1  ...  x0-xn
% x1-x0  0      ...  x1-xn
% .      .      .    .
% .        .    .    .
% .   ...    .  ...  0
%
% @param x - vector with X coordinates of given points.
%
% @return L - resulting matrix.
function L = lagrangematrix(x)
    [m, n] = size(x);
    L = zeros(n, n);
    
    for i = 1:n
        for j = 1:n
            if (i == j)
                continue
            end
            
            L(i, j) = x(i) - x(j);
        end
    end
return