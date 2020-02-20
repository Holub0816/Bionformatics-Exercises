function [structure] = loadSequencesFromFile(varargin)
%Funkcja loadSequencesFromFile umo¿liwia wczytanie wielu sekwencji w
%formacie FASTA z jednego pliku tekstowego. Jako argument funkcja pryjmuje
%nazwê pliku, natomiast wartoœci¹ zwracan¹ jest struktura z polami dla
%sekwencji oraz ich identyfikatorów.

if(nargin == 1)
    file = fileRead(varargin{1});
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
    
else
    urls = zeros(1, length(varargin{1}));
    for i = 1 : nargin
        url= fetchFasta(i,varargin{i});
        [identifier,sequence] = parseFasta(url);
        identifiers{j} = identifier;
        sequences{j} = sequence;
        sequencesCell = {identifiers,sequences};
        names = {'identifier', 'sequence'};
        structure = cell2struct(sequencesCell,names,2);
    end
end
end