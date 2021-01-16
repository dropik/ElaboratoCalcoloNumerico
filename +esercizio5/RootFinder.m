classdef RootFinder
    properties (Access = private)
        rootEnumerator;
    end
    methods
        function this = RootFinder(rootEnumerator)
            this.rootEnumerator = rootEnumerator;
        end

        function [root, iterations] = find(this)
            this.rootEnumerator.reset();
            while (this.rootEnumerator.hasNext)
                this.rootEnumerator.moveNext();
            end

            root = this.rootEnumerator.getCurrent();
            iterations = this.rootEnumerator.i;
        end
    end
end