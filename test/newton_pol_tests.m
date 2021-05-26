tol = 1e-10;

%% test calculations
x = [1;2;3];
y = [5;26;83];
xx = [2;3];
expectedYY = [26;83];
yy = newton_pol(xx, x, y);
assert(norm(yy - expectedYY) <= tol)

%% x and y mismatch
x = [1;2;3];
y = [5;26];
xx = [2;3];
try
    yy = newton_pol(xx, x, y);
    assert(false, 'Should have thrown the exception')
catch err
    assert(strcmp(err.identifier, 'newton_pol:xAndYMismatch'))
end
