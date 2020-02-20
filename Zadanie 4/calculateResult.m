function result = calculateResult(xpomoc, ypomoce)
%Funkcja zwraca koñcowy wynik dopasowania wielu sekwencji. Jako pierwszy argument podawana jest sekwencja do której
%dopasowywane by³y kolejne sekwencje wprowadzony w formie macierzy jako
%drugi argument.

xpomoc = char(xpomoc);
ypomoceCell = cell(1,length(ypomoce));

for j = 1 : length(ypomoce)
    ypomoc = ypomoce(j);
    ypomoc = char(ypomoc);
    ypomoceCell{j} = ypomoc;
end


for i = 1 : length(xpomoc)
    vector(1) = xpomoc(i);
    for x = 2 : length(ypomoce)+1
        v = convertCharsToStrings(ypomoceCell{x-1}(i));
        vector(x) = v;
    end
    
    combinations = nchoosek(vector,2);
    [rows,~] = size(combinations);
    clear R;
    for k = 1 : rows
        combinations(k,1);
        combinations(k,2);
        R(1,k) = scoring(combinations(k,1),combinations(k,2),'myfile.txt');
    end
    score(i) = sum(R);  
end

result = sum(score);

end