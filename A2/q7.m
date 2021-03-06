x = linspace(-pi, pi, 21);
y = sin(x);
a = polyfit(x, y, 20);

x1 = linspace(-pi, pi, 41);
y1 = sin(x1);
a1 = polyval(a, x1);
error = abs(y1 - a1);

%chebyshev
cheby_21 = zeros(1, length(x));
for i = 0:length(x)-1
    cheby_21(i+1) = pi*cos((((2*i+1)/(2*(length(x)-1)+ 2))*pi));
end
y_cheby = sin(cheby_21);

cheby_poly_20 = polyfit(cheby_21, y_cheby, 20);
cheby_polyv_41 = polyval(cheby_poly_20, x1);
error_cheby = abs(y1 - cheby_polyv_41);
% plot(x1, a1)
% hold on
% plot(x1, y1)
% hold off

plot(x1, error)
% plot(x1, cheby_polyv_41)
% hold on
% plot(x1, y1)
% hold off
%plot(x1, error_cheby)