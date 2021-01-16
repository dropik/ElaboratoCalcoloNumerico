classdef(Abstract)  WithMaxitTestCase < tests.esercizio5.BaseTestCase
    properties(Access = protected)
        inputMaxit = 70;
    end

    methods(Test, ParameterCombination = 'sequential')
        function testFindRootWithoudMaxit(testCase, input, expectedRoot)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.IsGreaterThan

            % Act
            [result, iterations] = testCase.findRootWithoutMaxit(input);
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedRoot, 'Within', testCase.assertTolerance));
            testCase.assertThat(iterations, IsGreaterThan(1));
        end
    end

    methods(Abstract, Access = protected)
        findRootWithoutMaxit(testCase, input)
    end
end