function main_interp
x = linspace(-1, 1, 21);
y = abs(x);
a = expand(newton(x, y, 20)) %makes a newton polynomial interpolating x y 
coeffs = sym2poly(a)
new_x = linspace(-1, 1, 41);
newer_y = abs(new_x);
new_y = zeros(1, length(new_x));
    for i = 1:length(new_x)
        new_y(i) = hornerN(coeffs, new_x(i), 20);
    end
plot(new_x, new_y)
hold on 
plot (new_x, newer_y);
hold off




end