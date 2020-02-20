function [valuesToEquations] = matrix(x,y,filename)
%Funkcja matrix jako parametry wejœciowe przyjmuje sekwencje nuklotydów, karê za przerwy oraz nazwê pliku, z którego pobierane bêd¹
%dane o kosztach dopasowañ, niedopasowañ i przerw.
%Funkcja tworzy macierz dopasowania
%globalnego. Funkcja zwraca nastêpuj¹ce parametry w formie struktury: obie sekwencje nukleotydowe, macierz
%dopasowania globalnego, cenê przerw, a tak¿e nazwê pliku.
str = ['-',x];
seq1 = join(str);
str2 = ['-',y];
seq2 = join(str2);
gap = scoring('-',seq2(2),filename);

R = zeros(length(seq1),length(seq2));

for i = 2 : length(seq1)
    R(i,1) = R(i-1,1) + gap;
    
end

for i = 2 : length(seq2)
    R(1,i) = R(1,i-1) + gap;
end


for i = 2 : length(seq1)
    i
    for j = 2 : length(seq2)
        odp = scoring(seq1(i),seq2(j), filename);
        a = R(i-1,j-1) + odp;
        b = R(i-1,j) + gap;
        c = R(i,j-1) + gap;
        M = [a, b, c];
        value = min(M);
        R(i,j) = value;
    end
end
valuesToEquations = struct('seq1', x, 'seq2', y,'R', R ,'gap', gap,'filename', filename );
end

