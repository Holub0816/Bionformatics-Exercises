function [structure] = loadSequencesFromFile(filename)
%Funkcja loadSequencesFromFile umo¿liwia wczytanie wielu sekwencji w
%formacie FASTA z jednego pliku tekstowego. Jako argument funkcja pryjmuje
%nazwê pliku, natomiast wartoœci¹ zwracan¹ jest struktura z polami dla
%sekwencji oraz ich identyfikatorów.
file = fileRead(filename);
values = [];
for i = 1:length(file)
    if(file(i)=='>')
        values = [values , i];
    end
end
text = '';
for j = 1 : length(values)
    if(j == length(values))
        text = file(values(j) : end);
    else
        text = file(values(j) : values(j+1) - 1);
    end
    
    [identifier,sequence] = parseFasta(text);
    identifiers{j} = identifier;
    sequences{j} = sequence;
end

sequencesCell = {identifiers,sequences};
names = {'identifier', 'sequence'};

structure = cell2struct(sequencesCell,names,2);

end