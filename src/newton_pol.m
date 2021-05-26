function yy = newton_pol(xx, x, y)
% NEWTON_POL  Evaluates polynomial interpolation in Newton basis
% polynomials.
%
%   YY = NEWTON_POL(XX, X, Y) returns vector of evaluated values of
%   polynomial at points given in XX, using X and Y as points to calculate
%   Newton basis polynomials.
    [n, ~] = size(x);
    [nY, ~] = size(y);
    if (nY ~= n)
        error('newton_pol:xAndYMismatch', 'X and Y vectors sizes mismatch');
    end
    
    omega_x = 1;
    f = zeros(n, 1);
    f(1) = y(1);
    yy = y(1);
    
    for r = 2:n
        omega_x = (xx - x(r - 1)) .* omega_x;
        f(r) = y(r);
        for i = r-1:-1:1
            f(i) = (f(i+1) - f(i))/(x(r) - x(i));
        end
        yy = yy + f(1) * omega_x;
    end
end