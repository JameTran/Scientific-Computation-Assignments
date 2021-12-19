function main_nn(neurons, learning_rate, niter)

load data.mat
file = 'params.mat';
cost = netbp2(neurons, points, labels, niter, learning_rate, file);

%classify points
testpoints = getpoints(500);
categories = classifypoints(file, testpoints);

% plot cost function
figure(1)
n = length(cost);
semilogy(cost, 'k', 'LineWidth', 1);
xlabel('iteration')
ylabel('cost');
title(sprintf('learning rate %g', learning_rate));
set(gca, 'FontSize', 14);
print('-depsc2', 'learning_rate.eps');

%plot points
figure(2)
plotpoints(points, labels, testpoints, categories, neurons, learning_rate);
title(sprintf('neurons 2,%d,%d,2, learning rate %g\n', ...
    neurons(1), neurons(2), learning_rate));
print('-depsc2', 'classify.eps');

end
