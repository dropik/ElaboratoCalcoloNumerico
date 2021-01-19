classdef CordRootEnumeratorTests < tests.esercizio5.WithMaxitRootEnumeratorTests
    properties (Access = private)
        f = @(x) x^2;
        g = @(x) 2*x;
    end

    properties (TestParameter)
        input = { 1, -1 };
        expectedInitialResult = { 1, -1 };
        expectedResult = { 0.5, -0.5 };
        expectedSecondResult = { 0.375, -0.375 }
    end

    properties (Access = protected)
        regularInput = 1;
        almostRootInput = 1e-4;
        requireIterationForStopCriteria = true;
    end

    methods (Access = protected)
        function enumerator = createEnumerator(this, input, maxit)
            enumerator = esercizio5.CordRootEnumerator(this.f, this.g, input, 1e-3, maxit);
        end
    end
end