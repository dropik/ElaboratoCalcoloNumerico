classdef AitkenTests < tests.esercizio5.WithMaxitTestCase
    properties(TestParameter)
        input = { 0.1, -1.0, 1.0 };
        expectedRoot = { 0, -1.047197551196598, 1.047197551196598 };
    end
    
    properties(Access = protected)
        g = @(x) 6 * cos(3 * x);
        assertToleranceAmount = 1e-15;
    end

    methods(Access = protected)
        function [result, iterations] = findRoot(testCase, input)
            [result, iterations] = esercizio7.aitken(...
                testCase.f, ...
                testCase.g, ...
                input, ...
                testCase.inputTolerance, ...
                testCase.inputMaxit ...
            );
        end

        function [result, iterations] = findRootWithoutMaxit(testCase, input)
            [result, iterations] = esercizio7.aitken(...
                testCase.f, ...
                testCase.g, ...
                input, ...
                testCase.inputTolerance ...
            );
        end
    end
    
    methods(Test, ParameterCombination = 'sequential')
        function testX0NonNumeric(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, '1', testCase.inputTolerance, testCase.inputMaxit), ...
                'inputs:X0MustBeNumeric' ...
            );
        end
        
        function testToleranceNonNumeric(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, '1e-3', testCase.inputMaxit), ...
                'inputs:ToleranceMustBeNumeric' ...
            );
        end
        
        function testToleranceLessThanZero(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, -1e-3, testCase.inputMaxit), ...
                'inputs:ToleranceMustBePositive' ...
            );
        end
        
        function testToleranceEqualToZero(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, 0, testCase.inputMaxit), ...
                'inputs:ToleranceMustBePositive' ...
            );
        end
        
        function testMaxitNonNumeric(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, testCase.inputTolerance, '100'), ...
                'inputs:MaxitMustBeNumeric' ...
            );
        end
        
        function testMaxitLessThanZero(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, testCase.inputTolerance, -100), ...
                'inputs:MaxitMustBePositive' ...
            );
        end
        
        function testMaxitEqualToZero(testCase)
            testCase.assertError(...
                @() esercizio7.aitken(testCase.f, testCase.g, 1, testCase.inputTolerance, 0), ...
                'inputs:MaxitMustBeAtLeast1' ...
            );
        end
    end
end