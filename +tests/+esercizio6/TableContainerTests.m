classdef TableContainerTests < matlab.unittest.TestCase
    properties (Access = private)
        tableContainer;
    end

    methods (TestMethodSetup)
        function setup(testCase)
            testCase.tableContainer = esercizio6.TableContainer(10);
        end
    end

    methods (Test)
        function testAddRecord(testCase)
            import matlab.unittest.constraints.IsEqualTo;

            % Arrange
            container = testCase.tableContainer;
            methodName = 'Method';
            tolerance = 1e-3;
            result = 1;
            iterations = 10;
            % Act
            container.addRecord(methodName, tolerance, result, iterations);
            record = container.getRecord(1);
            % Assert
            testCase.assertThat(record{1}, IsEqualTo(methodName));
            testCase.assertThat(record{2}, IsEqualTo('1e-03'));
            testCase.assertThat(record{3}, IsEqualTo('1.0000000000000000e+00'));
            testCase.assertThat(record{4}, IsEqualTo(iterations));
        end

        function testAddRecordTwice(testCase)
            import matlab.unittest.constraints.IsEqualTo;

            % Arrange
            container = testCase.tableContainer;
            methodName1 = 'Method1';
            methodName2 = 'Method2';
            tolerance = 1e-3;
            result = 1;
            iterations = 10;
            % Act
            container.addRecord(methodName1, tolerance, result, iterations);
            container.addRecord(methodName2, tolerance, result, iterations);
            record = container.getRecord(2);
            % Assert
            testCase.assertThat(record{1}, IsEqualTo(methodName2));
        end

        function testGetTable(testCase)
            import matlab.unittest.constraints.IsEqualTo;

            % Arrange
            container = testCase.tableContainer;
            methodName = 'Method';
            tolerance = 1e-3;
            result = 1;
            iterations = 10;
            expectedMethodName = table(cellstr(methodName), 'VariableNames', {'Method'});
            expectedTolerance = table(cellstr('1e-03'), 'VariableNames', {'Tolerance'});
            expectedResult = table(cellstr('1.0000000000000000e+00'), 'VariableNames', {'Result'});
            expectedIterations = table(num2cell(iterations), 'VariableNames', {'Iterations'});
            % Act
            container.addRecord(methodName, tolerance, result, iterations);
            result = container.getTable();
            % Assert
            testCase.assertThat(result(1, 1), IsEqualTo(expectedMethodName));
            testCase.assertThat(result(1, 2), IsEqualTo(expectedTolerance));
            testCase.assertThat(result(1, 3), IsEqualTo(expectedResult));
            testCase.assertThat(result(1, 4), IsEqualTo(expectedIterations));
        end
    end
end