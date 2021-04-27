tol = 1e-10;
f = @(x) sin(x);

%% [-0.1, 0.1]
result = bisect(f, -0.1, 0.1, tol);
assert(abs(result) <= tol)

%% [3, 4]
result = bisect(f, 3, 4, tol);
assert(abs(result - pi) <= tol)

%% [0, 0.1]
result = bisect(f, 0, 0.1, tol);
assert(abs(result) <= tol)

%% [-0.1, 0]
result = bisect(f, -0.1, 0, tol);
assert(abs(result) <= tol)

%% inverted a and b
result = bisect(f, 0.2, -0.1, tol);
assert(abs(result) <= tol)
