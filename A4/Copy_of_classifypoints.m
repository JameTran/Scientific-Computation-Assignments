function category = classifypoints(file, points)
    load(file);
    for i = 1:size(points,2)
        a2 = activate(points(:, i),W2,b2);
        a3 = activate(a2,W3,b3);
        a4 = activate(a3,W4,b4);

        if a4(1) >= a4(2)
            category(i) = 1;
        else
            category(i) = 0;
        end
    end
end