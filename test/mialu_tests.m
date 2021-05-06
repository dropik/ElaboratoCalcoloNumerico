tol = 1e-10;

%% pivoting is not involved
p = [1 2 3];
lu = [1 2 3; 2 1 4; 3 4 1];
b = [1; 2; 3];
expectedX = [1; 0; 0];
x = mialu(lu, p, b);
assert(max(abs(expectedX - x)) <= tol)

%% pivoting is involved
p = [3 1 2];
lu = [1 2 3; 2 1 4; 3 4 1];
b = [1; 2; 3];
expectedX = [78; -57; 13];
x = mialu(lu, p, b);
assert(max(abs(expectedX - x)) <= tol)

%% U is singular
lu = [0 2 3; 2 1 4; 3 4 1];
p = [1 2 3];
b = [1; 2; 3];
try
    mialu(lu, p, b);
    assert(false, 'Should throw the exception');
catch err
    assert(strcmp(err.identifier, 'mialu:uIsSingular'))
end

%% LU is non-square
lu = zeros(3, 2);
p = zeros(1, 3);
b = zeros(3, 1);
try
    mialu(lu, p, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialu:nonSquare'))
end

%% p size is not matching
lu = zeros(3, 3);
p = zeros(1, 2);
b = zeros(3, 1);
try
    mialu(lu, p, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialu:pSizeMismatch'))
end

%% b size is not matching
lu = zeros(3, 3);
p = zeros(1, 3);
b = zeros(2, 1);
try
    mialu(lu, p, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialu:bSizeMismatch'))
end
