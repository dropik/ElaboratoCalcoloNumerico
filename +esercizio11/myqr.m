% Calculates the QR decomposition of a given matrix A
% using Householder transformations, storing information of
% Q and R factors in QR matrix.
%
% @param A - the matrix to calculate QR decomposition for.
%
% @return QR - resulting matrix with Q and R factors.
function QR = myqr(A)
    [m, n] = size(A);
    QR = eye(m);
    limit = min(m - 1, n);
    
    for i = 1:limit
        x = A(i:m, i);
        alpha = norm(x);
        x(1) = x(1) - alpha;
        normx = norm(x);
        if (normx <= eps)
            continue;
        end

        v = x / normx;
        Q = eye(m - i + 1) - 2*(v*v');
        A(i:m, i:n) = Q * A(i:m, i:n);

        if (i == 1)
            QR = Q;
        else
            QR(1:m, i:m) = QR(1:m, i:m) * Q;
        end
    end

    QR = [QR, A];
return