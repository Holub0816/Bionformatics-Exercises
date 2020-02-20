 function [valuesToEquations] = points(x,y,gap, filename)
%Funkcja matrix jako parametry wej�ciowe przyjmuje sekwencje nuklotyd�w, kar� za przerwy oraz nazw� pliku, z kt�rego pobierane b�d�
%dane o kosztach dopasowa�, niedopasowa� i przerw.
%Funkcja tworzy macierz dopasowania
%globalnego. Funkcja zwraca nast�puj�ce parametry w formie struktury: obie sekwencje nukleotydowe, macierz
%dopasowania globalnego, cen� przerw, a tak�e nazw� pliku.
str = ['-',x];
str2 = ['-',y];
seq1 = join(str);
seq2 = join(str2);
R = zeros(length(seq1),length(seq2));

for i = 2 : length(seq2)
    R(1,i) = 0;
end

for i = 2 : length(seq1)
    R(i,1) = 0;
end

for i = 2 : length(seq1)
    
    for j = 2 : length(seq2)
        odp = scoring(seq1(i),seq2(j), filename);
        a = R(i-1,j-1) + odp;
        b = R(i-1,j) + gap;
        c = R(i,j-1) + gap;
        M = [a, b, c, 0];
        value = max(M); %Maksymalna je�eli jest 0 to nale�y przyj�� zero 
        R(i,j) = value;
    end
end
valuesToEquations = struct('seq1', seq1, 'seq2',seq2,'x',x,'y',y,'R', R ,'gap', gap,'filename', filename);
end

