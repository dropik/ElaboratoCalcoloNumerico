function checkNewtonInputs(x0, tol, maxit)
    checks.checkNumericInput(x0, 'X0');
    checks.checkNumericInput(tol, 'Tolerance');
    checks.checkNumericInput(maxit, 'Maxit');
    checks.checkTolerance(tol);
    checks.checkMaxit(maxit);
end