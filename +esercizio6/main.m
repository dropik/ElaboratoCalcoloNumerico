function result = main()
    tolerances = [ 1e-3, 1e-6, 1e-9, 1e-12 ];
    tableLength = 16;
    f = @(x) x - cos(x);
    g = @(x) 1 + sin(x);
    x0 = 0;
    x1 = 1;
    a = 0;
    b = 1;
    tableContainer = esercizio6.TableContainer(tableLength);
    methods = { ...
        'bisect',   @(tol) esercizio5.bisect(f, a, b, tol); ...
        'newton',   @(tol) esercizio5.newton(f, g, x0, tol); ...
        'secant',   @(tol) esercizio5.secant(f, x0, x1, tol); ...
        'cord',     @(tol) esercizio5.cord(f, g, x0, tol) ...
    };
    
    for i = 1:4
        tol = tolerances(i);

        for j = 1:4
            methodName = methods{j, 1};
            [result, iterations] = methods{j, 2}(tol);
            tableContainer.addRecord(methodName, tol, result, iterations);
        end
    end

    result = tableContainer.getTable();
return