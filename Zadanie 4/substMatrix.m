function [columnStr, rowStr, a] = substMatrix(filename)
% Funkcja pobieraj¹ca z pliku tekstowego informacjê o punktacji
% poszczególnych substytucji oraz kar za przerwy
f = fopen(filename,'r');
x = fgetl(f);
v = fgetl(f);

string = "";
remain = x;
while (remain ~= "")
    [token,remain] = strtok(remain, ' ');
    string = [ string,token];
end

rowStr = erase(string,'#');
rowStr = strjoin(rowStr);
rowStr = strtrim(rowStr);
rowStr = convertStringsToChars(rowStr);
rowStr = strrep(rowStr,' ','');

a = dlmread(filename,' ',[1 1 length(rowStr) length(rowStr)]);
len = length(a);
columnStr = v(1);

for i = 3 : len + 1
    j = fgetl(f);
    columnStr = strcat(columnStr,j(1));
end
fclose(f);
end

