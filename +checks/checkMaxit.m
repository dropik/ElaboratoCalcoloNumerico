function checkMaxit(maxit)
    if (maxit < 0)
        error('inputs:MaxitMustBePositive', 'Maxit must be a positive value');
    elseif (maxit == 0)
        error('inputs:MaxitMustBeAtLeast1', 'Maxit must be equal to at least 1');
    end
end