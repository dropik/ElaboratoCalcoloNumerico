classdef RootFinderTests < matlab.mock.TestCase
    properties (Access = private)
        rootFinder;
        enumeratorMock;
        enumeratorBehaviour;
    end

    methods (TestMethodSetup)
        function setup(this)
            [this.enumeratorMock, this.enumeratorBehaviour] = this.createMock(...
                                                            'AddedMethods', {'hasNext', 'moveNext', 'reset', 'getCurrent'}, ...
                                                            'AddedProperties', {'i'} ...
                                                            );
            this.rootFinder = esercizio5.RootFinder(this.enumeratorMock);
        end
    end

    methods (Test)
        function testEnumeratorDoesNotHaveNext(testCase)
            import matlab.mock.constraints.WasCalled
            import matlab.mock.constraints.WasAccessed
            import matlab.unittest.constraints.IsEqualTo
            import matlab.mock.actions.AssignOutputs

            % Arrange
            TEST_ROOT = 1;
            ITERATIONS = 1;
            when(withExactInputs(testCase.enumeratorBehaviour.hasNext), AssignOutputs(false));
            when(withExactInputs(testCase.enumeratorBehaviour.getCurrent), AssignOutputs(TEST_ROOT));
            when(get(testCase.enumeratorBehaviour.i), AssignOutputs(ITERATIONS));

            % Act
            [root, iterations] = testCase.rootFinder.find();

            % Assert
            testCase.assertThat(root, IsEqualTo(TEST_ROOT));
            testCase.assertThat(iterations, IsEqualTo(ITERATIONS));
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.hasNext), WasCalled('WithCount', 1));
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.moveNext), ~WasCalled);
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.getCurrent), WasCalled('WithCount', 1));
            testCase.assertThat(testCase.enumeratorBehaviour.i, WasAccessed('WithCount', 1));
        end

        function testEnumeratorHasNext(testCase)
            import matlab.mock.constraints.WasCalled
            import matlab.unittest.constraints.IsEqualTo
            import matlab.mock.actions.AssignOutputs

            % Arrange
            when(withExactInputs(testCase.enumeratorBehaviour.hasNext), ...
                AssignOutputs(true).then(AssignOutputs(true)).then(AssignOutputs(false)));

            % Act
            testCase.rootFinder.find();

            % Assert
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.hasNext), WasCalled('WithCount', 3));
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.moveNext), WasCalled('WithCount', 2));
        end

        function testEnumeratorWasReset(testCase)
            import matlab.mock.constraints.WasCalled
            import matlab.mock.actions.AssignOutputs

            % Arrange
            when(withExactInputs(testCase.enumeratorBehaviour.hasNext), AssignOutputs(false));

            % Act
            testCase.rootFinder.find();

            % Assert
            testCase.assertThat(withExactInputs(testCase.enumeratorBehaviour.reset), WasCalled('WithCount', 1));
        end
    end
end