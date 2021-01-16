classdef SecantRootEnumerator < handle
    properties (Access = private)
        f;
        x0;
        x1;
        tolerance;
        maxit;

        X;
        F;
        next;
    end

    properties
        i;
    end

    methods
        function this = SecantRootEnumerator(f, x0, x1, tolerance, maxit)
            this.f = f;
            this.x0 = x0;
            this.x1 = x1;
            this.tolerance = tolerance;
            this.maxit = maxit;
        end

        function reset(this)
            this.X = zeros(1, 2);
            this.X(2) = this.x0;
            this.X(1) = this.x1;
            
            this.F = zeros(1, 2);
            this.F(2) = feval(this.f, this.X(2));

            this.i = 0;
            this.next = this.X(1);
        end

        function moveNext(this)
            this.F(1) = feval(this.f, this.X(1));

            this.next = (this.F(1) * this.X(2) - this.F(2) * this.X(1)) / ...
                    (this.F(1) - this.F(2));

            this.X(2) = this.X(1);
            this.X(1) = this.next;
            this.F(2) = this.F(1);
            this.i = this.i + 1;
        end

        function [has] = hasNext(this)
            has = (this.notReachedIterationsLimit) && (this.shouldNotStop);
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
            stop = abs(this.X(1) - this.X(2)) <= this.tolerance * (1 + abs(this.X(2)));
        end
    end
end