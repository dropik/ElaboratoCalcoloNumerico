classdef ModifiedNewtonRootEnumeratorTests < tests.esercizio5.WithMaxitRootEnumeratorTests
    properties (Access = private)
        f = @(x) x.^2 * tan(x);
        g = @(x) x*(2*tan(x) + x*sec(x).^2);
    end

    properties (TestParameter)
        input = { 1, -1 };
        expectedInitialResult = { 1, -1 };
        expectedResult = { 0.285629299513506, -0.285629299513506 };
        expectedSecondResult = { 0.005283019045754, -0.005283019045754 };
    end

    properties (Access = protected)
        regularInput = 1;
        almostRootInput = 1e-4;
        requireIterationForStopCriteria = true;
    end

    methods (Access = protected)
        function enumerator = createEnumerator(this, input, maxit)
            enumerator = esercizio7.ModifiedNewtonRootEnumerator(this.f, this.g, input, 3, 1e-3, maxit);
        end
    end
end