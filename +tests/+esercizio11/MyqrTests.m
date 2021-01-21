classdef MyqrTests < matlab.unittest.TestCase
    properties (TestParameter)
        A = {
            [
                1, 2, 3;
                4, 5, 6;
                7, 8, 9;
            ], ...
            [
                0, 1, 2;
                3, 0, 4;
                5, 6, 0;
            ], ...
            eye(3), ...
            ones(3), ...
            zeros(3), ...
            [
                1, 2, 3;
                0, 4, 5;
                0, 6, 7;
            ], ...
            [
                1, 0, 0;
                0, 2, 3;
                0, 4, 5;
            ], ...
            [
                1, 2, 3;
                4, 5, 6;
                7, 8, 9;
                10, 11, 12;
                13, 14, 15;
            ]
        };
    end

    methods (Test)
        function testMyqr(this, A)
            import matlab.unittest.constraints.*;
            
            % Arrange
            assertTolerance = AbsoluteTolerance(1e-14);
            [m, n] = size(A);
            % Act
            QR = esercizio11.myqr(A);
            % Assert
            this.assertThat(QR(1:m, 1:m) * QR(1:m, m+1:m+n), IsEqualTo(A, 'Within', assertTolerance));
        end
    end
end