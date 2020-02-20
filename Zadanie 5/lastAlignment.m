function newValues = lastAlignment(values)
%Funkcja umo¿liwia znalezienie ostatniego klastra i przygotowanie klastrów
%do prezentacji.
clusters = values.clusters;
structure = values.structure;
sequencesArray = values.sequencesArray;
costMatrix = values.costMatrix;
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
id = strcat('cluster',num2str(ind));
structure.identifier{length(structure.identifier) + 1} = id;
structure.sequence{length(structure.sequence) + 1} = clusters.cluster;
newValues = struct('newStructure',structure,'sequencesArray',sequencesArray,'costMatrix',costMatrix,'ind',ind);
end