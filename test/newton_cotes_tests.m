tol = 1e-10;

%% test for n=1
expectedC = [0.5 0.5];
c = newton_cotes(1);
assert(norm(c - expectedC) <= tol)

%% test for n=2
expectedC = [1/3 4/3 1/3];
c = newton_cotes(2);
assert(norm(c - expectedC) <= tol)

%% test for n=3
expectedC = [3/8 9/8 9/8 3/8];
c = newton_cotes(3);
assert(norm(c - expectedC) <= tol)
