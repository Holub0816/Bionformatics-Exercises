function saveToFile(text)
%Funkcja, która umo¿liwi zapis danych po dopasowaniu do pliku tekstowego
%tak jak w formacie FASTA
fileID = fopen('savedFastaFile.txt','wt');
for i = 1 : length(text.identifier)
    fprintf(fileID,'\n%s %s\n', text.identifier{i});
    fprintf(fileID,'\n%s %s\n', text.sequence{i});
end
fclose(fileID);
end