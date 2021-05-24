tol = 1e-10;

%% test 1
a = [1 2 3; 4 5 6; 7 8 9];
expectedQR = [
    -8.124038404635961e+00 -9.601136296387951e+00 -1.107823418813994e+01;
     4.384023633622129e-01 9.045340337332888e-01 1.809068067466580e+00;
     7.672041358838726e-01 9.090763329192914e-01 -1.776356839400250e-15
];
qr = qrfat(a);
assert(norm(qr - expectedQR) <= tol)

%% test m less than n
a = [1 2 3; 4 5 6];
try
    qr = qrfat(a);
    assert(false, 'Should have thrown the exception')
catch err
    assert(strcmp(err.identifier, 'qrfat:mLessThanN'))
end
