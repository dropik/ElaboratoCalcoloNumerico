classdef TableContainer < handle
    properties (Access = private)
        methodNames;
        tolerances;
        results;
        iterations;
        i;
    end

    methods
        function this = TableContainer(length)
            this.methodNames = cell(length, 1);
            this.tolerances = cell(length, 1);
            this.results = cell(length, 1);
            this.iterations = cell(length, 1);
            this.i = 1;
        end

        function addRecord(this, methodName, tolerance, result, iterations)
            this.methodNames(this.i, 1) = cellstr(methodName);
            this.tolerances(this.i, 1) = cellstr(sprintf('%.0e', tolerance));
            this.results(this.i, 1) = cellstr(sprintf('%.16e', result));
            this.iterations(this.i, 1) = num2cell(iterations);
            this.i = this.i + 1;
        end

        function [record] = getRecord(this, index)
            record = { ...
                this.methodNames(index), ...
                this.tolerances(index), ...
                this.results(index), ...
                this.iterations(index) ...
            };
            record = cat(1, record{:});
        end

        function [result] = getTable(this)
            result = table(this.methodNames, this.tolerances, this.results, this.iterations,...
                        'VariableNames', { 'Method', 'Tolerance', 'Result', 'Iterations' });
        end
    end
end