function [x] = forward(l, p, b)
    [n, ~] = size(l);
    x = zeros(n, 1);
    x(1) = b(p(1));

    for i = 2:n
        sum = 0;
        for j = 1:i-1
            sum = sum + l(i, j) * x(j);
        end
        
        x(i) = b(p(i)) - sum;
    end
end