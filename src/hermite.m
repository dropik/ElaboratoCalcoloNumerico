function yy = hermite(xx, x, y, dy)
% HERMITE  evaluates Hermite interpolation polynom.
%
%   YY = HERMITE(XX, X, Y, DY) returns an array with evaluated polynom,
%   given array of coordinates XX to evaluate, X, Y and DY containing
%   points which define the Hermitian polynom.
    [n, ~] = size(x);
    f = zeros(2*n, 1);
    f(1) = dy(1);
    f(2) = y(1);
    f_i = 3;
    omega = xx - x(1);
    yy = y(1) + dy(1) * omega;
    
    for i = 2:n
        f(f_i) = y(i);
        for j = f_i-1:-1:1
            f(j) = (f(j+1) - f(j)) / (x(i) - x(ceil(j/2)));
        end
        f_i = f_i + 1;
        omega = omega .* (xx - x(i-1));
        yy = yy + f(1) * omega;
        
        f(f_i) = y(i);
        f(f_i-1) = dy(i);
        for j = f_i-2:-1:1
            f(j) = (f(j+1) - f(j)) / (x(i) - x(ceil(j/2)));
        end
        f_i = f_i + 1;
        omega = omega .* (xx - x(i));
        yy = yy + f(1) * omega;
    end
end