function [minRow,minColumn,matrix,minimum,minValue] = distanceMatrix(combination, results,v)
%Funkcja szukaj¹ca sekwencji o najmniejszej sumie odleg³oœci w celu
%dopasowania do niej reszty sekwencji.
[rows,columns] = size(combination);
matrix = zeros(v);
for i = 1 : rows
    
    matrix(combination(i,1),combination(i,2)) = results(i);
    matrix(combination(i,2),combination(i,1)) = results(i);
end

minimum = matrix == min(matrix(matrix>0));
[minRow,minColumn] = find(minimum);
minValue = matrix(minRow(1),minColumn(1));
end