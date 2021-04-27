function y = seno(x)
    y = x;
    term = x;
    sign = -1;
    power = 3;
    epsConfront = abs(term) > eps(y);
    
    % Iterating until there are significant terms.
    while (sum(epsConfront) > 0)
        % Current term of Taylor series of sin(x) function, i.e. x^power/power!
        term = term .* epsConfront .* x .* x / (power - 1) / power;
        
        epsConfront = abs(term) > eps(y);
        y = y + sign * term;
        sign = sign * -1;
        power = power + 2;
    end
end

