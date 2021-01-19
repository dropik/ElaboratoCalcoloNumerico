classdef AitkenRootEnumeratorTests < tests.esercizio5.WithMaxitRootEnumeratorTests
    properties (Access = private)
        f = @(x) x.^2 * tan(x);
        g = @(x) x*(2*tan(x) + x*sec(x).^2);
    end

    properties (TestParameter)
        input = { 1, -1 };
        expectedInitialResult = { 0.545768281997613, -0.545768281997613 };
        expectedResult = { -1.590174943399898, 1.590174943399898 };
        expectedSecondResult = { -1.571027884342966, 1.571027884342966 };
    end

    properties (Access = protected)
        regularInput = 1;
        almostRootInput = 1e-4;
        requireIterationForStopCriteria = true;
    end

    methods (Access = protected)
        function enumerator = createEnumerator(this, input, maxit)
            enumerator = esercizio7.AitkenRootEnumerator(this.f, this.g, input, 1e-3, maxit);
        end
    end
end