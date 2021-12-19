function expsum
 exp_nums = [-20, -15, -5, -1, 1, 5, 15, 20];
    %Running expsum1(x)
    fprintf("expsum1(x) results:\n")
    fprintf("x \t \t accurate value \t \t approx. value \t \t abs. error \t \t \t rel. error \n");
    for i = 1 : length(exp_nums)
        y_accurate = exp(exp_nums(i)); 
        y_approx = expsum1(exp_nums(i));
        abs_error = abs(y_accurate - y_approx); 
        rel_error = abs(y_accurate - y_approx)/abs(y_accurate);
        fprintf("%d \t %5.12e \t %.12e \t %e \t \t %e \n", exp_nums(i), y_accurate, y_approx, abs_error, rel_error);
    end
    fprintf("\n");
    %Running expsum2(x)
    fprintf("expsum2(x) results:\n")
    fprintf("x \t \t accurate value \t \t approx. value \t \t abs. error \t \t \t rel. error \n");
    for i = 1 : length(exp_nums)
        y_accurate = exp(exp_nums(i)); 
        y_approx = expsum2(exp_nums(i));
        abs_error = abs(y_accurate - y_approx);
        rel_error = abs(y_accurate - y_approx)/abs(y_accurate);
        fprintf("%d \t %5.12e \t %.12e \t %e \t \t %e \n", exp_nums(i), y_accurate, y_approx, abs_error, rel_error);
    end
    fprintf("\n");
    %Running expsum3(x)
    fprintf("expsum3(x) results:\n")
    fprintf("x \t \t accurate value \t \t approx. value \t \t abs. error \t \t \t rel. error \n");
    for i = 1 : length(exp_nums)
        y_accurate = exp(exp_nums(i));
        y_approx = expsum3(exp_nums(i));
        abs_error = abs(y_accurate - y_approx);
        rel_error = abs(y_accurate - y_approx)/abs(y_accurate);
        fprintf("%d \t %5.12e \t %.12e \t %e \t \t %e \n", exp_nums(i), y_accurate, y_approx, abs_error, rel_error);
    end
end

function s = expsum1(x)
i = 0;
sum = 0;
while 1
    y = (x.^i)/(factorial(i));
    i = i + 1;
    if sum == sum + y
        break
    end
    sum = sum + y; 

    end
s = sum;
end

function s = expsum2(x)
    if x < 0
        s = 1/expsum1(-x);
    else 
        s = expsum1(x);
    end
end

function s = expsum3(x)
i = 0;
sum_pos = 0;
sum_neg = 0;

if x < 0
    while 1
        y = (x.^i)/(factorial(i));
        i = i+1;
        if mod(i, 2) ~= 0 %if it's odd, and therefore negative
            if sum_neg == sum_neg + y %if the sum won't change
                break
            end
            sum_neg = sum_neg + y;
        else %if it's even
            if sum_pos == sum_pos + y %if the sum won't change
                break
            end
        sum_pos = sum_pos + y;
        end
    end

    else
        sum_pos = expsum1(x);
end
s = sum_pos + sum_neg;

end
