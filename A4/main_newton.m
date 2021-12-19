function main_newton()

syms x1 x2 x3 x4
tol = 1e-6;

eq1 = x1 + x2*(x2*(5-x2)-2)-13;
eq2 = x1 + x2*(x2*(1+x2)-14)-29;
parta_start = [15 -2];
[parta_x, parta_count] = newtons_method([eq1; eq2], [x1, x2], parta_start, tol)
parta_funcs = @(x)[x(1) + x(2)*(x(2)*(5-x(2))-2)-13; 
            x(1) + x(2)*(x(2)*(1+x(2))-14)-29];
parta_res = fsolve(parta_funcs, parta_start)

eq3 = x1^2 + x2^2 + x3^2 - 5;
eq4 = x1 + x2 - 1;
eq5 = x1 + x3 - 3;
partb_start = [(1+sqrt(3))/2, (1-sqrt(3))/2, sqrt(3)];

[partb_x, partb_count] = newtons_method([eq3; eq4; eq5], [x1, x2, x3], partb_start, tol)
partb_funcs = @(x)[x(1)^2 + x(2)^2 + x(3)^2 - 5; 
                        x(1) + x(2) - 1;
                        x(1) + x(3) - 3];
partb_res = fsolve(partb_funcs, partb_start)

eq6 = x1 + 10*x2;
eq7 = sqrt(5)*(x3 - x4);
eq8 = (x2 - x3)^2;
eq9 = sqrt(10)*(x1 - x4)^2;
partc_start = [1, 2, 1, 1];
[partc_x, partc_count] = newtons_method([eq6; eq7; eq8; eq9], [x1, x2, x3, x4], partc_start, tol)
partc_funcs = @(x)[x(1) + 10*x(2); 
                       sqrt(5)*(x(3) - x(4));
                       (x(2) - x(3))^2;
                       sqrt(10)*(x(1) - x(4))^2];
partc_res = fsolve(partc_funcs, partc_start)

eq10 = 10^4*x1*x2 - 1;
eq11 = exp(-x1) + exp(-x2) - 1.0001;
partd_start = [0, 0];
[partd_x, partd_count] = newtons_method([eq10;eq11], [x1, x2], partd_start, tol)
 partd_funcs = @(x)[10^4*x(1)*x(2); 
                       exp(-x(1))+exp(-x(2));];
partd_res = fsolve(partd_funcs, partd_start)

    

end

function [x_vals, count] = newtons_method(eq, var, start_x, tol)
    curr_x = start_x;
    jacob = jacobian(eq, var);
    accuracy = double(norm(subs(eq, var, curr_x)));
    count = 0;
    while(accuracy > tol)
        j_vals = double(subs(jacob, var, curr_x));
        f_vals = double(subs(eq, var, curr_x));
        accuracy = norm(f_vals);
        step = -(j_vals\f_vals);
        next_x = curr_x + step';
        curr_x = next_x;
        count = count + 1;
    end
    x_vals = curr_x;
end