% Evaluates Lagrange matrix to calculate fitting values for a given
% set of points.
%
% @param L - Lagrange matrix.
% @param x - set of points to evaluate polynom for.
% @param y - values of original function for a given set of points.
% @param xP - X coordinate of points used to construct polynom.
% @param yP - Y coordinate of points used to construct polynom.
%
% @return yFit - fitted Y values.
% @return error - absolute error between fitted and actual values.
function [yFit, err] = lagrangeeval(L, x, y, xP, yP)
    % Some size matching check.
    nL = size(L);
    [~, nP] = size(xP);
    if (nL ~= nP)
        error('Sizes of Lagrange matrix and points array not matching.');
    end
    
    % Evaluating polynom.
    [~, n] = size(x);
    yFit = zeros(1, n);
    err = yFit;
    for i = 1:n
        % Evaluating polynom for one point.
        for j = 1:nL
            % Evaluating one Lagrange polynom.
            prod = yP(j);
            for k = 1:nL
                % Calculating part of product.
                if (j == k)
                    % Skip if L(j, k) == 0.
                    continue
                end
                prod = prod * (x(i) - xP(k)) / L(j, k);
            end
            
            % Summing parts of polynom.
            yFit(i) = yFit(i) + prod;
        end
        
        % Calculating error.
        err(i) = abs(yFit(i) - y(i));
    end
return