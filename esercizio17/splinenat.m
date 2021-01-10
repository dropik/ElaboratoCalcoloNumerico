% Calculates natural cubic spline interpolation for given (x, y) points on
% given xx dataset.
%
% @param x - X coordinates of knots.
% @param y - Y coordinates of knots.
% @param xx - dataset of points to evaluate the interpolation for.
%
% @return output - interpolation result.
function output = splinenat(x, y, xx)
    n = length(x);          % Amount of knots.
    
    % sort knots
    [x, ind] = sort(x);
    y = y(ind);
    
    hi = diff(x);           % hi values.
    mi = spline0(x, y)';     % mi = f''(x) values.
    dy = diff(y);           % y_i - y_i-1.
    dm = diff(mi);          % m_i - m_i-1.
    
    % Calculating qi and ri rests.
    qi = dy ./ hi - hi ./ 6 .* dm;
    ri = y(1:n-1) - hi.^2 .* mi(1:n-1) ./ 6;
    
    % Evaluation process.
    size = length(xx);
    output = zeros(1, size);
    for i = 1:size  % dataset loop.
        if ((xx(i) < x(1)) || (xx(i) > x(n)))   % ignore values out of interval.
            continue
        end
        
        % Finding right domain.
        for j = 2:n     % knots loop.
            if (xx(i) > x(j))   % go to next knot, if needed.
                continue
            end
            
            % Evaluate the polynom.
            output(i) = 1/6 .* ((x(j)-xx(i))^3 .* mi(j-1) ./ hi(j-1) ...
                + (xx(i) - x(j-1))^3 .* mi(j) ./ hi(j-1)) ...
                + qi(j - 1) .* (xx(i) - x(j-1)) + ri(j - 1);
            
            break
        end     % knots loop.
    end     % dataset loop.
return