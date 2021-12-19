function p = newton(x, y, degree)
t = sym('t');
a = divDif(x, y)
terms = 1;
poly_eq = a(1);
    for i = 2:degree+1;
        terms = terms * (t - x(i-1));
        poly_eq = poly_eq + terms*a(i);
        
    end
p = expand(poly_eq);
sym2poly(p);

function coeff = divDif(x, y)
n=length(x);

y=y';
y(n,n)=0;
    for column=2:n
        for row=column:n
        y(row,column)=(y(row,column-1)-y(row-1,column-1))/...
            (x(row)-x(row-column+1));
        end
    end
coeff(n)=0;
    for row=1:n
        coeff(row)=y(row,row);
    end
end
end
