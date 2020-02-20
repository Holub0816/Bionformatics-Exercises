function T = filtrowanie3(R,rozm_okna,blad)
g=0;   %1
l=0;   %1
suma = 0;    %1
S = zeros(rozm_okna);    %1
for x = 1 : (length(R)-rozm_okna+1)  
    g=0;
    for z = 1 : (length(R)-rozm_okna+1)
        S = zeros(rozm_okna);
        %pobranie z macierzy R macierzy 4x4
        for i = 1 : rozm_okna
            for j = 1 : rozm_okna
                
                S(i,j) = R(i+x-1,j+z-1);
                
            end
        end
        
        
        %koniec
        
        %sumowanie elementów na przek¹tnej
        for m = 1 : rozm_okna
            if((S(m,m)==1)||(S(m,m)==2))
                
                suma = suma + 1;
                
            end
        end
        
        m=0;
        %koniec
        
        %zast¹pienie jedynek gwiazdkami
        if((suma>=(rozm_okna-blad)))
            for n = 1 : rozm_okna
                if((S(n,n)==1)||(S(n,n)==2))
                    S(n,n) = 2;
                    
                end
            end
            suma=0;
            
            %koniec
            
            %wpisanie macierzy S z powrotem do macierzy R
            
            for i = 1 : rozm_okna
                for j = 1 : rozm_okna
                    
                    R(i+x-1,j+z-1)=S(i,j);
                    
                end
            end
            %koniec
            g=g+1;
        end
        suma=0;
        l=l+1;
    end
    T = zeros(length(R));
    
    
end
for h = 1:length(R)
    for u = 1:length(R)
        if(R(h,u)==2)
            T(h,u)=1;
        end
        if(R(h,u)==1)
            T(h,u)=0;
        end
        if(R(h,u)==0)
            T(h,u)=0;
        end
    end
end


h = figure;
spy(T)
title('Macierz kropkowa');
xlabel('Pierwsza sekwencja');
ylabel('Druga sekwencja');
rozm_oknaStr = int2str(rozm_okna);
str1 = 'Rozmiar okna= ';
finalString1 = strcat(str1,rozm_oknaStr);

bladStr = int2str(blad);
str2 = 'Próg b³êdu= ';
finalString2 = strcat(str2,bladStr);

stringToAnnotation = {finalString1,finalString2};

dim = [.8 .5 .4 .4];
annotation('textbox',dim,'String',stringToAnnotation,'FitBoxToText','on');


hold on;
print(h,'-dpng','matrix.png');


end

%Czasowa z³o¿onoœæ obliczeniowa:v
%22+5n+15nm+5nmk+5nmo+5nmp+5nmr+5nmt+4nmkl+8nmrs+7nmtu

%Przestrzenna z³o¿onoœæ obliczeniowa:
%3nm+nmkl+nmo+nmp+nmrs+nmtu+27