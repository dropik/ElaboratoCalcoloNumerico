function [x] = backward(u, b)
    [n, ~] = size(u);
    x = zeros(n, 1);
    x(n) = b(n) / u(n, n);

    for i = linspace(n - 1, 1, n - 1)
        sum = 0;
        for j = i+1:n
            sum = sum + u(i, j) * x(j);
        end

        x(i) = (b(i) - sum) / u(i, i);
    end
end