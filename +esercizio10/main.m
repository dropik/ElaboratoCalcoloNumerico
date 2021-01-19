n = 10;
xref = (1:10)';
for i = 1:10
    [A,b] = esercizio10.linsis(n,i);
    [LU,p] = esercizio8.palu(A);
    x = esercizio9.lusolve(LU,p,b);
    disp(norm(x-xref))
end