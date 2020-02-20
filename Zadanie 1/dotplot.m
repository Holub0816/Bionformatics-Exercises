function R = dotplot(x,y,rozm_okna,blad)

n = length(x)-1;
m = length(y)-1;
a = zeros(1,n);
b = zeros(1,m);



if(n>m)
    g=m;
else
    g=n;
end

for k = 1:g
    a(k) = x(k);
    b(k) = y(k);
end





for i=1:g
    for j=1:g
        if(a(i)==b(j))
            R(i,j)=1;
        else
            R(i,j)=0;
        end
    end
end

R = filtrowanie3(R,rozm_okna,blad)

end

%Czasowa z³o¿onoœæ obliczeniowa:
%4gn+8g+11

%Przestrzenna z³o¿onoœæ obliczeniowa:
%nm+3n+3m+4
