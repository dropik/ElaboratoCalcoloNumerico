function yy = spline_eval(x, y, n, xx, m)
    [xx_n, xx_m] = size(xx);
    xx_size = max(xx_n, xx_m);
    yy = zeros(xx_n, xx_m);
    
    p = 2;
    h_p = x(2) - x(1);
    r = y(1) - h_p^2/6*m(1);
    q = (y(2) - y(1))/h_p - h_p/6 * (m(2) - m(1));
    for i = 1:xx_size
        while ((p < n+1) && (xx(i) > x(p)))
            p = p+1;
            h_p = x(p) - x(p-1);
            r = y(p-1) - h_p^2/6 * m(p-1);
            q = (y(p) - y(p-1)) / h_p - h_p/6 * (m(p) - m(p-1));
        end
        
        yy(i) = ((xx(i) - x(p-1))^3*m(p) + (x(p) - xx(i))^3*m(p-1))/6/h_p + ...
                q*(xx(i) - x(p-1)) + ...
                r;
    end
end