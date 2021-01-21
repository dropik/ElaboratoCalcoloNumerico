% Solves a system of linear equations Ax=b, using the QR
% decomposition of matrix A.
%
% @param QR - QR decomposition matrix with Q and R factors.
% @param b - b vector of Ax=b system.
%
% @return x - system resolution vector.
function x = qrsolve(QR, b)
    [m, mn] = size(QR);
    Q = QR(1:m, 1:m);
    R = QR(1:m, m+1:mn);
    c = Q'*b;
    x = R\c;
return