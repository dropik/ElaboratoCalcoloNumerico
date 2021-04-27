tol = 1e-10;
f = @(x) sin(x);
g = @(x) cos(x);

%% x0 = 3
x = cord(f, g, 3, tol);
assert(abs(x - pi) <= tol)

%% x0 = 0.1
x = cord(f, g, 0.1, tol);
assert(abs(x) <= tol)
