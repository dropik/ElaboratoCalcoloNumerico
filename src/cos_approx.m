f = @(x) cos(x);
n = 10:10:100;
xx = linspace(0, 2*pi, 10001);
yy = f(xx);
err_s = zeros(10, 1);
err_s_nak = zeros(10, 1);
for i = 1:10
    x = linspace(0, 2*pi, n(i)+1);
    y = f(x);
    yy_s = spline0(x, y, xx);
    yy_s_nak = spline_nak(x, y, xx);
    err_s(i) = norm(yy - yy_s);
    err_s_nak(i) = norm(yy - yy_s_nak);
end