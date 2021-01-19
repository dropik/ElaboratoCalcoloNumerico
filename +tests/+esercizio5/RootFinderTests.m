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
        function testEnumeratorDoesNotHaveNext(this)
            import matlab.mock.constraints.WasCalled
            import matlab.mock.constraints.WasAccessed
            import matlab.unittest.constraints.IsEqualTo
            import matlab.mock.actions.AssignOutputs

            % Arrange
            TEST_ROOT = 1;
            ITERATIONS = 1;
            when(withExactInputs(this.enumeratorBehaviour.hasNext), AssignOutputs(false));
            when(withExactInputs(this.enumeratorBehaviour.getCurrent), AssignOutputs(TEST_ROOT));
            when(get(this.enumeratorBehaviour.i), AssignOutputs(ITERATIONS));

            % Act
            [root, iterations] = this.rootFinder.find();

            % Assert
            this.assertThat(root, IsEqualTo(TEST_ROOT));
            this.assertThat(iterations, IsEqualTo(ITERATIONS));
            this.assertThat(withExactInputs(this.enumeratorBehaviour.hasNext), WasCalled('WithCount', 1));
            this.assertThat(withExactInputs(this.enumeratorBehaviour.moveNext), ~WasCalled);
            this.assertThat(withExactInputs(this.enumeratorBehaviour.getCurrent), WasCalled('WithCount', 1));
            this.assertThat(this.enumeratorBehaviour.i, WasAccessed('WithCount', 1));
        end

        function testEnumeratorHasNext(this)
            import matlab.mock.constraints.WasCalled
            import matlab.unittest.constraints.IsEqualTo
            import matlab.mock.actions.AssignOutputs

            % Arrange
            when(withExactInputs(this.enumeratorBehaviour.hasNext), ...
                AssignOutputs(true).then(AssignOutputs(true)).then(AssignOutputs(false)));
            % Act
            this.rootFinder.find();
            % Assert
            this.assertThat(withExactInputs(this.enumeratorBehaviour.hasNext), WasCalled('WithCount', 3));
            this.assertThat(withExactInputs(this.enumeratorBehaviour.moveNext), WasCalled('WithCount', 2));
        end

        function testEnumeratorWasReset(this)
            import matlab.mock.constraints.WasCalled
            import matlab.mock.actions.AssignOutputs

            % Arrange
            when(withExactInputs(this.enumeratorBehaviour.hasNext), AssignOutputs(false));
            % Act
            this.rootFinder.find();
            % Assert
            this.assertThat(withExactInputs(this.enumeratorBehaviour.reset), WasCalled('WithCount', 1));
        end
    end
end