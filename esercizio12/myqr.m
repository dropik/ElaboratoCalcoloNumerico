% Calculates the QR decomposition of a given matrix A
% using Householder transformations, storing information of
% Q and R factors in QR matrix.
%
% @param A - the matrix to calculate QR decomposition for.
%
% @return QR - resulting matrix with Q and R factors.
function QR = myqr(A)
    % Allocating some memory first.
    [~,n] = size(A);
    QR = A;
    tau = zeros(n,1);
    
    % Applying Householder reflections.
    for j = 1:n
        % Calculating H = I-tau*w*w’.
        
        normx = norm(QR(j:end,j));  % ||x||
        s = -sign(QR(j,j));         % sign(aplpha)
        u1 = QR(j,j) - s*normx;     % u1 = x1 - s*||x||
        w = [1; QR(j+1:end,j)/u1];  % w = u/u1
        QR(j+1:end,j) = w(2:end);   % storing reflectors to QR matrix.
        QR(j,j) = s*normx;          % diagonal element.
        tau(j) = -s*u1/normx;       % tau = -s*u1/||x||
        
        % Applying reflection to QR matrix.
        QR(j:end,j+1:end) = QR(j:end,j+1:end)-...
            (tau(j)*w)*(w'*QR(j:end,j+1:end));
    end
return