classdef ModifiedNewtonRootEnumerator < esercizio5.NewtonRootEnumerator
    properties (Access = private)
        r;
    end

    methods
        function this = ModifiedNewtonRootEnumerator(f, g, x0, r, tolerance, maxit)
            this = this@esercizio5.NewtonRootEnumerator(f, g, x0, tolerance, maxit);
            this.r = r;
        end
    end

    methods (Access = protected)
        function next = calculateNext(this, fCurrent, gCurrent)
            next = this.current - this.r * fCurrent / gCurrent;
        end
    end
end