function [newValues] = createNewStruct(values)
%Funkcja przyjmnuje jako argument strukturê. Dziêki niej mo¿liwe jest
%zbudowanie nowej, aktualnej struktury sekwencji i identyfikatorów z
%uwzglêdniem nowo powsta³ych klastrów.
clusters = values.clusters;
structure = values.structure;
costMatrix = values.costMatrix;
sequencesArray = values.sequencesArray;
ind = values.ind;
for i = 1 : length(clusters.cluster)
    for j = 1 : length(structure.sequence)
        if(iscell(structure.sequence{j}))
            for z = 1 : length(structure.sequence{j})
                if(clusters.cluster{i} == string(structure.sequence{j}{z}))
                    a = structure.sequence{j}{z};
                    a = [];
                    structure.sequence{j}{z} = a;
                end
            end
        elseif(clusters.cluster{i} == string(structure.sequence{j}))
            structure.identifier{j} = [];
            structure.sequence{j} = [];
        end
    end
end
structure.sequence
structure = removeEmptyFields(structure)
id = strcat('cluster',num2str(ind));
structure.identifier{length(structure.identifier) + 1} = id;
structure.sequence{length(structure.sequence) + 1} = clusters.cluster;
newValues = struct('newStructure',structure,'costMatrix',costMatrix,'sequencesArray',sequencesArray,'ind',ind);
end