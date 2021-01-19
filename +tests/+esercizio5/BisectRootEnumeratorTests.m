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
        function enumerator = arrangeEnumerator(this, input)
            enumerator = esercizio5.BisectRootEnumerator(this.f, input(1), input(2), 1e-3);
            enumerator.reset();
        end
    end

    methods (Test)
        function testHasNextOnRegularInput(this)
            % Arrange
            regularInput = [-0.1, 0.2];
            enumerator = this.arrangeEnumerator(regularInput);
            % Assert
            this.assertTrue(enumerator.hasNext);
        end

        function testHasNextOnSmallInterval(this)
            % Arrange
            smallInput = [-1e-4, 2e-4];
            enumerator = this.arrangeEnumerator(smallInput);
            % Assert
            this.assertFalse(enumerator.hasNext);
        end

        function testHasNextOnImmediateRoot(this)
            % Arrange
            immediateRootInput = [-0.2, 0.2];
            enumerator = this.arrangeEnumerator(immediateRootInput);
            % Act
            enumerator.moveNext();
            % Assert
            this.assertFalse(enumerator.hasNext);
        end
    end
end