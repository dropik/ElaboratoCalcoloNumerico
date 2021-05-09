function x = mialdl(a, b)
% MIALDL  solves an equation of type Ax = b, given symmetric positive
% defined matrix A.
%
%   X = MIALDL(A, B) returns vector X of unknowns for equation AX = B,
%   given A matrix symmetric positive defined and B vector of known terms.
    ld = ldlt(a);
    x = ldlsolve(ld, b);
end