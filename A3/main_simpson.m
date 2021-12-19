function main_simpson
format long

fun = @(x) (exp(-x).*sin(exp(1).*x));

tol = 9e-3
accurate_value = quad(fun, 0.5, 1, 9e-3)

[adaptive,adaptive_count] = quadSimpson(fun, 0.5, 1, 9e-3)

composite = simpson(fun, 0.5, 1, 1000000)
composite_count = 1000000

comp_error = abs(accurate_value - composite)
adap_error = abs(accurate_value - adaptive)

x_vals = 0:1/100:15;

plot(x_vals, fun(x_vals))



function [c, count] = quadSimpson(fun, a, b, tol)
h = b - a;
c = (a + b)/2; %midpoint
count = 1;

S1 = vpa((h/6)*(fun(a) + 4*fun((a+b)/2) + fun(b)));
S2 = vpa((h/12)*(fun(a) + 4*fun((a+c)/2) + 2*fun(c) + 4*fun((c+b)/2) + fun(b)));
E2 = vpa((1/15)*(S2 - S1));

if abs(E2) <= tol
    c = S2 + E2;

else
    [Q1, Q1_c] = quadSimpson(fun, a, c, tol/2);
    [Q2, Q2_c] = quadSimpson(fun, c, b, tol/2);
    c = Q1(1) + Q2(1);
    count = count + Q1_c + Q2_c;

end
end

function c = simpson(fun, a, b, n)
h = (b - a)/n;
t_values = zeros(1, n+1);
    for i = 0:n
        t = 0 + i*h;
        t_values(i+1) = t;
    end 
sum_even = 0;
    for i = 1:((n/2) - 1)
        c_even = t_values(2*i + 1);
        sum_even = sum_even + fun(c_even);
    end
sum_odd = 0;
    for i = 1:(n/2)
        c_odd = t_values(2*i);
        sum_odd = sum_odd + fun(c_odd);
    end
c = (h/3) * (fun(0) + 2*sum_even + 4*sum_odd + fun(1));
end
end