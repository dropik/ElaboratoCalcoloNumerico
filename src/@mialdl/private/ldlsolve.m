function x = ldlsolve(ld, b)
    [~, n] = size(ld);
    [bM, bN] = size(b);
    if ((bM ~= n) && (bN ~= n))
        error('mialdl:aAndBMismatch', 'A and b sizes do not match');
    end
    
    x = zeros(n, 1);
    for i = 1:n
        k = 1:i-1;
        x(i) = b(i) - sum(x(k)' .* ld(i,k));
    end
    
    for i = 0:n-1
        k = n-i+1:n;
        x(n-i) = x(n-i) / ld(n-i,n-i) - sum(x(k) .* ld(k,n-i));
    end
end