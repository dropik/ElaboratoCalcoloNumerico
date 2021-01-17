function checkAitkenInputs(x0, tol, maxit)
    checks.checkNumericInput(x0, 'X0');
    checks.checkTolerance(tol);
    checks.checkMaxit(maxit);
end