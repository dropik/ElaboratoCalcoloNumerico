tol = 1e-10;
f = @(x) sin(x);

%% x0 = 2, x1 = 3
x = secant(f, 2, 3, tol);
assert(abs(x - pi) <= tol)

%% x0 = 0.2, x1 = 0.1
x = secant(f, 0.2, 0.1, tol);
assert(abs(x) <= tol)
