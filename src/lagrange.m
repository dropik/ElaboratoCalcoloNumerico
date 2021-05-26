function yy = lagrange(xx, x, y)
% LAGRANGE evaluates polynomial interpolation in Lagrange form.
%
%   YY = LAGRANGE(XX, X, Y) returns vector YY of evaluated polynom, given
%   XX vector to evaluate polynom on, X and Y containing points to use for
%   calculating Lagrange form.
    [n, ~] = size(x);
    [nY, ~] = size(y);
    if (n ~= nY)
        error('lagrange:xAndYMismatch', 'The sizes of x and y vectors mismatch');
    end
    
    yy = 0;
    
    for i = 1:n
        l = 1;
        for j = 1:n
            if (i ~= j)
                l = l .* (xx - x(j)) / (x(i) - x(j));
            end
        end
        
        yy = yy + y(i) * l;
    end
end