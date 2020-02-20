function saveToFile(valuesToSave)
%Funkcja saveToFile() zapisuje wyœwietlone parametry do pliku tekstowego.
%Jako argumenty wejœciowe przyjmuje parametry zwracane przez funkcjê
%equations(). Funkcja saveToFile niczego nie zwraca.
for i = 1 : length(valuesToSave)
fileID = fopen('results.txt','wt');
fprintf(fileID,'%s %s\n', valuesToSave{i}.seq1str);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.seq2str);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.modestr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.pairsstr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.scoringstr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.gapstr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.scorestr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.lengthstr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.gapsstr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.identitystr);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.xHelp);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.z);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.yHelp);
fclose(fileID);
end
end

%Czasowa z³o¿onoœæ obliczeniowa:
%15

%Przestrzenna z³o¿onoœæ obliczeniowa:
%10 + 2n + 2m + z