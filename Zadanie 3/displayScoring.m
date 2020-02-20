function [pairs, scoring] = displayScoring(filename)
%Funkcja ta umo¿liwia wyœwietlenie kosztów dopasowania, niedopasowania i
%kar za przerwy w przystêpnym formacie zgodnym z tym nakazanym w instrukcji
%do æwiczenia.
[columnsStr, rowsStr, matrix] = substMatrix(filename);
a = "";
q = "";

for i = 1 : length(columnsStr)
    for j = 1 : length(rowsStr)
        char = strcat(columnsStr(i), rowsStr(j));
        a = strcat(a,char);
        q = strcat(q,char);
        q = strcat(q," ");
    end
end

a = convertStringsToChars(a);
z = a;
scoring = "";

for i = 2 : 2 : length(a)
    d = insertAfter(a(i-1), a(i-1), a(i));
    for j = 2 : 2 : length(a)
        k = fliplr(insertAfter(a(j-1), a(j-1), a(j)));
        if(d == k)
            idx = strfind(z,d);
            if(length(idx) == 2 && d(1) ~= d(2))
                z = eraseBetween(z, idx(2), idx(2)+1);
            end
        end
    end
end
pairs = "";

for i = 2 : 2 : length(z)
    char1 = z(i-1);
    char2 = z(i);
    k1 = columnsStr == char1;
    k2 = rowsStr == char2;
    
    scoring = strcat(scoring, num2str(matrix(k1, k2))+"   ");
end

for i = 2 : 2 : length(z)
    char = strcat(z(i-1), z(i));
    pairs = strcat(pairs, char + "   ");
end
scoring = strtrim(scoring);
pairs = strtrim(pairs);
scoring = convertStringsToChars(scoring);
pairs = convertStringsToChars(pairs);
end