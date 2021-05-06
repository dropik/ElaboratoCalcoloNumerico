tol = 1e-10;

%% giagonal elements are not zeroed.
a = [1 2 3; 4 5 6; 7 8 9];
[lu, p] = plu(a);
expected = [
    7.000000000000000e+00 8.000000000000000e+00 9.000000000000000e+00;
    1.428571428571428e-01 8.571428571428572e-01 1.714285714285714e+00;
    5.714285714285714e-01 5.000000000000002e-01 1.110223024625157e-16;
];
expectedP = [3 1 2];
diff = expected - lu;
errors = abs(diff);
maxError = max(max(errors));
assert(maxError <= tol)
assert(sum(expectedP - p) == 0)

%% zeroes on diagonal
a = [0 1 2; 3 0 4; 5 6 0];
[lu, p] = plu(a);
expected = [
    5 6 0;
    6.000000000000001e-01 -3.600000000000001e+00 4;
    0 -2.777777777777777e-01 3.111111111111111e+00;
];
expectedP = [3 2 1];
diff = expected - lu;
errors = abs(diff);
maxError = max(max(errors));
assert(maxError <= tol)
assert(sum(expectedP - p) == 0)

%% a is singular
a = [0 1 2; 0 3 4; 0 5 6];
try
    plu(a);
    assert(false, 'Error should be thrown on singular matrix')
catch err
    assert(strcmp(err.identifier, 'plu:singular'))
end

%% a is non-square
a = [1 2; 3 4; 5 6];
try
    plu(a);
    assert(false, 'Error should be thrown on non-square matrix')
catch err
    assert(strcmp(err.identifier, 'plu:nonSquare'))
end