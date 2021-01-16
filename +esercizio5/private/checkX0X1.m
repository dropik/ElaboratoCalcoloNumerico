function checkX0X1(x0, x1)
    if (x0 == x1)
        error('inputs:X0AndX1MustNotBeEqual', 'X0 and X1 must not be equal');
    end
end