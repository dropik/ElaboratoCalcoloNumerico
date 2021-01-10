function checkAnInput(input, inputPrefix)
    if (input < 0)
        error(strcat('radn:', inputPrefix, 'MustBeNonNegative'), ...
            strcat(inputPrefix, ' must be a non-negative value'));
    end

    if (~isa(input, 'numeric'))
        error(strcat('radn:', inputPrefix, 'MustBeNumeric'), ...
            strcat(inputPrefix, ' must be a numeric value'));
    end
end