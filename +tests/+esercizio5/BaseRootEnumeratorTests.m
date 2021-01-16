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
        arrangeEnumerator(testCase, input);
    end

    methods (Test, ParameterCombination = 'sequential')
        function testNeverMoveNext(testCase, input, expectedInitialResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = testCase.arrangeEnumerator(input);
            % Act
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedInitialResult, 'Within', testCase.assertTolerance));
            testCase.assertThat(iterations, IsEqualTo(0));
        end

        function testMoveNext(testCase, input, expectedResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = testCase.arrangeEnumerator(input);
            % Act
            enumerator.moveNext();
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedResult, 'Within', testCase.assertTolerance));
            testCase.assertThat(iterations, IsEqualTo(1));
        end

        function testGetNextTwoTimes(testCase, input, expectedSecondResult)
            import matlab.unittest.constraints.IsEqualTo

            % Arrange
            enumerator = testCase.arrangeEnumerator(input);
            % Act
            enumerator.moveNext();
            enumerator.moveNext();
            result = enumerator.getCurrent();
            iterations = enumerator.i;
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedSecondResult, 'Within', testCase.assertTolerance));
            testCase.assertThat(iterations, IsEqualTo(2));
        end
    end
end