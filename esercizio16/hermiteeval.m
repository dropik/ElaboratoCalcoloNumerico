% Evaluates Hermite polynomial for given X.
%
% @param H - Hermite polynomial coefficients.
% @param x - input X coordinates.
% @param y - original function values.
% @param xn - X coordinates of nodes.
%
% @return yFit - fitted function values.
% @return err - absolute error between original and fitted values.
function [yFit, err] = hermiteeval(H, x, y, xn)
    n = length(x);          % dataset length.
    nodes = 2*length(xn);   % amount of nodes.
    
    % Allocating memory.
    yFit = zeros(1, n);
    err = yFit;
    
    % Calculating fitted values.
    for i = 1:n     % dataset loop.
        fit = H(1); % fitted value (saving zero coefficient).
        prod = 1;   % storing (x-xi) products here.
        
        % Calculating polynom value.
        for j = 2:nodes     % polynom loop.
            xni = ceil((j-1)/2);            % node vector scope index.
            prod = prod * (x(i) - xn(xni)); % updating product.
            fit = fit + H(j) * prod;        % updating fit.
        end     % polynom loop.
        
        % saving results.
        yFit(i) = fit;
        err(i) = abs(fit - y(i));
    end     % dataset loop.
return