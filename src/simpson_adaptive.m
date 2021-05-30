function [I, err, evals] = simpson_adaptive(f, a, b, tol)
% SIMPSON_ADAPTIVE  calculates a definite integral using Simpson's adaptive
% method.
%
%   I = SIMPSON_ADAPTIVE(F, A, B, TOL) returns the approximation of the
%   definite integral of function F on [A, B] interval, given the tolerance
%   value TOL.
    half = (a + b) / 2;
    h = 2^(-6);
    h4 = h^4;
    
    % Using finite difference method to find the approximation of the 4th
    % derivative of the given function.
    f_xi =  feval(f, b - 4*h) *  7/240/h4 - ...
            feval(f, b - 3*h) *  2/5/h4 + ...
            feval(f, b - 2*h) *  169/60/h4 - ...
            feval(f, b - h) *    122/15/h4 + ...
            feval(f, b) *        91/8/h4 - ...
            feval(f, b + h) *    122/15/h4 + ...
            feval(f, b + 2*h) *  169/60/h4 - ...
            feval(f, b + 3*h) *  2/5/h4 + ...
            feval(f, b + 4*h) *  7/240/h4;
        
    evals = 9;
    
    error = abs(-f_xi / 90 * ((b - a) / 2)^5);
    if (error <= tol)
        I = (b - a)/6 * (feval(f, a) + 4*feval(f, half) + feval(f, b));
        evals = evals + 3;
        err = error;
    else
        [I1, err1, evals1] = simpson_adaptive(f, a, half, tol);
        [I2, err2, evals2] = simpson_adaptive(f, half, b, tol);
        I = I1 + I2;
        err = max(err1, err2);
        evals = evals + evals1 + evals2;
    end
end