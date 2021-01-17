function checkNonNegativeInput(input, inputPrefix)
    if (input < 0)
        error(strcat('inputs:', inputPrefix, 'MustBeNonNegative'), ...
            strcat(inputPrefix, ' must be a non-negative value'));
    end
end