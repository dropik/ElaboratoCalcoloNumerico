tol = 1e-10;

%% x = 0
result = seno(0);
assert(result == 0)

%% x = pi/2
result = seno(pi/2);
assert(abs(result - 1) <= tol)

%% x = pi/4
result = seno(pi/4);
assert(abs(result - 0.7071067812) <= tol)

%% x = pi
result = seno(pi);
assert(abs(result) <= tol)

%% negative x
result = seno(-pi/2);
assert(abs(result + 1) <= tol)

%% tiny angle
result = seno(1e-20);
assert(abs(result - 1e-20) <= 1e-30);

%% x is row
x = [ -pi/2, 0, pi/2 ];
result = seno(x);
expected = [ -1, 0, 1 ];
errors = abs(result - expected);
for i = 1:3
    assert(errors(i) <= tol)
end
