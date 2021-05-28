function m = spline_coefs(x, y, n)
    m = zeros(n+1, 1);
    
    d = zeros(n+1, 1);
    d(1) = 1;
    
    f_xprev_xi = (y(2) - y(1)) / (x(2) - x(1));
    f_xi_xnext = (y(3) - y(2)) / (x(3) - x(1));
    f = (f_xi_xnext - f_xprev_xi) / (x(3) - x(1));
    
    m(1) = 6 * f;
    
    phi = (x(2) - x(1)) / (x(3) - x(1));
    phi_1 = phi;
    m(2) = m(1) * (1 - phi);
    
    d(2) = 2 - phi;
    xi = (x(3) - x(2)) / (x(3) - x(1)) - phi;
    xi_1 = xi;
    
    % The LU factorization of the matrix is integrated into first loop
    % along with solving Ly=b.
    for i = 3:n-1
        h_i = x(i) - x(i-1);
        h_i1 = x(i+1) - x(i);
        h_i_i1 = h_i + h_i1;
        
        f_xprev_xi = (y(i) - y(i-1)) / h_i;
        f_xi_xnext = (y(i+1) - y(i)) / h_i1;
        f = (f_xi_xnext - f_xprev_xi) / h_i_i1;
        
        phi = h_i / h_i_i1 / d(i-1);
        
        m(i) = 6*f - phi*m(i-1);
        
        d(i) = 2 - phi*xi;
        xi = (x(i+1) - x(i)) / h_i_i1;
    end
    
    f_xprev_xi = (y(n) - y(n-1)) / (x(n) - x(n-1));
    f_xi_xnext = (y(n+1) - y(n)) / (x(n+1) - x(n));
    f = (f_xi_xnext - f_xprev_xi) / (x(n+1) - x(n-1));
    
    xi_n2 = xi;
    xi = (x(n+1) - x(n)) / (x(n+1) - x(n-1));
    phi = ((x(n) - x(n-1)) / (x(n+1) - x(n-1)) - xi) / d(n-1);
    
    m(n) = 6*f - phi*m(n-1);
    m(n+1) = 6*f;
    
    d(n) = 2 - xi - phi*xi_n2;
    d(n+1) = 1;
    
    % Solving Um=y.
    for i = n:-1:3
        xi = (x(i+1) - x(i)) / (x(i+1) - x(i-1));
        m(i) = (m(i) - xi*m(i+1)) / d(i);
    end
    m(2) = (m(2) - (xi_1 - phi_1)*m(3)) / d(2);
    
    m(1) = m(1) - m(2) - m(3);
    m(n+1) = m(n+1) - m(n) - m(n-1);
end