tol = 1e-10;

%% A is spd
a = [2 -1 0; -1 2 -1; 0 -1 2];
b = [1; 2; 3];
expectedX = [
    2.500000000000000e+00;
     4.000000000000002e+00;
     3.500000000000000e+00
];
x = mialdl(a, b);
assert(max(abs(expectedX - x)) <= tol)

%% A is not spd and has zero on diagonal
a = [0 -1 0; -1 2 -1; 0 -1 2];
b = zeros(3, 1);
try
    x = mialdl(a, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialdl:notSpd'))
end

%% A is not spd and has negative on diagonal
a = [-1 -1 0; -1 2 -1; 0 -1 2];
b = zeros(3, 1);
try
    x = mialdl(a, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialdl:notSpd'))
end

%% A is not spd and is not simmetric
a = [2 -1 0; -2 2 -1; 0 -1 2];
b = zeros(3, 1);
try
    x = mialdl(a, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialdl:notSpd'))
end

%% A is not square
a = [1 2; 3 4; 5 6];
b = zeros(3, 1);
try
    x = mialdl(a, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialdl:notSquare'))
end

%% A and b sizes do not match
a = [2 -1 0; -1 2 -1; 0 -1 2];
b = zeros(2, 1);
try
    x = mialdl(a, b);
    assert(false, 'Should throw the exception')
catch err
    assert(strcmp(err.identifier, 'mialdl:aAndBMismatch'))
end
