function [newValues, allClusters, allCosts] = findNewCentralSequence(v,allClusters,allCosts,filename2)
%Funkcja znajduje kolejne klastry w metodzie UPGMA.
structure = v.newStructure;
sequencesArray = v.sequencesArray;
costMatrix = v.costMatrix;
ind = v.ind;
ind = ind + 1;
amount = max(size(structure.sequence));

for i = 1 :  amount
    vector(1,i) = i;
end
combinations = nchoosek(vector,2);
[rows,columns] = size(combinations);
costs = zeros(1,rows);
for i = 1 : rows
    structure.sequence(combinations(i,1));
    structure.sequence(combinations(i,2));
    newCell = {structure.sequence(combinations(i,1)),structure.sequence(combinations(i,2))};
    p=1;
    for j = 1 : length(newCell)
        if(ischar(newCell{j}{1}(1)))
            for k = 1 : length(string(newCell{j}{1}))
                m(p) = (string(newCell{j}{1}));
                p = p + 1;
            end
            help(j) = p;
        else
            if(~isempty(newCell{j}{1}{1}))
                for k = 1 : length(string(newCell{j}{1}))
                    m(p) = (string(newCell{j}{1}{k}));
                    p = p + 1;
                end
            end
            help(j) = p;
        end
    end
    actualMatrix{i} = m;
    helpMatrix = m;
    stop = help(1);
    newArray = [1:1:stop-1];
    for z = 1 : length(newArray)
        firstArray(z) = helpMatrix(z);
        m(find(m == firstArray(z))) = [];
    end
    index = 1;
    for s = 1 : length(newArray)
        for b = 1 : length(m)
            result = costMatrix(find(sequencesArray == firstArray(s)),find(sequencesArray == m(b)));
            costsValues(index) = result;
            index = index + 1;
        end
    end
    
    divider = length(costsValues);
    resultValues(i) = sum(costsValues)/divider;
    if(i == 1)
        minSeq = actualMatrix{i};
        minValue = sum(resultValues(i));
    else
        if(sum(resultValues(i)) < minValue)
            minSeq = actualMatrix{i};
            minValue = sum(resultValues(i));
        end
    end
end
for x = 1 : length(minSeq)
    cluster{1}{x} = minSeq(x);
end

id = strcat('cluster',num2str(ind));
idCost = strcat('cost',num2str(ind));
clusters = struct('cluster',cluster);
values = struct('structure',structure,'clusters',clusters,'sequencesArray',sequencesArray,'filename2',filename2, 'costMatrix',costMatrix,'ind', ind);
if(length(structure.sequence) == 2)
    newValues = lastAlignment(values);
else
    newValues = createNewStruct(values);
end
allClusters.identifier{length(allClusters.identifier) + 1} = id;
allClusters.sequence{length(allClusters.sequence) + 1} = cluster;
allCosts.identifier{length(allCosts.identifier) + 1} = idCost;
allCosts.value{length(allCosts.value) + 1} = minValue;

end