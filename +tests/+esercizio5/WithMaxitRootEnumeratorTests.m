classdef (Abstract) WithMaxitRootEnumeratorTests < tests.esercizio5.BaseRootEnumeratorTests
    properties (Access = protected, Abstract)
        regularInput;
        almostRootInput;
        requireIterationForStopCriteria;
    end
    
    methods (Access = protected, Abstract)
        createEnumerator(testCase, input, maxit);
    end

    methods (Access = protected)
        function enumerator = arrangeEnumerator(testCase, input)
            enumerator = testCase.arrangeEnumeratorWithMaxit(input, 10);
        end

        function enumerator = arrangeEnumeratorWithMaxit(testCase, input, maxit)
            enumerator = testCase.createEnumerator(input, maxit);
            enumerator.reset();
        end
    end

    methods (Test)
        function testHasNextOnMaxitAndStopCriteria(testCase)
            % Arrange
            enumerator = testCase.arrangeEnumerator(testCase.regularInput);
            % Assert
            testCase.assertTrue(enumerator.hasNext);
        end

        function testHasNextOnLowMaxitAndOkStopCriteria(testCase)
            % Arrange
            enumerator = testCase.arrangeEnumeratorWithMaxit(testCase.regularInput, 1);
            % Act
            enumerator.moveNext();
            % Assert
            testCase.assertFalse(enumerator.hasNext);
        end

        function testHasNextOnOkayMaxitAndLowStopCriteria(testCase)
            % Arrange
            enumerator = testCase.arrangeEnumerator(testCase.almostRootInput);
            % Act
            if (testCase.requireIterationForStopCriteria)
                enumerator.moveNext();
            end
            % Assert
            testCase.assertFalse(enumerator.hasNext);
        end
    end
end