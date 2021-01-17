classdef EsercizioTests < matlab.unittest.TestCase
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
            import matlab.unittest.constraints.IsEqualTo;
            import esercizio4.Esercizio;

            % Arrange
            esercizio = Esercizio(input(1), input(2));
            % Act
            result = esercizio.radn();
            % Assert
            testCase.assertThat(result, IsEqualTo(expectedValue, 'Within', testCase.tolerance));
        end
        
        function testNonNumericX(testCase)
            testCase.assertError(@() esercizio4.Esercizio('1', 2), 'inputs:XMustBeNumeric');
        end

        function testNegativeX(testCase)
            testCase.assertError(@() esercizio4.Esercizio(-1, 2), 'inputs:XMustBeNonNegative');
        end
        
        function testNonNumericN(testCase)
            testCase.assertError(@() esercizio4.Esercizio(1, '2'), 'inputs:NMustBeNumeric');
        end

        function testNegativeN(testCase)
            testCase.assertError(@() esercizio4.Esercizio(2, -1), 'inputs:NMustBeNonNegative');
        end
    end
end

