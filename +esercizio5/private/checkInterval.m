function checkInterval(a, b)
    checks.checkNumericInput(a, 'A');
    checks.checkNumericInput(b, 'B');
    
    if (a >= b)
        error('inputs:AMustBeLessThanB', 'A should be less than B');
    end
end