function x = backward(B, b, ipivot)
b = b(ipivot, :);
z = [];    
U = triu(B);
[n, n] = size(B);
L = tril(B, -1) + eye(n);


% Lower trianglular thing
z(1) = b(1);
for i = 2:n
    sum = 0;
    for j = 1:i-1
        sum = sum + L(i,j)*z(j);
    end
    z(i) = b(i) - sum;
end

%Upper Triangular ting
z = z';
x = zeros(1, n);
x(n) = z(n)/U(n, n);

for i = n - 1: -1: 1
    sum2 = 0;
    for j = i+1:n
        sum2 = sum2 + U(i,j)*x(j);
    end
    x(i) = (z(i) - sum2)/U(i,i);
end
end