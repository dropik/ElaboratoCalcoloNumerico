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
        error('Given LU matrix is not square');
    end
    
    % solving Ly = Pb equation first.
    y = [1:n]';
    for i = 1:n
        % for y1 we just set Pb1.
        if (i == 1)
            sum = 0;
        else
            % calculate Li1*y1 + Li2*y2 + ...
            l = LU(i, 1:i-1);
            sum = l * y(1:i-1);
        end
        
        % calculate Pb - Li1*y1 - Li2*y2 - ...
        y(i) = b(p(i)) - sum;
    end
    
    % solving Ux = y equation second.
    x = [1:n]';
    for i = flip(1:n)
        % for Xn we just set Yn/Un.
        if (i == n)
            sum = 0;
        else
            % calculate Uin*Xn + Uin-1*Xn-1 + ...
            u = LU(i, i+1:n);
            sum = u * x(i+1:n);
        end
        
        % calculate (yi - Uin*Xn - Uin-1*Xn-1 - ...) / Uii
        x(i) = (y(i) - sum) / LU(i, i);
    end
return