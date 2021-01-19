classdef PaluTests < matlab.unittest.TestCase
    properties (Access = private)
        a = [ ...
            1, 2, 3; ...
            4, 5, 6; ...
            7, 8, 9 ...
            ];
        expectedLU = [ ...
            7, 8, 9; ...
            0.142857142857143, 0.857142857142857, 1.714285714285714; ...
            0.571428571428571, 0.5, 1.110223024625157e-16 ...
            ];
        expectedP = [ 3; 1; 2 ];
        assertTolerance = matlab.unittest.constraints.AbsoluteTolerance(1e-15);
    end

    methods (Test)
        function testPalu(testCase)
            import matlab.unittest.constraints.IsEqualTo;

            % Act
            [lu, p] = esercizio8.palu(testCase.a);
            % Assert
            testCase.assertThat(lu, IsEqualTo(testCase.expectedLU, 'Within', testCase.assertTolerance));
            testCase.assertThat(p, IsEqualTo(testCase.expectedP));
        end

        function testPaluOnNotSquareMatrix(testCase)
            % Arrange
            nonSquareA = [ 1, 2, 3; 4, 5, 6 ];
            % Assert
            testCase.assertError(@() esercizio8.palu(nonSquareA), 'inputs:AMustBeSquare');
        end

        function testPaluOnSingularMatrix(testCase)
            % Arrange
            singularA = [ 0, 1, 2; 0, 3, 4; 0, 5, 6 ];
            % Assert
            testCase.assertError(@() esercizio8.palu(singularA), 'inputs:AMustBeNonSingular');
        end
    end
end