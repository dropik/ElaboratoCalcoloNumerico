function checkInterval(a, b)
    if (a >= b)
        error('inputs:AMustBeLessThanB', 'A should be less than B');
    end
end