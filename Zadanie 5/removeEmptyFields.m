function newStructure = removeEmptyFields(structure)
%Funkcja jako argument przyjmuje strukturê z nowo dodanym klastrem. Z racji
%tego, ¿e podczas tworzenia nowej struktury za pomoc¹ funkcji
%createNewStruct() komórki z sekwencjami zostaj¹ wyzerowane funkcja
%removeEmptyFields usuwa te komórki.
s = 1;
for i = 1 : length(structure.sequence)
    if(~isempty(structure.sequence{i}))
        ischar(structure.sequence{i})
        if(isvector(structure.sequence{i}) && ~ischar(structure.sequence{i}))
            if(~isempty(structure.sequence{i}{1}))
                identifiers{s} = structure.identifier{i};
                sequences{s} = structure.sequence{i};
                s = s+1;
            end
        else
            identifiers{s} = structure.identifier{i};
            sequences{s} = structure.sequence{i};
            s = s+1;
        end
    end
end
sequencesCell = {identifiers,sequences};
names = {'identifier', 'sequence'};
newStructure = cell2struct(sequencesCell,names,2);
end