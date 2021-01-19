classdef (Abstract) BaseRootEnumeratorTests < matlab.unittest.TestCase
    properties (Abstract, TestParameter)
        input;
        expectedInitialResult;
        expectedResult;
        expectedSecondResult;
    end

    properties (Access = private)
        assertTolerance = matlab.unittest.constraints.AbsoluteTolerance(1e-9);
    end

    methods (Abstract, Access = protected)
        arrangeEnumerator(this, input);
    end

    methods (Test, ParameterCombination = 'sequential')
        function testNeverMoveNext(this, input, expectedInitialResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = this.arrangeEnumerator(input);
            % Act
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            this.assertThat(result, IsEqualTo(expectedInitialResult, 'Within', this.assertTolerance));
            this.assertThat(iterations, IsEqualTo(0));
        end

        function testMoveNext(this, input, expectedResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = this.arrangeEnumerator(input);
            % Act
            enumerator.moveNext();
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            this.assertThat(result, IsEqualTo(expectedResult, 'Within', this.assertTolerance));
            this.assertThat(iterations, IsEqualTo(1));
        end

        function testGetNextTwoTimes(this, input, expectedSecondResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = this.arrangeEnumerator(input);
            % Act
            enumerator.moveNext();
            enumerator.moveNext();
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            this.assertThat(result, IsEqualTo(expectedSecondResult, 'Within', this.assertTolerance));
            this.assertThat(iterations, IsEqualTo(2));
        end
    end
end