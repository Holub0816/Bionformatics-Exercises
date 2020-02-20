function interface(varargin)
p = inputParser;
p.addParameter('filename1',' ',@ischar);
p.addParameter('filename2',' ',@ischar);
p.addParameter('base1',' ',@ischar);
p.addParameter('base2',' ',@ischar);
p.addParameter('base3',' ',@ischar);
p.addParameter('base4',' ',@ischar);

parse(p,varargin{:})

if (isempty(p.Results.filename1) && ((isempty(p.Results.base1))&&(isempty(p.Results.base2))&&(isempty(p.Results.base3))&&(isempty(p.Results.base4))))
    disp('No sequences to compare.')
elseif (isempty(p.Results.filename2))
    disp('No information about scoring.')
end

filename1 = p.Results.filename1;
filename2 = p.Results.filename2;
base1 = p.Results.base1;
base2 = p.Results.base2;
base3 = p.Results.base3;
base4 = p.Results.base4;
i = 1;

if(p.Results.filename1 ~= ' ')
    [values, allClusters, allCosts] = findFirstCluster(filename1,filename2);
else
    
    if(p.Results.base1 ~= ' ')
        base{i} = p.Results.base1;
        i = i + 1;
    end
    
    if(p.Results.base2 ~= ' ')
        base{i} = p.Results.base2;
        i = i + 1;
    end
    
    if(p.Results.base3 ~= ' ')
        base{i} = p.Results.base3;
        i = i + 1;
    end
    
    if(p.Results.base4 ~= ' ')
        base{i} = p.Results.base4;
        i = i + 1;
    end
    base{end+1} = p.Results.filename2;
    [values, allClusters, allCosts] = findFirstCluster(base, p.Results.filename2);
    
end
for j = 1 : length(values.sequencesArray)-2
    [values, allClusters, allCosts] = findNewCentralSequence(values,allClusters,allCosts,filename2)
end
nwk = drawDendrogram(allClusters, allCosts);
saveToFile(nwk)
disp(nwk)
end

