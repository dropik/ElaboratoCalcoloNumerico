function result = esercizio7()
    tols = [ 1e-3 1e-6 1e-9 1e-12 ];
    methods = cell(12, 1);
    tolerances = cell(12, 1);
    roots = cell(12, 1);
    iterations = cell(12, 1);
    
    for i = 1:4
        [root, it] = newton('func', 'deriv', 1, tols(i));
        methods((i - 1)*3 + 1, 1) = cellstr('newton');
        tolerances((i - 1)*3 + 1, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*3 + 1, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*3 + 1, 1) = num2cell(it);
        
        [root, it] = newtonmod('func', 'deriv', 1, 2, tols(i));
        methods((i - 1)*3 + 2, 1) = cellstr('newton mod.');
        tolerances((i - 1)*3 + 2, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*3 + 2, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*3 + 2, 1) = num2cell(it);
        
        [root, it] = aitken('func', 'deriv', 1, tols(i));
        methods((i - 1)*3 + 3, 1) = cellstr('aitken');
        tolerances((i - 1)*3 + 3, 1) = cellstr(sprintf('%.0e', tols(i)));
        roots((i - 1)*3 + 3, 1) = cellstr(sprintf('%.16e', root));
        iterations((i - 1)*3 + 3, 1) = num2cell(it);
    end
    
    result = table(methods, tolerances, roots, iterations,...
                'VariableNames', { 'Method', 'Tolerance', 'Result', 'Iterations' });
return