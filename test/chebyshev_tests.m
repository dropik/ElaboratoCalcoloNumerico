tol = 1e-10;
n = 3;

%% test on interval [-1; 1]
expectedX = [-0.9238795325; -0.3826834324; 0.3826834324; 0.9238795325];
x = chebyshev(-1, 1, n);
assert(norm(x - expectedX) <= tol)

%% test on interval [-5; 5]
expectedX = [-4.619397662556434; -1.913417161825449; 1.913417161825449; 4.619397662556434];
x = chebyshev(-5, 5, n);
assert(norm(x - expectedX) <= tol)

%% test on interval [-3; 2]
expectedX = [-2.809698831278217; -1.456708580912724; 0.456708580912724; 1.809698831278217];
x = chebyshev(-3, 2, n);
assert(norm(x - expectedX) <= tol)
