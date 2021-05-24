function qr = qrfat(a)
% QRFAT  Factorizes a matrix A using QR decomposition.
%
%   QR = QRFAT(A) returns a matrix, containing the upper triangular matrix
%   R and Householder vectors in the lower part.
    [m, n] = size(a);
    
    if (m < n)
        error('qrfat:mLessThanN', 'M must be greater or equal to N');
    end
    
    qr = a;
    
    for i = 1:n
        x = qr(i:m,i);
        nx = norm(x);
        if (nx ~= 0)
            alpha = -sign(x(1)) * nx;
            v = x;
            v(1) = v(1) - alpha;
            v = v / v(1);
        else
            v = x;
            v(1) = 1;
        end
        
        lambda = 2 / norm(v)^2;
        alpha = x(1) - lambda * v' * x;
        qr(i,i) = alpha;
        qr(i+1:m,i) = v(2:m-i+1);
        qr(i:m,i+1:n) = qr(i:m,i+1:n) - lambda * v * (v' * qr(i:m,i+1:n));
    end
end