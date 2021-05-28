tol = 1e-10;

%% test calculations
x = [1; 2; 3];
y = [4; 5; 6];
dy = [1; 0; 1];
xx = [2; 3];
expectedYY = [5; 6];
yy = hermite(xx, x, y, dy);
assert(norm(yy - expectedYY) <= tol)

%% test derivative
x = [1; 2; 3];
y = [4; 5; 6];
dy = [1; 0; 2];
xx = [x(3); x(3) + 2*eps(x(3))];
yy = hermite(xx, x, y, dy);
dyy = (yy(2) - yy(1)) / (xx(2) - xx(1));
expectedDYY = dy(3);
assert(norm(dyy - expectedDYY) <= tol)
