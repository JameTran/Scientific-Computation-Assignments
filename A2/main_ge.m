function main_ge
n = 2000;
experiment = 0;
fprintf("Experiment a\\b      No Pivoting      cond(A)\n")
fprintf("---------------------------------------------------------\n")
for i = 1:5
A = randn(n);
x = ones(n, 1);
b = A*x;
B = GE(A);
%Backwards Sub Stuff
ipivot = 1:size(A);
c = backwards(B, b, ipivot)';
better_c = A\b;
r = b - A*c;
error_c = cond(A)*((norm(r)/norm(b)));
r_better_c = b - A*better_c;
error_better_c = cond(A)*(norm(r_better_c)/norm(b));
experiment = experiment + 1;

fprintf("%d\t%d \t%d \t %d\n", experiment, error_better_c, error_c, cond(A))
end
end 