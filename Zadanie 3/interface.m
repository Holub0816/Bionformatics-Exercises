function interface(varargin)
%Interfejs użytkownika umożliwiający wprowadzenie sekwencji, które chcemy
%porównać na 3 sposoby:
%a) z pliku tekstowego w formacie FASTA
%b) jako adres url z bazy NCBI
%c) z klawiatury
%Funkcja interface() przeprowadza dodatkowo walidację wprowadzonych danych.

p = inputParser;
p.addParameter('filename1','',@ischar);
p.addParameter('filename2','',@ischar);
p.addParameter('base1','',@ischar);
p.addParameter('base2','',@ischar);
p.addParameter('input1','',@ischar);
p.addParameter('input2','',@ischar);
p.addParameter('gap',2,@isnumeric);
p.addParameter('filename','myfile.txt',@ischar);

parse(p,varargin{:})

if (isempty(p.Results.filename1) &&  isempty(p.Results.filename2) && isempty(p.Results.base1) &&  isempty(p.Results.base2) &&  isempty(p.Results.input1) &&  isempty(p.Results.input2))
    disp('No sequences to compare')
    return
end

x = 0;
base1 = p.Results.base1;
base2 = p.Results.base2;
input1 = p.Results.input1;
input2 = p.Results.input2;
filename1 = p.Results.filename1;
filename2 = p.Results.filename2;
i = 0;

if (~isempty(base1) || ~isempty(base2) || ~isempty(input1)|| ~isempty(input2) || ~isempty(filename1) || ~isempty(filename2))
    if( ~isempty(base1))
        x = x + 1;
    end
    if(~isempty(base2))
        x = x + 1;
    end
    if(~isempty(input1))
        x = x + 1;
    end
    if(~isempty(input2))
        x = x + 1;
    end
    if(~isempty(filename1))
        x = x + 1;
    end
    if(~isempty(filename2))
        x = x + 1;
    end
    if x>2
        disp('Too many sequences inputs')
        return
    end
end


if ( ~isempty(filename1))
    text = fileRead(filename1);
    filename1 = parseFasta(text);
    if(i == 0)
        b1 = filename1;
        i = i + 1;
    elseif( i == 1)
        b2 = filename1;
    end
end

if ( ~isempty(filename2))
    text = fileRead(filename2);
    filename2 = parseFasta(text);
    if(i == 0)
        b1 = filename2;
        i = i + 1;
    elseif( i == 1)
        b2 = filename2;
    end
end

if ( ~isempty(base1))
    text = fetchFasta(base1);
    base1 = parseFasta(text);
    if(i == 0)
        b1 = base1;
        i = i + 1;
    elseif( i == 1)
        b2 = base1;
    end
end

if ( ~isempty(base2))
    text = fetchFasta(base2);
    base2 = parseFasta(text);
    if(i == 0)
        b1 = base2;
        i = i + 1;
    elseif( i == 1)
        b2 = base2;
    end
end

if ( ~isempty(input2))
    text = inputFasta();
    input2 = parseFasta(text);
    if(i == 0)
        b1 = input2;
        i = i + 1;
    elseif( i == 1)
        b2 = input2;
    end
end

if ( ~isempty(input1))
    text = inputFasta();
    input1 = parseFasta(text);
    if(i == 0)
        b1 = input1;
        i = i + 1;
    elseif( i == 1)
        b2 = input1;
    end
end

[valuesToEquations] = points(b1,b2, p.Results.gap, p.Results.filename);

[Z, xvalues, yvalues] = generateHelpMatrix(valuesToEquations);

[valuesToSave] = equations(valuesToEquations, Z,xvalues,yvalues);

saveToFile(valuesToSave);

displayMatrix(valuesToEquations, valuesToSave);

saveToFastaFile('savedFastaFile.txt', valuesToSave);

end
