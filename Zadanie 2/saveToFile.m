function saveToFile(valuesToSave)
%Funkcja saveToFile() zapisuje wy�wietlone parametry do pliku tekstowego.
%Jako argumenty wej�ciowe przyjmuje parametry zwracane przez funkcj�
%equations(). Funkcja saveToFile niczego nie zwraca.
fileID = fopen('myfile.txt','wt');
fprintf(fileID,'%s %s\n', valuesToSave.seq1str);
fprintf(fileID,'\n%s %s\n', valuesToSave.seq2str);
fprintf(fileID,'\n%s %s\n', valuesToSave.modestr);
fprintf(fileID,'\n%s %s\n', valuesToSave.matchstr);
fprintf(fileID,'\n%s %s\n', valuesToSave.missmatchstr);
fprintf(fileID,'\n%s %s\n', valuesToSave.gapstr);
fprintf(fileID,'\n%s %s\n', valuesToSave.scorestr);
fprintf(fileID,'\n%s %s\n', valuesToSave.lengthstr);
fprintf(fileID,'\n%s %s\n', valuesToSave.gapsstr);
fprintf(fileID,'\n%s %s\n', valuesToSave.identitystr);
fprintf(fileID,'\n%s %s\n', valuesToSave.xpomoc);
fprintf(fileID,'\n%s %s\n', valuesToSave.z);
fprintf(fileID,'\n%s %s\n', valuesToSave.ypomoc);
fclose(fileID);

end

%Czasowa z�o�ono�� obliczeniowa:
%15

%Przestrzenna z�o�ono�� obliczeniowa:
%10 + 2n + 2m + z