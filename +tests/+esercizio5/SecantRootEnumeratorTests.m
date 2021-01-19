classdef SecantRootEnumeratorTests < tests.esercizio5.WithMaxitRootEnumeratorTests
    properties (Access = private)
        f = @(x) x^2;
    end

    properties (TestParameter)
        input = { [2, 1], [-2, -1] };
        expectedInitialResult = { 1, -1 };
        expectedResult = { 0.6666666667, -0.6666666667 }
        expectedSecondResult = { 0.4, -0.4 }
    end

    properties (Access = protected)
        regularInput = [2, 1];
        almostRootInput = [2e-4, 1e-4];
        requireIterationForStopCriteria = false;
    end

    methods (Access = protected)
        function enumerator = createEnumerator(this, input, maxit)
            enumerator = esercizio5.SecantRootEnumerator(this.f, input(1), input(2), 1e-3, maxit);
        end
    end
end