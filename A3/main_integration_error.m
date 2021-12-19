function main_integration_error()

format long
h_values = zeros(1,10);
midpoint_errors = zeros(1, 10);
trap_errors = zeros(1, 10);
simp_errors = zeros (1, 10);

for i = 1:10
    midpoint_errors(i) = abs(midpoint(i) - erf(1));
    trap_errors(i) = abs(trapezoid(i) - erf(1));
    simp_errors(i) = abs(simpson(i) - erf(1));
    h_values(i) = 1/(2^(i));
end

loglog(h_values, midpoint_errors, h_values, trap_errors, ...
    h_values,simp_errors )

temp_matrix = ones(1, 10);

a = horzcat(temp_matrix', log(h_values)');
b_midpoint = log(midpoint_errors)';
temp_m = a\b_midpoint;
c_m = exp(temp_m(1));
k_m = temp_m(2);

fprintf( "Midpoint Method %.2e*h^%.2f\n" , c_m, k_m);
b_trap = log(trap_errors)';
temp_t = a\b_trap;
c_t = exp(temp_t(1));
k_t = temp_t(2);
fprintf( "Trapezoid Method %.2e*h^%.2f\n" , c_t, k_t);

b_simp = log(simp_errors)';
temp_s = a\b_simp;
c_s = exp(temp_s(1));
k_s = temp_s(2);
fprintf( "Simpson's Method %.2e*h^%.2f\n" , c_s, k_s);

function c = midpoint(i)
h = 1/(2^(i));
n = (1 - 0)/h;
sum = 0;
    for j = 1:n
        sum = sum + uwu((j - (1/2))*h);
    end
c = sum*h;
end
function c = trapezoid(i)
h = 1/(2^(i));
n = (1 - 0)/h;
t_values = zeros(1, n+1);
    for i = 0:n
        t = 0 + i*h;
        t_values(i+1) = t;
    end 
sum = 0;
    for i = 2:n
        sum = sum + uwu(t_values(i));
    end

c = h/2 * (uwu(0) + uwu(1)) + h*sum;
end
function c = simpson(i)
h = 1/(2^(i));
n = (1 - 0)/h;
t_values = zeros(1, n+1);
    for i = 0:n
        t = 0 + i*h;
        t_values(i+1) = t;
    end 
sum_even = 0;
    for i = 1:((n/2) - 1)
        c_even = t_values(2*i + 1);
        sum_even = sum_even + uwu(c_even);
    end
sum_odd = 0;
    for i = 1:(n/2)
        c_odd = t_values(2*i);
        sum_odd = sum_odd + uwu(c_odd);
    end
c = (h/3) * (uwu(0) + 2*sum_even + 4*sum_odd + uwu(1));
end
function c = uwu(x)
c = (2/(sqrt(pi)))*exp(-x^(2));
end
end