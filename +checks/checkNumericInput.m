function checkNumericInput(input, inputPrefix)
    if (~isa(input, 'numeric'))
        error(strcat('inputs:', inputPrefix, 'MustBeNumeric'), ...
            strcat(inputPrefix, ' must be a numeric value'));
    end
end