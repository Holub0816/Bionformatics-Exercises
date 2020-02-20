function [xpomoc,ypomoc] = textRepresentation(helpMatrix, valuesToEquations)
%Funkcja tworz¹ca tekstow¹ reprezentacjê porównywanych sekwencji na
%podstawie macierzy przedstawiaj¹ce globaln¹ œcie¿kê dopasowania
r=1;
p=1;
index = 1;
seq1 = valuesToEquations.seq1;
seq2 = valuesToEquations.seq2;
xpomoc = '';
ypomoc = '';
while((r < length(seq1)+1) || (p < length(seq2)+1))
    
    if (p == length(seq2)+1)
        while (r < length(seq1)+1)
            xpomoc(index) = seq1(r);
            ypomoc(index) = '-';
            r = r + 1;
            index = index + 1;
        end
        break;
    end
    
    if (r == length(seq1)+1)
        while (p < length(seq2)+1)
            xpomoc(index) = '-';
            ypomoc(index) = seq2(p);
            p = p + 1;
            index = index + 1;
        end
        break;
    end
    
    a = helpMatrix(r+1,p+1);
    b = helpMatrix(r+1,p);
    c = helpMatrix(r,p+1);
    
    if(a == 1)
        xpomoc(index) = seq1(r);
        ypomoc(index) = seq2(p);
        r = r + 1;
        p = p + 1;
        
    elseif(b == 1)
        xpomoc(index) = seq1(r);
        ypomoc(index) = '-';
        r = r + 1;
        
    elseif(c == 1)
        xpomoc(index) = '-';
        ypomoc(index) = seq2(p);
        p = p + 1;
        
    end
    index = index + 1;
end
end