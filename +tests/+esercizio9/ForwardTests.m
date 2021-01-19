classdef ForwardTests < matlab.unittest.TestCase
    properties (Access = private)
        l = [ ...
            5, 0, 0; ...
            2, 3, 0; ...
            3, 4, 2 ...
            ];
        p = [ 2; 1; 3 ];
        b = [ 6; 5; 7 ];
        expectedX = [ 5; -4; 8 ];
    end

    methods (Test)
        function testForward(this)
            import matlab.unittest.constraints.IsEqualTo;

            % Act
            x = esercizio9.forward(this.l, this.p, this.b);
            % Assert
            this.assertThat(x, IsEqualTo(this.expectedX));
        end
    end
end