function checkIntegerInput(input, inputPrefix)
    if (floor(input) ~= input)
        error(strcat('inputs:', inputPrefix, 'MustBeInteger'), ...
            strcat(inputPrefix, ' must be an integer value.'));
    end
end