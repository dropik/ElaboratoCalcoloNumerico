% Solves a system of linear equations Ax=b, using the QR
% decomposition of matrix A.
%
% @param QR - QR decomposition matrix with Q and R factors.
% @param A - A matrix of Ax=b system.
% @param b - b vector of Ax=b system.
%
% @return x - system resolution vector.
function x = qrsolve(QR, A, b)
    % The least squares approximate solution to A*x = b can be found
    % with the Q-less QR decomposition and one step of iterative refinement:
    R = triu(QR);
    x = R\(R'\(A'*b));
    r = b - A*x;
    e = R\(R'\(A'*r));
    x = x + e;
return