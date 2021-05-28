function yy = hermite_lagrange(xx, x, y, dy)
% HERMITE_LAGRANGE  evaluates a Hermite interpolation polynomial written in
% Lagrange basis.
%
%   YY = HERMITE_LAGRANGE(XX, X, Y, DY) returns an array of evaluated
%   polynomial given XX coordinates of points to evaluate, X, Y and DY
%   points of original function and its derivative, which define the
%   polynomial.
    [n, ~] = size(x);
    yy = 0;
    
    for i = 1:n
        l = 1;
        dl_xi = 0;
        for j = 1:n
            if (i ~= j)
                l = l .* (xx - x(j)) / (x(i) - x(j));
                dl_xi = dl_xi + 1 / (x(i) - x(j));
            end
        end
        
        phi = l.^2 .* (1 - 2*(xx - x(i)) * dl_xi);
        psi = (xx - x(i)) .* l.^2;
        yy = yy + y(i)*phi + dy(i)*psi;
    end
end