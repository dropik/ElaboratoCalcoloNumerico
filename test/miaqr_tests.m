tol = 1e-10;

%% test 1
qr = [1 2 3; 4 5 6; 7 8 9];
b = [1; 2; 3];
expectedX = [
    6.383216783216783e-01;
    3.367832167832169e-01;
    -4.069930069930070e-01;
];
x = miaqr(qr, b);
assert(norm(x - expectedX) <= tol)

%% m is less than n
qr = [1 2 3; 4 5 6];
b = zeros(3, 1);
try
    x = miaqr(qr, b);
    assert(false, 'Should have thrown the exception')
catch err
    assert(strcmp(err.identifier, 'miaqr:mLessThanN'))
end

%% qr and b size mismatch
qr = [1 2 3; 4 5 6; 7 8 9];
b = zeros(2, 1);
try
    x = miaqr(qr, b);
    assert(false, 'Should have thrown the exception')
catch err
    assert(strcmp(err.identifier, 'miaqr:qrAndBMismatch'))
end
