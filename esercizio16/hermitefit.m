% Calculates coefficients for Hermite polynomial.
%
% @param x - X coordinates of selected nodes.
% @param y - f(x).
% @param dy - f'(x).
%
% @return H - Hermite polynomial coefficients.
function H = hermitefit(x, y, dy)
    n = length(x);      % Amount of nodes.
    n2 = 2 * n;         % New dataset size.
    H = zeros(1, n2);   % Amount of coefficients is equal to new dataset size.
    dd = zeros(n2);     % Divided differences table.
    
    % Calculating divided differences.
    for j = 1:n2    % table loop.
        % Getting f(x) values for the first column of dd.
        if (j == 1) % if frist column.
            for i = j:n2    % first column loop.
                xi = ceil(i/2); % Index in X array scope.
                dd(i, j) = y(xi);
            end     % first column loop.
        else    % if not first column
            % Getting divided differences for the rest of the columns of
            % dd.
            for i = j:n2    % column loop.
                xi = ceil(i/2); % node array index scope.
                
                % Calculating extended dataset X coordinates.
                zvj = x(xi);    % z_v+j
                zv = x(ceil((i-j+1)/2));    % z_v
                
                % if value was repeated
                if ((dd(i, j-1) == dd(i-1, j-1)) && (zvj == zv))
                    % using derivative instead.
                    dd(i, j) = dy(xi);
                else    % if value was not repeated.
                    % calculating divided difference [y_v, ..., y_v+j] =
                    % [y_v+1, ..., y_v+k] - [y_v, ..., y_v+j-1] / z_v+j - z_v
                    dd(i, j) = (dd(i, j-1) - dd(i-1, j-1))/(zvj - zv);
                end     % if value was repeated.
            end     % column loop.
        end     % if first column.
        
        % Saving diagonal element to coefficients vector, since
        % coefficients lie on the diagonal of dd table.
        H(j) = dd(j, j);
    end     % table loop.
return