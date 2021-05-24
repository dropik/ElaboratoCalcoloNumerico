function x = miaqr(qr, b)
% MIAQR  Solves an equation of type AX = b, where A is factorized by QR
% decomposition.
%
%   X = MIAQR(QR, B) returns the vector containing a solution for the
%   equation QRX=B, where factors Q and R are stored in the matrix QR and B
%   is the vector of known terms of equation.
    [m, n] = size(qr);
    
    if (m < n)
        error('miaqr:mLessThanN', 'M must be greater or equal to N');
    end
    
    [bM, ~] = size(b);
    if (bM ~= m)
        error('miaqr:qrAndBMismatch', 'Vector B and matrix QR columns number mismatch');
    end
    
    y = b;
    for i = 1:n
        v = qr(i:m,i);
        v(1) = 1;
        lambda = 2 / norm(v)^2;
        y(i:m) = y(i:m) - lambda * v * (v' * y(i:m));
    end
    
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = (y(i) - sum(qr(i,i+1:n) .* x(i+1:n)')) / qr(i,i);
    end
end