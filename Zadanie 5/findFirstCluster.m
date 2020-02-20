function [newValues, allClusters, allCosts] = findFirstCluster(varargin)
%Funkcja umo¿liwia parsowanie argumentów wejœciowych w zale¿noœci od tego
%czy sekwencje s¹ wczytywane z pliku czy pobierany z bazy. Umo¿liwia ona
%"pierwszy krok" metody UPGMA i znajduje pierwszy klaster.
ind = 1;
if (nargin == 2)
    filename2 = varargin{end};
    filename1 = varargin{1};
    structure = loadSequencesFromFile(filename1);
else
    filename2 = varargin{end};
    for i = 1 : length(varargin{1})
        m = convertCharsToStrings(varargin{1}(i));
        mat(i) = m;
    end
    mat(end) = [];
    for j = 1 : length(mat)
        varargin{j} = char(mat(j));
    end
    structure = loadSequencesFromFile(varargin{1});
end
identifiers = structure.identifier;
sequences = structure.sequence;
amount = max(size(identifiers));
vector = zeros(1,amount);

for k = 1 : length(structure.sequence)
    sequencesArray(k) = string(structure.sequence{k});
end

for i = 1 :  amount
    vector(1,i) = i;
end

combinations = nchoosek(vector,2);
[rows,columns] = size(combinations);
costs = zeros(1,rows);

for i = 1:rows
    sequence1 = char(structure.sequence(combinations(i,1)));
    sequence2 = char(structure.sequence(combinations(i,2)));
    valuesToEquations = matrix(sequence1,sequence2,filename2);
    [cost,helpMatrix] = generateHelpMatrix(valuesToEquations);
    costs(1,i) = cost;
end
v = length(vector);
[minRow,minColumn,costMatrix,minimum,minValue] = distanceMatrix(combinations,costs,v);

s1 = string(structure.sequence{minRow(1)});
s2 = string(structure.sequence{minColumn(1)});
cluster{1}{1} = s1;
cluster{1}{2} = s2;
clusters = struct('cluster',cluster);
values = struct('clusters',clusters,'structure',structure,'costMatrix',costMatrix,'sequencesArray',sequencesArray,'minimum',minimum,'vector',vector,'filename2',filename2,'filename1',varargin,'ind',ind);
newValues = createNewStruct(values);
clusterIdentifiers{1} = strcat('cluster',num2str(ind));
clusterSequences{1} = cluster;
sequencesCell = {clusterIdentifiers,clusterSequences};
names = {'identifier', 'sequence'};
allClusters = cell2struct(sequencesCell,names,2);
costsIdentifiers{1} = strcat('cost',num2str(ind));
costsSequences{1} = minValue;
costsCell = {costsIdentifiers,costsSequences};
names = {'identifier', 'value'};
allCosts = cell2struct(costsCell,names,2);
end