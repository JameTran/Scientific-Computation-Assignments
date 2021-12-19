%A function to train a neural network

function cost = netbp2(neurons, data, labels, Niter,  lr, file)

%NETBP  Uses backpropagation to train a network 

%%%%%%% DATA %%%%%%%%%%%
%y = [ones(1,5) zeros(1,5); zeros(1,5) ones(1,5)]
x1 = data(1, :); %all data in first row is x
x2 = data(2, :); %all data in second row is y
numcol = size(x2,2);


w2_layer_num = neurons(1);
w3_layer_num = neurons(2);

% Initialize weights and biases 
rng(5000);
W2 = 0.5*randn(w2_layer_num,2); W3 = 0.5*randn(w3_layer_num,w2_layer_num); W4 = 0.5*randn(2,w3_layer_num);
b2 = 0.5*randn(w2_layer_num,1); b3 = 0.5*randn(w3_layer_num,1); b4 = 0.5*randn(2,1);

% Forward and Back propagate 
%lr = 0.05;                % learning rate
%Niter = 1e5;               % number of SG iterations 
savecost = zeros(Niter,1); % value of cost function at each iteration
for counter = 1:Niter
    k = randi(numcol);         % choose a training point at random
    x = [x1(k); x2(k)];
    % Forward pass
    a2 = activate(x,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    % Backward pass
    delta4 = a4.*(1-a4).*(a4-labels(:,k));
    delta3 = a3.*(1-a3).*(W4'*delta4);
    delta2 = a2.*(1-a2).*(W3'*delta3);
    % Gradient step
    W2 = W2 - lr*delta2*x';
    W3 = W3 - lr*delta3*a2';
    W4 = W4 - lr*delta4*a3';
    b2 = b2 - lr*delta2;
    b3 = b3 - lr*delta3;
    b4 = b4 - lr*delta4;
    % Monitor progress
    newcost = new_cost(W2,W3,W4,b2,b3,b4) ;  % display cost to screen
    cost(counter) = newcost;
    fprintf("i=%d  %e\n", counter, newcost); 
end

% Show decay of cost function  
save costvec
semilogy([1:1e4:Niter],savecost(1:1e4:Niter))

    function costval = new_cost(W2,W3,W4,b2,b3,b4)
     costvec = zeros(numcol,1); 
     for i = 1:length(data)
         x =[x1(i);x2(i)];
         a2 = activate(x,W2,b2);
         a3 = activate(a2,W3,b3);
         a4 = activate(a3,W4,b4);
         costvec(i) = norm(labels(:,i) - a4,2);
     end
     costval = norm(costvec,2)^2;
  end % of nested function

save(file, 'W2', 'W3', 'W4', 'b2', 'b3', 'b4')
end
