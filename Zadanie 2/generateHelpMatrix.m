function [helpMatrix, xpomoc, ypomoc] = generateHelpMatrix(valuesToEquations)
%Funkcja zwraca macierz pomocnicz¹ i pozwala na
%zobrazowanie i wyznaczenie drogi dopasowania globalnego, dla której koszt dopasowania
%bêdzie najniejszy. Zwraca równie¿ sekwencje dopasowywane do siebie z
%wstawionymi przerwami i przyrównanymi do siebie.
seq1 = valuesToEquations.seq1;
seq2 = valuesToEquations.seq2;
R = valuesToEquations.R;
helpMatrix = zeros(length(seq1),length(seq2));
maximum = 0;
xpomoc = '';
ypomoc = '';
r = length(seq1)+1;
p = length(seq2)+1;
helpMatrix(r,p) = 1;
matchCounter = 0;
missmatchCounter = 0;
gapCounter = 0;
gap = scoring(seq1(end),seq2(end-1),'myfile.txt')

while (r >= 1 || p >= 1)
    if (p == 1)
        while (r > 1)
            helpMatrix(r-1,1) = 1;
            r = r - 1;
            gapCounter = gapCounter + gap;
        end
        break;
    end
    
    if (r == 1)
        while (p > 1)
            helpMatrix(1,p-1) = 1;
            p = p - 1;
            gapCounter = gapCounter + gap;
        end
        break;
    end
    
    
    odp = scoring(seq1(r),seq2(p),'myfile.txt');
    
    if(R(r,p) - odp == R(r-1,p-1))
        matchCost = R(r-1,p-1);
    else
        matchCost = -100000000000;
    end
    if(R(r,p) - odp == R(r-1,p))
        firstGapCost = R(r-1,p);
    else
        firstGapCost = -100000000000;
    end
    if(R(r,p) - odp == R(r,p-1))
        secondGapCost = R(r,p-1);
    else
        secondGapCost = -100000000000;
    end
    if(R(r,p) - odp == R(r-1,p-1))
        missmatchCost = R(r-1,p-1);
    else
        missmatchCost = -100000000000;
    end
    
    M = [matchCost,missmatchCost,firstGapCost,secondGapCost];
    maximum = max(M);
    
    if(maximum == matchCost)
        helpMatrix(r-1,p-1) = 1;
        r = r-1;
        p = p-1;
        matchCounter = matchCounter + odp;
    elseif(maximum == missmatchCost)
        helpMatrix(r-1,p-1) = 1;
        r = r-1;
        p = p-1;
        missmatchCounter = missmatchCounter + odp;
    elseif(maximum == firstGapCost)
        helpMatrix(r-1,p) = 1;
        r = r-1;
        gapCounter = gapCounter + odp;
    elseif(maximum == secondGapCost)
        helpMatrix(r,p-1) = 1;
        p = p-1;
        gapCounter = gapCounter + odp;
    end
end

helpMatrix(1,1) = 1;
r=1;
p=1;
index = 1;

while((r < length(seq1)+1) || (p < length(seq2)+1))
    
    
    while (r >= 1 || p >= 1)
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

end

