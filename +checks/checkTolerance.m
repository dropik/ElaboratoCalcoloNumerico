function checkTolerance(tol)
    if (tol <= 0)
        error('inputs:ToleranceMustBePositive', 'Tolerance must be a positive value');
    end
end