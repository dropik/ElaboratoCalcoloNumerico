classdef(Abstract)  WithMaxitTestCase < tests.esercizio5.BaseTestCase
    properties(Access = protected)
        inputMaxit = 70;
    end

    methods(Test, ParameterCombination = 'sequential')
        function testFindRootWithoudMaxit(this, input, expectedRoot)
            import matlab.unittest.constraints.IsEqualTo
            import matlab.unittest.constraints.IsGreaterThan

            % Act
            [result, iterations] = this.findRootWithoutMaxit(input);
            % Assert
            this.assertThat(result, IsEqualTo(expectedRoot, 'Within', this.assertTolerance));
            this.assertThat(iterations, IsGreaterThan(1));
        end
    end

    methods(Abstract, Access = protected)
        findRootWithoutMaxit(this, input)
    end
end