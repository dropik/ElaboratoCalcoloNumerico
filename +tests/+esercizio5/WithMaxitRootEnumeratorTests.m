classdef (Abstract) WithMaxitRootEnumeratorTests < tests.esercizio5.BaseRootEnumeratorTests
    properties (Access = protected, Abstract)
        regularInput;
        almostRootInput;
        requireIterationForStopCriteria;
    end
    
    methods (Access = protected, Abstract)
        createEnumerator(this, input, maxit);
    end

    methods (Access = protected)
        function enumerator = arrangeEnumerator(this, input)
            enumerator = this.arrangeEnumeratorWithMaxit(input, 10);
        end

        function enumerator = arrangeEnumeratorWithMaxit(this, input, maxit)
            enumerator = this.createEnumerator(input, maxit);
            enumerator.reset();
        end
    end

    methods (Test)
        function testHasNextOnMaxitAndStopCriteria(this)
            % Arrange
            enumerator = this.arrangeEnumerator(this.regularInput);
            % Assert
            this.assertTrue(enumerator.hasNext);
        end

        function testHasNextOnLowMaxitAndOkStopCriteria(this)
            % Arrange
            enumerator = this.arrangeEnumeratorWithMaxit(this.regularInput, 1);
            % Act
            enumerator.moveNext();
            % Assert
            this.assertFalse(enumerator.hasNext);
        end

        function testHasNextOnOkayMaxitAndLowStopCriteria(this)
            % Arrange
            enumerator = this.arrangeEnumerator(this.almostRootInput);
            % Act
            if (this.requireIterationForStopCriteria)
                enumerator.moveNext();
            end
            % Assert
            this.assertFalse(enumerator.hasNext);
        end
    end
end