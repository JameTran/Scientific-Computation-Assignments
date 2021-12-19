function b = GE(A)
a = A;
b = gauss_eliml(a);

function A = gauss_eliml(A)
    [n, ~] = size(A);
    L = zeros(n);

    for k = 1:n - 1

        for i = k + 1:n
            m = A(i, k) / A(k, k);

            for j = k + 1:n
                A(i, j) = A(i, j) - m * A(k, j);
            end
            L(i, k) = m;
        end
        A(k + 1:n, k) = 0; 
    end
    A = A + L;
end

end