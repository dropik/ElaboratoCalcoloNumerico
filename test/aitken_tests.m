tol = 1e-10;

%% f(x) = x * sin(x)
f = @(x) x * sin(x);
g = @(x) sin(x) + x * cos(x);
x = aitken(f, g, 1, tol);
assert(abs(x) <= tol)

%% f(x) = (x - 1)^3
f = @(x) (x - 1)^3;
g = @(x) 3 * (x - 1)^2;
x = aitken(f, g, 0, tol);
assert(abs(x - 1) <= tol)
