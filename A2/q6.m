x = linspace(-1, 1, 21);
y = abs(x);
a = polyfit(x, y, 20);

x1 = linspace(-1, 1, 41);
y1 = abs(x1);

a1 = polyval(a, x1);
error = zeros(1, length(x1));
for i = 1:length(a1)
error(i) = abs(y1(i) - a1(i));
end
%chebyshev
cheby_21 = zeros(1, length(x));
for i = 0:length(x)-1
    cheby_21(i+1) = cos((((2*i+1)/(2*(length(x)-1)+ 2))*pi));
end
y_cheby = abs(cheby_21);
cheby_poly_20 = polyfit(cheby_21, y_cheby, 20);
cheby_polyv_41 = polyval(cheby_poly_20, x1);

cheby_error = abs(y1 - cheby_polyv_41);
%part a graph
% plot(x1, y1) 
% hold on
% plot (x1, a1)
% hold off
plot(x1, error) %error plot
% plot (x1, y1)
% hold on 
% plot(x1, cheby_polyv_41)
% hold off
%plot(x1, cheby_error)


