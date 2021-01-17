function checkNewtonmodInputs(x0, r, tol, maxit)
    checks.checkNumericInput(x0, 'X0');
    checkR(r);
    checks.checkTolerance(tol);
    checks.checkMaxit(maxit);
end