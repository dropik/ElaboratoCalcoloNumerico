classdef Esercizio4Tests < matlab.unittest.TestCase
    properties(TestParameter)
        input = num2cell(combvec([ 0, 1, 2, 9 ], [ 1, 2, 3 ]), 1);
        expectedValue = { ...
                            0, 1, 2, 9, ...
                            0, 1, 1.414213562373095, 3, ...
                            0, 1, 1.259921049894873, 2.080083823051904 ...
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
        
        function testNegativeX(testCase)
            testCase.assertError(@() esercizio4.radn(-1, 2), 'radn:XMustBeNonNegative');
        end
        
        function testNegativeN(testCase)
            testCase.assertError(@() esercizio4.radn(2, -1), 'radn:NMustBeNonNegative');
        end
        
        function testNonNumericX(testCase)
            testCase.assertError(@() esercizio4.radn('1', 2), 'radn:XMustBeNumeric');
        end
        
        function testNonNumericN(testCase)
            testCase.assertError(@() esercizio4.radn(1, '2'), 'radn:NMustBeNumeric');
        end
    end
end

