function m = spline_coefs(x, y, n)
    m = zeros(n+1, 1);
    
    d = zeros(n, 1);        % We allocate n values instead of needed n-1
    d(1) = 2;               % for diagonal values of the matrix to avoid
                            % additional branching in the loop.
    
    % The LU factorization of the matrix is integrated into first loop
    % along with solving Ly=b.
    for i = 2:n
        h_i = x(i) - x(i-1);
        h_i1 = x(i+1) - x(i);
        h_i_i1 = h_i + h_i1;
        
        f_xprev_xi = (y(i) - y(i-1)) / h_i;
        f_xi_xnext = (y(i+1) - y(i)) / h_i1;
        f = (f_xi_xnext - f_xprev_xi) / h_i_i1;
        
        phi = h_i / h_i_i1 / d(i-1);
        
        m(i) = 6*f - phi*m(i-1);
        
        xi = h_i1 / h_i_i1;
        d(i) = 2 - phi*xi;
    end
    
    % Solving Um=y.
    for i = n:-1:2
        xi = (x(i+1) - x(i)) / (x(i+1) - x(i-1));
        m(i) = (m(i) - xi*m(i+1)) / d(i-1);
    end
end