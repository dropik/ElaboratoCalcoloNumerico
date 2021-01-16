classdef Esercizio
    properties
        x, n;
    end
    
    methods
        function this = Esercizio(x, n)
            checkInputs(x, n)   
            
            this.x = x;
            this.n = n;
        end
        
        function root = radn(this)
            if (this.isTrivialResult())
                root = this.x;
                return;
            end
            root = this.executeRootCalc();
        end
    end
    
    methods(Access = private)
        function isTrivial = isTrivialResult(this)
            isTrivial = false;
            if ((this.x == 0) || (this.x == 1) || (this.n == 1))
                isTrivial = true;
            end
        end
        
        function xi = executeRootCalc(this)
            xi = this.x;
            while (1)
                f = this.getFuncValue(xi);

                if (f < eps)
                    break;
                end

                g = this.getDerivativeValue(xi);
                xi = xi - f / g;
            end
        end
        
        function f = getFuncValue(this, xi)
            f = xi^this.n - this.x;
        end
        
        function g = getDerivativeValue(this, xi)
            g = this.n * xi^(this.n - 1);
        end
    end
end