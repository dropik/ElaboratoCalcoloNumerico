function checkSecantInputs(x0, x1, tol, maxit)
    checks.checkNumericInput(x0, 'X0');
    checks.checkNumericInput(x1, 'X1');
    checks.checkNumericInput(tol, 'Tolerance');
    checks.checkNumericInput(maxit, 'Maxit');
    checks.checkTolerance(tol);
    checks.checkMaxit(maxit);
    checkX0X1(x0, x1);
end