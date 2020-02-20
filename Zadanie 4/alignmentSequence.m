function [structure,xpomoc,ypomoce] = alignmentSequence(values)
% Funkcja umo¿liwiaj¹ca dopasowanie wielu sekwencji oraz utworzenie ich
% reprezentacji tekstowych i zapis w formie tablicy komórkowej
ind = values.ind;
vector = values.vector;
structure = values.structure;
filename2 = values.filename2;

for j = 1:max(size(vector))
    if (j==1)
        sequence1 = char(structure.sequence(ind));
    else
        sequence1 = xpomoc;
    end
    sequence2 = char(structure.sequence(vector(j)));
    valuesToEquations = matrix(sequence1,sequence2,filename2);
    [~,helpMatrix] = generateHelpMatrix(valuesToEquations);
    [xpomoc,ypomoc] = textRepresentation(helpMatrix,valuesToEquations);
    ypomoc = convertCharsToStrings(ypomoc);
    xpomoc = convertCharsToStrings(xpomoc);
    ypomoce(j) = ypomoc;
    xpomoce(j) = xpomoc;
    xpomoc = char(xpomoc);
end

for i = 2 : length(ypomoce)
    collection = ypomoce(1:i-1);
    count = 1;
    for j = 1 : length(collection)
        present = collection(j);
        present = char(present);
        xpomocPrevious = xpomoce(i-1);
        xpomocPrevious = char(xpomocPrevious);
        xpomocPresent = xpomoce(i);
        xpomocPresent = char(xpomocPresent);
        s = 1;
        for k = 1 : length(xpomocPresent)+1
            
            if (k > length(xpomocPrevious))
                
                l = length(xpomocPresent) - length(xpomocPrevious);
                for z = 1 : l
                    present = insertAfter(present,length(present),'-');
                end
                break;
            end
            if (xpomocPresent(k)~=xpomocPrevious(k) && xpomocPresent(k)=='-')
                
                present = insertAfter(present,(k-1),'-');
                present = char(present);
                xpomocPrevious = insertAfter(xpomocPrevious,(k-1),'-');
                xpomocPrevious = char(xpomocPrevious);
            end
        end
        ypomoce(count) = present;
        count = count + 1;
    end
end
xpomoc = xpomoce(end);
end