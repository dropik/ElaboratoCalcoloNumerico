classdef Esercizio4Tests < matlab.unittest.TestCase
    properties(TestParameter)
        input = num2cell(combvec([ 1, 2, 9 ], [ 1, 2, 3 ]), 1);
        expectedValue = { ...
                            1, 2, 9, ...
                            1, 1.414213562373095, 3, ...
                            1, 1.259921049894873, 2.080083823051904 ...
                        };
    end
    properties(Access = private)
        tolerance = matlab.unittest.constraints.AbsoluteTolerance(1e-15);
    end
    methods(Test, ParameterCombination = 'sequential')
        function testRadn(testCase, input, expectedValue)
            import matlab.unittest.constraints.IsEqualTo
            result = esercizio4.radn(input(1), input(2));
            testCase.assertThat(result, IsEqualTo(expectedValue, 'Within', testCase.tolerance));
        end
    end
end

