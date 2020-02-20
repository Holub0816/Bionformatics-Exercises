function nwk = drawDendrogram(allClusters, allCosts)
%Funkcja jako argumentyprzyjmuje wszystkie powsta³e klastry i wszystkie
%wartoœci kosztów poszczególnych dopasowañ klastrów. Metoda generuje okno graficzne z widocznym drzewem filogenetycznym z uwzglêdnieniem
%wszystkich odleg³oœci oraz zwraca zapis drzewa w formacie Newick.
m = 2;
c = 0;
arr(1) = allClusters.sequence{1}{1}{1};
for i = 1 : length(allClusters.sequence)
    for j = 1 : length(allClusters.sequence{i}{1})
        for z = 1 : length(arr)
            ind = allClusters.sequence{i}{1}{j};
            if(arr(z) ~= ind && c == 0)
                arr(m) = ind;
                m = m + 1;
                c = c + 1;
                if(length(arr) == length(allClusters.sequence{end}{1}))
                    break;
                end
            end
        end
        c = 0;
        if(length(arr) == length(allClusters.sequence{end}{1}))
            break;
        end
    end
    if(length(arr) == length(allClusters.sequence{end}{1}))
        break;
    end
end

sequencesCell{1} = arr;
max(size(allClusters.sequence{1}{1}))
a = zeros(max(size(allClusters.sequence)),2);
ind = 1;
for i = 1 : max(size(allClusters.sequence))
    c = max(size(allClusters.sequence{i}{1}));
    a(i,:) = [ind ind+1];
    ind = ind + 2;
end
if(max(size(allClusters.sequence{end}{1})) - max(size(allClusters.sequence{end-1}{1})) == 1)
    for i = 1 : length(a)
        if(a(i,1) == 1)
        else
            a(i,1) = a(i,1) + 1;
        end
        a(i,2) = a(i,2) + 1;
    end
    a(end,1) = 2;
    a(end,2) = numel(a);
end

for k = 1 : length(allCosts.value)
   b(k) = allCosts.value{k}/2;
end
b = b';
tree = phytree(a,b,sequencesCell{1});
nwk = getnewickstr(tree);

end

