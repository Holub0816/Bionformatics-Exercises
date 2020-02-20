function [values] = findCentralSequence(varargin)
%Funkcja poprzez porównywanie ze sob¹ wszystkich sekwencji oblicza koszty
%dopasowania wszystkich par i na ich podstawie wybiera sekwencjê centraln¹,
%czyli o najmniejszym koszcie dopasowania. Funkcja zwraca takie parametry
%jak: index sekwencji centralnej z macierzy wszystkich sekwencji, wektor z
%pozosta³ymi sekwencjami, strukturê przechowuj¹c¹ wszystkie isekwencje wraz
%z ich identyfikatorami, nazwy plików z których bierzemy punktacjê oraz
%sekwencje.

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
amount = max(size(identifiers));
vector = zeros(1,amount);

for i = 1 :  amount
    vector(1,i) = i;
end

combinations = nchoosek(vector,2);
[rows,~] = size(combinations);
costs = zeros(1,rows);

for i = 1:rows
    sequence1 = char(structure.sequence(combinations(i,1)));
    sequence2 = char(structure.sequence(combinations(i,2)));
    valuesToEquations = matrix(sequence1,sequence2,filename2);
    [cost,helpMatrix] = generateHelpMatrix(valuesToEquations);
    [~,~] = textRepresentation(helpMatrix,valuesToEquations);
    costs(1,i) = cost;
end
v = length(vector);
ind = distanceMatrix(combinations,costs,v);
ind = min(ind);
vector(ind)=[];


values = struct('ind',ind,'structure',structure,'vector',vector,'filename2',filename2,'filename1',varargin);

end