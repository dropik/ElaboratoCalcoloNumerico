classdef NewtonRootEnumerator < handle
    properties (Access = private)
        f;
        g;
        x0;
        tolerance;
        maxit;

        current;
        next;
    end

    properties
        i;
    end

    methods
        function this = NewtonRootEnumerator(f, g, x0, tolerance, maxit)
            this.f = f;
            this.g = g;
            this.x0 = x0;
            this.tolerance = tolerance;
            this.maxit = maxit;
        end

        function reset(this)
            this.current = realmax;
            this.next = this.x0;
            this.i = 0;
        end

        function moveNext(this)
            this.current = this.next;
            
            fCurrent = feval(this.f, this.current);
            gCurrent = feval(this.g, this.current);
            this.next = this.current - fCurrent / gCurrent;

            this.i = this.i + 1;
        end

        function [has] = hasNext(this)
            has = this.notReachedIterationsLimit() && this.shouldNotStop();
        end

        function [current] = getCurrent(this)
            current = this.next;
        end
    end

    methods (Access = private)
        function [reached] = notReachedIterationsLimit(this)
            reached = this.i < this.maxit;
        end

        function [stop] = shouldNotStop(this)
            stop = ~this.stopCriteria();
        end

        function [stop] = stopCriteria(this)
            stop = abs(this.next - this.current) <= this.tolerance * (1 + abs(this.current));
        end
    end
end