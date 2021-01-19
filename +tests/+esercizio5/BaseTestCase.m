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
        function setUp(this)
            this.assertTolerance = matlab.unittest.constraints.AbsoluteTolerance(this.assertToleranceAmount);
        end
    end

    methods(Test, ParameterCombination = 'sequential')
        function testRootFind(this, input, expectedRoot)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.IsGreaterThan

            % Act
            result = this.findRoot(input);
            % Assert
            this.assertThat(result, IsEqualTo(expectedRoot, 'Within', this.assertTolerance));
        end
    end

    methods(Abstract, Access = protected)
        findRoot(this, input)
    end
end