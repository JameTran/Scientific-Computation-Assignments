function main_deriv 

x = fprime(1);
i_values = []
g1_errors = []
g2_errors = []

for i = 1 : 16
    a = g1(1, 10.^-i);
    b = g2(1, 10.^-i);

    g1_error = abs(x - a);
    g2_error = abs(x - b);
    i_values(i) = 10.^-i;
    g1_errors(i) = g1_error;
    g2_errors(i) = g2_error;
    loglog(i_values, g1_errors);
    hold on;
    loglog(i_values, g2_errors);
    hold off;
    

    
end


end

function g = g1(x, h)
g = (f(x+h) - f(x))/h
end

function g = g2(x, h)
g = (f(x+h) - f(x-h))/(2*h)
end

function x = f(x)
x= x*exp(x)
end
function x = fprime(x)
x = (x+1)*exp(x);
end

