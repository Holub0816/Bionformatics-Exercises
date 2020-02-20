function saveToFile(nwk)
%Funkcja umo¿liwia zapis drzewa filogenetycznego do pliku tekstowego w
%formacie Newick.
fileID = fopen('savedFile.txt','wt');
fprintf(fileID,'%s %s\n', nwk);
fclose(fileID);
end