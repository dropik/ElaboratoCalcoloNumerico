classdef QrsolveTests < matlab.unittest.TestCase
    properties (TestParameter)
        A = {
            [
                1, 5, 4;
                4, 9, 12;
                43, 31, 63;
                33, 76, 9;
            ], ...
            [
                39, 29, 96;
                298, 28, 96;
                1, 6, 7;
            ], ...
            [
                0.7060,    0.4387,    0.2760;
                0.0318,    0.3816,    0.6797;
                0.2769,    0.7655,    0.6551;
                0.0462,    0.7952,    0.1626;
                0.0971,    0.1869,    0.1190;
                0.8235,    0.4898,    0.4984;
                0.6948,    0.4456,    0.9597;
                0.3171,    0.6463,    0.3404;
                0.9502,    0.7094,    0.5853;
                0.0344,    0.7547,    0.2238;
            ]
        };

        b = {
            [ 53; 71; 1; 6; ], ...
            [51; 96; 28;], ...
            [ 0.6991; 0.8909; 0.9593; 0.5472; 0.1386; 0.1493; 0.2575; 0.8407; 0.2543; 0.8143; ]
        };

        expectedX = {
            [ -14.353568943621617; 5.472052109341669; 7.112586638305272; ], ...
            [ 0.198237063154620; 6.343399357046563; -1.465519029347714; ], ...
            [ -0.504466187641544; 0.979479051097859; 0.411779258939589; ]
        };
    end

    methods (Test, ParameterCombination = 'sequential')
        function testQrsolve(this, A, b, expectedX)
            import matlab.unittest.constraints.*;

            % Arrange
            assertTolerance = AbsoluteTolerance(1e-14);
            QR = esercizio11.myqr(A);
            % Act
            x = esercizio12.qrsolve(QR, b);
            % Assert
            this.assertThat(x, IsEqualTo(expectedX, 'Within', assertTolerance));
        end
    end
end