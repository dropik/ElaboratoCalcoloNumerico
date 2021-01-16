classdef(Abstract) BaseTestCase < matlab.unittest.TestCase
    properties(Abstract, TestParameter)
        input
        expectedRoot
    end

    properties(Abstract, Access = protected)
        assertToleranceAmount
    end

    properties(Access = protected)
        f = @(x) 2 * sin(3 * x);
        assertTolerance;
        inputTolerance = 1e-15;
    end

    methods(TestMethodSetup)
        function setUp(testCase)
            testCase.assertTolerance = matlab.unittest.constraints.AbsoluteTolerance(testCase.assertToleranceAmount);
        end
    end

    methods(Test, ParameterCombination = 'sequential')
        function testRootFind(testCase, input, expectedRoot)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.IsGreaterThan

            % Act
            result = testCase.findRoot(input);
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedRoot, 'Within', testCase.assertTolerance));
        end
    end

    methods(Abstract, Access = protected)
        findRoot(testCase, input)
    end
end