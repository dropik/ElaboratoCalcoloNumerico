tol = 1e-10;

%% test calculations
x = [1; 2; 3];
y = [5; 6; 7];
xx = [2 3];
expectedYY = [6 7];
yy = spline0(x, y, xx);
assert(norm(yy - expectedYY) <= tol)

%% test xx as column
x = [1; 2; 3];
y = [5; 6; 7];
xx = [2; 3];
expectedYY = [6; 7];
yy = spline0(x, y, xx);
assert(norm(yy - expectedYY) <= tol)

%% test points as row
x = [1 2 3];
y = [5 6 7];
xx = [2; 3];
expectedYY = [6; 7];
yy = spline0(x, y, xx);
assert(norm(yy - expectedYY) <= tol)
