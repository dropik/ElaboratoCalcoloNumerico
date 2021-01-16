classdef BisectRootEnumeratorTests < tests.esercizio5.BaseRootEnumeratorTests
    properties (TestParameter)
        input = { [-0.1, 0.2], [-0.2, 0.1] };
        expectedInitialResult = { -0.1, -0.2 };
        expectedResult = { 0.05, -0.05 };
        expectedSecondResult = { -0.025, 0.025 };
    end

    properties (Access = private)
        f = @(x) sin(x);
    end

    methods (Access = protected)
        function enumerator = arrangeEnumerator(testCase, input)
            enumerator = esercizio5.BisectRootEnumerator(testCase.f, input(1), input(2), 1e-3);
            enumerator.reset();
        end
    end

    methods (Test)
        function testHasNextOnRegularInput(testCase)
            % Arrange
            regularInput = [-0.1, 0.2];
            enumerator = testCase.arrangeEnumerator(regularInput);
            % Assert
            testCase.assertTrue(enumerator.hasNext);
        end

        function testHasNextOnSmallInterval(testCase)
            % Arrange
            smallInput = [-1e-4, 2e-4];
            enumerator = testCase.arrangeEnumerator(smallInput);
            % Assert
            testCase.assertFalse(enumerator.hasNext);
        end

        function testHasNextOnImmediateRoot(testCase)
            % Arrange
            immediateRootInput = [-0.2, 0.2];
            enumerator = testCase.arrangeEnumerator(immediateRootInput);
            % Act
            enumerator.moveNext();
            % Assert
            testCase.assertFalse(enumerator.hasNext);
        end
    end
end