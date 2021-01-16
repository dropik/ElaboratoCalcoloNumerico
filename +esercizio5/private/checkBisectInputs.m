function checkBisectInputs(a, b, tol)
    checks.checkNumericInput(a, 'A');
    checks.checkNumericInput(b, 'B');
    checks.checkNumericInput(tol, 'Tolerance');
    checks.checkTolerance(tol);
    checkInterval(a, b);
end