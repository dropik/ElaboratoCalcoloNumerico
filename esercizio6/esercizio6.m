function result = esercizio6()
    tols = [ 1e-3 1e-6 1e-9 1e-12 ];
    methods = cell(16, 1);
    tolerances = cell(16, 1);
    roots = cell(16, 1);
    iterations = cell(16, 1);
    
    for i = 1:4
        [root, it] = bisect('func', 0, 1, tols(i));
        methods((i - 1)*4 + 1, 1) = cellstr('bisect');
        tolerances((i - 1)*4 + 1, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*4 + 1, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*4 + 1, 1) = num2cell(it);
        
        [root, it] = newton('func', 'deriv', 0, tols(i));
        methods((i - 1)*4 + 2, 1) = cellstr('newton');
        tolerances((i - 1)*4 + 2, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*4 + 2, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*4 + 2, 1) = num2cell(it);
        
        [root, it] = secant('func', 0, 1, tols(i));
        methods((i - 1)*4 + 3, 1) = cellstr('secant');
        tolerances((i - 1)*4 + 3, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*4 + 3, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*4 + 3, 1) = num2cell(it);
        
        [root, it] = cord('func', 0, 1, tols(i));
        methods((i - 1)*4 + 4, 1) = cellstr('cord');
        tolerances((i - 1)*4 + 4, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*4 + 4, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*4 + 4, 1) = num2cell(it);
    end
    
    result = table(methods, tolerances, roots, iterations,...
                'VariableNames', { 'Method', 'Tolerance', 'Result', 'Iterations' });
return