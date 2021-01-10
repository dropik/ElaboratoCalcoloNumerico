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
            import esercizio4.Esercizio
            esercizio = Esercizio(input(1), input(2));
            result = esercizio.radn();
            testCase.assertThat(result, IsEqualTo(expectedValue, 'Within', testCase.tolerance));
        end
        
        function testNegativeX(testCase)
            import esercizio4.Esercizio
            testCase.assertError(@() Esercizio(-1, 2), 'radn:XMustBeNonNegative');
        end
        
        function testNegativeN(testCase)
            import esercizio4.Esercizio
            testCase.assertError(@() Esercizio(2, -1), 'radn:NMustBeNonNegative');
        end
        
        function testNonNumericX(testCase)
            import esercizio4.Esercizio
            testCase.assertError(@() Esercizio('1', 2), 'radn:XMustBeNumeric');
        end
        
        function testNonNumericN(testCase)
            import esercizio4.Esercizio
            testCase.assertError(@() Esercizio(1, '2'), 'radn:NMustBeNumeric');
        end
    end
end

