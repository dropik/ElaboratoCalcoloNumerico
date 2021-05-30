tol = 1e-10;

%% n=1 grade polynomial
f = @(x) x + 2;
expectedI = 3.5;
I = simpson_adaptive(f, 1, 2, tol);
assert(abs(I - expectedI) <= tol)

%% xsin(3x)
f = @(x) x .* sin(3*x);
expectedI = 0.26368754255;
I = simpson_adaptive(f, 0, pi/4, tol);
assert(abs(I - expectedI) <= tol)
