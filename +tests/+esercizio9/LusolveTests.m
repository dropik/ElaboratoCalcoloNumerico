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
        function testLusolve(this)
            import matlab.unittest.constraints.IsEqualTo;

            % Act
            x = esercizio9.lusolve(this.lu, this.p, this.b);
            % Assert
            this.assertThat(x, IsEqualTo(this.expectedX, 'Within', this.assertTolerance));
        end

        function testLusolveOnNonSquareLU(this)
            % Arrange
            nonSquareLU = [1, 2, 3; 4, 5, 6 ];
            % Assert
            this.assertError(@() esercizio9.lusolve(nonSquareLU, this.p, this.b), ...
                                'inputs:LUMustBeSquare');
        end
    end
end