n = 10;
xref = (1:10)';
for i = 1:10
    [A,b] = linsis(n,i);
    [LU,p] = palu(A);
    x = lusolve(LU,p,b);
    disp(norm(x-xref))
end