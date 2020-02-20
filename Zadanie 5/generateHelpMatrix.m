function [cost,helpMatrix] = generateHelpMatrix(valuesToEquations)
%Funkcja zwraca macierz pomocnicz¹ i pozwala na
%zobrazowanie i wyznaczenie drogi dopasowania globalnego, dla której koszt dopasowania
%bêdzie najniejszy. Zwraca równie¿ sekwencje dopasowywane do siebie z
%wstawionymi przerwami i przyrównanymi do siebie.
seq1 = valuesToEquations.seq1;
seq2 = valuesToEquations.seq2;
R = valuesToEquations.R;
helpMatrix = zeros(length(seq1),length(seq2));
minimum = 0;
xpomoc = '';
ypomoc = '';
r = length(seq1)+1;
p = length(seq2)+1;
helpMatrix(r,p) = 1;
matchCounter = 0;
missmatchCounter = 0;
gapCounter = 0;
cost = 0;
gap = scoring('-',seq2(2),'myfile.txt');

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
    
    odp = scoring(seq1(r-1),seq2(p-1),'myfile.txt');
    
    if(R(r,p) - odp == R(r-1,p-1))
        matchCost = R(r-1,p-1);
    else
        matchCost = 100000000000;
    end
    if(R(r,p) - gap == R(r-1,p))
        firstGapCost = R(r-1,p);
    else
        firstGapCost = 100000000000;
    end
    if(R(r,p) - gap == R(r,p-1))
        secondGapCost = R(r,p-1);
    else
        secondGapCost = 100000000000;
    end
    if(R(r,p) - odp == R(r-1,p-1))
        missmatchCost = R(r-1,p-1);
    else
        missmatchCost = 100000000000;
    end
    
    M = [matchCost,missmatchCost,firstGapCost,secondGapCost];
    minimum = min(M);
    
    if(minimum == matchCost)
        helpMatrix(r-1,p-1) = 1;
        r = r-1;
        p = p-1;
        matchCounter = matchCounter + odp;
    elseif(minimum == missmatchCost)
        helpMatrix(r-1,p-1) = 1;
        r = r-1;
        p = p-1;
        missmatchCounter = missmatchCounter + odp;
    elseif(minimum == firstGapCost)
        helpMatrix(r-1,p) = 1;
        r = r-1;
        gapCounter = gapCounter + odp;
    elseif(minimum == secondGapCost)
        helpMatrix(r,p-1) = 1;
        p = p-1;
        gapCounter = gapCounter + odp;
    end
end
cost = gapCounter+missmatchCounter+matchCounter;
helpMatrix(1,1) = 1;