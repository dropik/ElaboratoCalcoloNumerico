classdef BisectRootEnumerator < handle
    properties (Access = private)
        f;
        a0;
        b0;
        tolerance;

        a;
        b;
        fa;
        fb;
        imax;
        next;
        fnext;
    end

    properties
        i;
    end

    methods
        function this = BisectRootEnumerator(f, a, b, tolerance)
            this.f = f;
            this.a0 = a;
            this.b0 = b;
            this.tolerance = tolerance;
        end

        function reset(this)
            this.a = this.a0;
            this.b = this.b0;

            this.fa = feval(this.f, this.a);
            this.fb = feval(this.f, this.b);

            this.next = this.a;
            this.fnext = this.fa;

            this.i = 0;
            this.imax = ceil(log2(this.b - this.a) - log2(this.tolerance));
            if (this.imax < 1)
                this.imax = 1;
            end
        end

        function moveNext(this)
            this.next = (this.a + this.b) / 2;
            this.fnext = feval(this.f, this.next);

            if (this.fa * this.fnext < 0)
                this.b = this.next;
                this.fb = this.fnext;
            else
                this.a = this.next;
                this.fa = this.fnext;
            end

            this.i = this.i + 1;
        end

        function [has] = hasNext(this)
            has = this.notReachedIterationsLimit && this.shouldNotStop;
        end

        function [current] = getCurrent(this)
            current = this.next;
        end
    end

    methods (Access = private)
        function [reached] = notReachedIterationsLimit(this)
            reached = this.i < this.imax;
        end
        
        function [stop] = shouldNotStop(this)
            stop = ~this.stopCriteria();
        end

        function [stop] = stopCriteria(this)
            f1x = (this.fb - this.fa) / (this.b - this.a);
            tolf = abs(f1x) * this.tolerance;
            stop = abs(this.fnext) < tolf;
        end
    end
end