function [Z, xvalues, yvalues, helpMatrix] = generateHelpMatrix (valuesToEquations)
% Funkcja umo¿liwiaj¹ca tworzenie macierzy przedstawiaj¹ca optymaln¹
% œcie¿kê dopasowania. Druga czêœæ jest odpowiedzialna za tworzenie
% reprezentacji tekstowej sekwencji dopasowywanych (wstawianie kolejnych
% znaków lub przerw). Zarówno macierze optymalnego dopasowania jak i
% reprezentacje tekstowe sekwencji s¹ zapisywane w formie komórek i
% zwracane przez funkcjê.
R = valuesToEquations.R;
seq1 = valuesToEquations.seq1;
seq2 = valuesToEquations.seq2;
gap = valuesToEquations.gap;
filename = valuesToEquations.filename;
helpMatrix = zeros(length(seq1),length(seq2));
newMatrix = max(R);
newMatrix = max(newMatrix);
[row, column] = find(R == newMatrix);
Z = cell(length(row),1);
xvalues = cell(length(row),1);
yvalues = cell(length(row),1);
for i = 1 : length(column)
    xHelp = '';
    yHelp = '';
    r = row(i);
    p = column(i);
    helpMatrix(r,p) = 1;
    
    while(R(r,p)>0)   %B³êdny warunek 
        odp = scoring(seq1(r),seq2(p), filename);
        if((r - 1 > 1) && (p - 1 > 1) && (R(r,p) - odp == R(r-1,p-1)))
            helpMatrix(r-1,p-1) = 1;
            r = r - 1;
            p = p - 1;
            
        elseif( (r - 1 > 1) && (R(r,p) - gap == R(r-1,p)))
            helpMatrix(r-1,p) = 1;
            r = r - 1;
            
        elseif( (p - 1 > 1) && (R(r,p) - gap == R(r,p-1)))
            helpMatrix(r,p-1) = 1;
            p = p - 1;
        else
            break;
        end
    end
    Z{i} = helpMatrix;
    index = 1;
    r = r+1;
    p = p+1;
    while((r <= row(i)) && (p <= column(i)))

        if(r == row(i) && p == column(i))
            xHelp(index) = seq1(r);
            yHelp(index) = seq2(p);
            break;
        end
        
      
        a = helpMatrix(r+1,p+1);
        b = helpMatrix(r+1,p);
        c = helpMatrix(r,p+1);
       
        if(a == 1)
            
            xHelp(index) = seq1(r);
            yHelp(index) = seq2(p);
            r = r + 1;
            p = p + 1;
            
        elseif(b == 1)
            
            xHelp(index) = seq1(r);
            yHelp(index) = '-';
            r= r + 1;
            
        elseif(c == 1)
            xHelp(index) = '-';
            yHelp(index) = seq2(p);
            p = p + 1;
            
        end
        index = index + 1;
    end
    xvalues{i} = xHelp;
    yvalues{i} = yHelp;
end
end