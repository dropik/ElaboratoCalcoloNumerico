function ld = ldlt(a)
    [m, n] = size(a);
    if (m ~= n)
        error('mialdl:notSquare', 'Given matrix is not square');
    end
    
    ld = a;

    for j = 1:n
        diff = 0;
        ljkdk = zeros(1, j-1);
        
        if (ld(j,j) <= 0)
            error('mialdl:notSpd', 'Given matrix is not spd');
        end
        
        for k = 1:j-1
            ljkdk(k) = ld(j,k) * diag(ld(k,k));
            diff = diff + ld(j,k) * ljkdk(k);
        end
        ld(j,j) = ld(j,j) - diff;
        
        k = 1:j-1;
        for i = j+1:n
            if (ld(i,j) ~= ld(j, i))
                error('mialdl:notSpd', 'Given matrix is not spd');
            end
            
            ld(i,j) = (ld(i,j) - sum(ld(i,k) .* ljkdk)) / ld(j,j);
        end
    end
end