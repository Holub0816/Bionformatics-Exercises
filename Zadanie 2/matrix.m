function [valuesToEquations] = matrix(x,y, mode,match, missmatch, gap)
%Funkcja matrix jako parametry wej�ciowe przyjmuje sekwencje nuklotyd�w,kt�re b�dzie mo�na por�wna� oraz nazw� trybu dla kt�rego b�dziemy generowa� warto�ci w macierzy.
%Funkcja tworzy macierz dopasowania
%globalnego.
%Funkcja zwraca nast�puj�ce parametry: obie sekwencje nukleotydowe, macierz
%dopasowania globalnego, tryb pracy, cen� dopasowa�,
%niedopasowa� oraz przerw, a tak�e warto�� indicatora.
str = ['-',x];
str2 = ['-',y];
seq1 = join(str)
seq2 = join(str2)


R = zeros(length(seq1),length(seq2));

for i = 2 : length(seq2)
    R(1,i) = R(1,i-1) + gap;
    
end

for i = 2 : length(seq1)
    R(i,1) = R(i-1,1) + gap;
end

for i = 2 : length(seq1)
    for j = 2 : length(seq2)
        seq1(i);
        seq2(j);
        if(seq1(i) == seq2(j))
            a = R(i-1,j-1) + match;
            b = R(i-1,j) + gap;
            c = R(i,j-1) + gap;
        else
            a = R(i-1,j-1) + missmatch;
            b = R(i-1,j) + gap;
            c = R(i,j-1) + gap;
        end
        M = [a, b, c];
                odp = max(M);
        R(i,j) = odp;
       
    end
end
indicator = 0;
valuesToEquations = struct('seq1', x, 'seq2', y, 'R', R, 'mode', mode, 'gap', gap, 'match', match, 'missmatch', missmatch, 'indicator', indicator);


%Czasowa z�o�ono�� obliczeniowa:
%41 + 12n + 7m + 8nm

%Przestrzenna z�o�ono�� obliczeniowa:
%32 + 2nm + n + m
R
end


