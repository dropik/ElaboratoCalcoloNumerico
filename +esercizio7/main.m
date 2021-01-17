function result = main()
    tolerances = [ 1e-3, 1e-6, 1e-9, 1e-12 ];
    tableLength = 12;
    f = @(x) x^2 * tan(x);
    g = @(x) x*(2*tan(x) + x*sec(x)^2);
    x0 = 1;
    r = 3;
    tableContainer = esercizio6.TableContainer(tableLength);
    methods = { ...
        'newton',   @(tol) esercizio5.newton(f, g, x0, tol); ...
        'newton mod.',   @(tol) esercizio7.newtonmod(f, g, x0, r, tol); ...
        'aitken',     @(tol) esercizio7.aitken(f, g, x0, tol) ...
    };
    
    for i = 1:4
        tol = tolerances(i);

        for j = 1:3
            methodName = methods{j, 1};
            [result, iterations] = methods{j, 2}(tol);
            tableContainer.addRecord(methodName, tol, result, iterations);
        end
    end

    result = tableContainer.getTable();
return