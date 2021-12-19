close all; clear all;

% plot the orbits
A = dlmread('nbody.dat');
p = {'Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto'};
k = 1;
t = A(:,1);
for i=2:3:15
    x = A(:, i);
    y = A(:, i+1);
    z = A(:, i+2);
    plot3 ( x, y, z )
    hold on

    period = findPeriod(t, x,y,z);
    
    fprintf('%-8s\t%f \n', p{k}, period);
    k = k+1;
end
xlabel('x')
ylabel('y')
zlabel('z')
legend('Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto')
