function checkTolerance(tol)
    checks.checkNumericInput(tol, 'Tolerance');
    if (tol <= 0)
        error('inputs:ToleranceMustBePositive', 'Tolerance must be a positive value');
    end
end