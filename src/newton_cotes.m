function c = newton_cotes(n)
% NEWTON_COTES  calculates coefficients for Newton-Cotes formula.
%
%   C = NEWTON_COTES(N) returns an array containing coefficients for
%   Newton-Cotes formula given the grade N.
    c = zeros(1, n+1);
    
    sum = 0;
    half = floor(n/2);
    for k = 0:half-1
        coefs = zeros(n+1, 1);
        
        coefs(1) = 1;
        grade = 0;
        for j = 0:n
            if (j == k)
                continue;
            end
            
            next = 0;
            grade = grade + 1;
            for i = 1:grade
                cur = next + coefs(i) * -j / (k - j);
                next = coefs(i) * 1 / (k - j);
                coefs(i) = cur;
            end
            coefs(grade+1) = next;
        end
        
        n_power = 1;
        for i = 1:n+1
            n_power = n_power * n;
            c(k+1) = c(k+1) + coefs(i) * n_power / i;
        end
        c(n+1-k) = c(k+1);
        sum = sum + 2*c(k+1);
    end
    
    r = mod(n,2);
    half = half+1;
    if (r == 1)
        c(half) = (n - sum) / 2;
        c(half+1) = c(half);
    else
        c(half) = n - sum;
    end
end