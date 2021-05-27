function x = chebyshev(a, b, n)
% CHEBYSHEV  gives a vector containing n+1 Chebyshev nodes on interval
% [a,b].
%
%   X = CHEBYSHEV(A, B, N) returns vector X with nodes given [A, B] the
%   interval and N the grade of polynomial. So the size of vector X will be
%   N+1.
    x = zeros(n+1, 1);
    shift = (a + b) / 2;
    range = (b - a) / 2;
    
    for i = 0:n
        x(n+1-i) = cos((2*i + 1)*pi / 2/(n + 1));
        x(n+1-i) = shift + range * x(n+1-i);
    end
end