classdef AitkenRootEnumerator < handle
    properties (Access = private)
        f;
        g;
        x0;
        tolerance;
        maxit;

        next;
        X;
    end

    properties (Access = protected)
        current;        
    end

    properties
        i;
    end

    methods
        function this = AitkenRootEnumerator(f, g, x0, tolerance, maxit)
            this.f = f;
            this.g = g;
            this.x0 = x0;
            this.tolerance = tolerance;
            this.maxit = maxit;
        end

        function reset(this)
            this.X = zeros(1, 3);
            this.X(3) = this.x0;
            this.calculateX1X2();

            this.current = realmax;
            this.next = this.X(1);
            this.i = 0;
        end

        function moveNext(this)
            this.current = this.X(2);
            
            this.next = this.calculateNext();
            this.X(3) = this.next;
            this.calculateX1X2();
            this.next = this.X(1);

            this.i = this.i + 1;
        end

        function [has] = hasNext(this)
            has = this.notReachedIterationsLimit() && this.shouldNotStop();
        end

        function [current] = getCurrent(this)
            current = this.next;
        end
    end

    methods (Access = protected)
        function next = calculateNext(this)
            next = (this.X(2)^2 - this.X(3)*this.X(1)) / ...
                    (2*this.X(2) - this.X(1) - this.X(3));
        end
    end

    methods (Access = private)
        function calculateX1X2(this)
            this.X(2) = this.X(3) - feval(this.f, this.X(3)) / feval(this.g, this.X(3));
            this.X(1) = this.X(2) - feval(this.f, this.X(2)) / feval(this.g, this.X(2));
        end

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