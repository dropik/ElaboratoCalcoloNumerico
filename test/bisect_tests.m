tol = 1e-10;
f = @(x) sin(x);

%% [-0.1, 0.1]
x = bisect(f, -0.1, 0.1, tol);
assert(abs(x) <= tol)

%% [3, 4]
x = bisect(f, 3, 4, tol);
assert(abs(x - pi) <= tol)

%% [0, 0.1]
x = bisect(f, 0, 0.1, tol);
assert(abs(x) <= tol)

%% [-0.1, 0]
x = bisect(f, -0.1, 0, tol);
assert(abs(x) <= tol)

%% inverted a and b
x = bisect(f, 0.2, -0.1, tol);
assert(abs(x) <= tol)
