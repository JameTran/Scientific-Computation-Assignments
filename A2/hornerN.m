function horny = hornerN(coefs, val, degree)
horny = coefs(1);
    for i = 2:degree + 1
        horny = coefs(i) + (val * horny);
    end
end 