function main_bonus()
f =@(t, y) [-1.71*y(1) + 0.43*y(2) + 8.32*y(3) + 0.0007
    1.71*y(1) - 8.75*y(2)
    -10.03*y(3) + 0.43*y(4) + 0.035*y(5)
    8.32*y(2) + 1.71*y(3) - 1.12*y(4)
    -1.745*y(5) + 0.43*y(6) + 0.43*y(7)
    -280*y(6)*y(8) + 0.69*y(4) + 1.71*y(5) - 0.43*y(6) + 0.69*y(7)
    280*y(6)*y(8) - 1.81*y(7)
    -280*y(6)*y(8) + 1.81*y(7)];

input = [ 1, 0, 0, 0, 0, 0, 0, 0.0057]';

[x, y] = ode15s(f,[0 5], input);
figure;
plot(x, y(:,1))
figure;
plot(x, y(:,2))
figure;
plot(x, y(:,3))
figure;
plot(x, y(:,4))
figure;
plot(x, y(:,7))
figure;
plot(x, y(:,8))
[x, y] = ode15s(f,[0 400], input);
figure;
plot(x,y(:,5))
figure;
plot(x,y(:,6))

options = odeset('AbsTol',10^-6,'RelTol',10^-6);
range = [0 321.8122];
tic;
[x,y,stats] = ode23s(f, range, input, options);
cpu_time(1) = toc;
steps(1) = stats(1);
fsteps(1) = stats(2);
func(1) = stats(3);
lu(1) = stats(4);
nolin(1) = stats(5);


tic;
[x,y,stats15] = ode15s(f, range, input, options);
cpu_time(2) = toc;
steps(2) = stats15(1);
fsteps(2) = stats15(2);
func(2) = stats15(3);
lu(2) = stats15(4);
nolin(2) = stats15(5);


tic
[x,y,stats45] = ode45(f, range, input, options);
cpu_time(3) = toc;
steps(3) = stats45(1);
fsteps(3) = stats45(2);
func(3) = stats45(3);
lu(3) = stats45(4);
nolin(3) = stats45(5);
names = ["Solver"; "CPU Steps"; "steps"; "failed steps"; "functional evals"; "LU decomposition"; "nonlinear solves"];
solver = ["ode23s"; "ode15s"; "ode45"];
CPU_Time = cpu_time';
steps = steps';
failed_steps = fsteps'
function_eval = func'
LU_decomposition = lu';
nonlinear_solves = nolin';


results = table(solver, CPU_Time, steps, failed_steps, function_eval, LU_decomposition, nonlinear_solves)
end


