function checkAtLeast1Input(input, inputPrefix)
    if (input < 0)
        error(strcat('inputs:', inputPrefix, 'MustBePositive'), ...
                strcat(inputPrefix, ' must be a positive value'));
    elseif (input == 0)
        error(strcat('inputs:', inputPrefix, 'MustBeAtLeast1'), ...
                strcat(inputPrefix, ' must be equal to at least 1'));
    end
end