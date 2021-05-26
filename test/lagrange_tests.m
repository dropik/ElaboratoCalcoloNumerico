tol = 1e-10;

%% test calculations for y(x) = 2 + 3x^3
x = [1; 2; 3];
y = [5; 26; 83];
xx = [2; 3];
expectedYY = [26; 83];
yy = lagrange(xx, x, y);
assert(norm(yy - expectedYY) <= tol)

%% test x and y sizes mismatch
x = [1; 2; 3];
y = [5; 26];
xx = [2; 3];
try
    yy = lagrange(xx, x, y);
    assert(false, 'Should have thrown the exception')
catch err
    assert(strcmp(err.identifier, 'lagrange:xAndYMismatch'))
end
