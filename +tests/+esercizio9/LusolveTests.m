classdef LusolveTests < matlab.unittest.TestCase
    properties (Access = private)
        lu = [ ...
            1, 2, 3; ...
            4, 5, 6; ...
            7, 8, 9 ...
            ];
        p = [ 1; 2; 3 ];
        b = [ 1; 2; 3 ];
        expectedX = [ 1; -2; 1.333333333333333 ];
        assertTolerance = matlab.unittest.constraints.AbsoluteTolerance(1e-15);
    end

    methods (Test)
        function testLusolve(testCase)
            import matlab.unittest.constraints.IsEqualTo;

            % Act
            x = esercizio9.lusolve(testCase.lu, testCase.p, testCase.b);
            % Assert
            testCase.assertThat(x, IsEqualTo(testCase.expectedX, 'Within', testCase.assertTolerance));
        end

        function testLusolveOnNonSquareLU(testCase)
            % Arrange
            nonSquareLU = [1, 2, 3; 4, 5, 6 ];
            % Assert
            testCase.assertError(@() esercizio9.lusolve(nonSquareLU, testCase.p, testCase.b), ...
                                'inputs:LUMustBeSquare');
        end
    end
end