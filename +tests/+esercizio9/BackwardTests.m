classdef BackwardTests < matlab.unittest.TestCase
    properties (Access = private)
        u = [ ...
            1, 2, 3; ...
            2, 4, 5; ...
            4, 7, 6; ...
            ];
        b = [ 7; 8; 9; ];
        expectedX = [ 2.25; 0.125; 1.5; ];
    end

    methods (Test)
        function testBackward(this)
            import matlab.unittest.constraints.IsEqualTo;

            % Act
            x = esercizio9.backward(this.u, this.b);
            % Assert
            this.assertThat(x, IsEqualTo(this.expectedX));
        end
    end
end