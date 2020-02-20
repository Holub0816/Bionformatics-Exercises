function displaySequences(varargin)
%Funkcja umo¿liwiaj¹ca na wyœwietlenie dopasowania wielu sekwencji w
%formacie CLUSTAL OMEGA. Zmienna iloœæ parametrów wejœciowych pozwala na
%wprowadzenie dowolnej liczby sekwencji DNA lub bia³ka.
basicStr = "                                                          ";
structure = varargin{end};
identifiers = structure.identifier;
pierwsza = varargin{1};

%max = length(char(pierwsza));

for i = 1 : length(char(pierwsza))
    matrix{1} = pierwsza(i);
    matrix2(1) = char(matrix{1});
    for p = 1 : length(varargin{2})
        matrix{p+1} = varargin{2}{p}(i);
        matrix2(p+1) = char(matrix{p+1});
    end
    
    if (all(matrix2 == matrix2(1)))
        Z(i) = '*';
    else
        
        Z(i) = ' ';
    end
end
convertCharsToStrings(identifiers{1});
x = "";

identifier = convertCharsToStrings(identifiers{1});
mat1{1} = varargin{1};
len = 0;
for i = 1 : length(mat1{1})
    if(mat1{1}(i) ~= '-')
        len = len + 1;
    end
end
len = num2str(len);
mat2(1) = convertCharsToStrings(mat1{1});
mat(1) = identifier;
str = insertAfter(basicStr,0,char(strtok(mat(1),' ')));
str = insertAfter(str,40,mat2(1));
str = strtrim(str);
str = strcat(str,"  ",len);
disp(" ");
disp(str);

for f = 1 : length(varargin{2})
    identifier = convertCharsToStrings(identifiers{f+1});
    mat1{f} = varargin{2}{f};
    len = 0;
    for i = 1 : length(mat1{f})
        if(mat1{f}(i) ~= '-')
            len = len + 1;
        end
    end
    len = num2str(len);
    mat2(f) = convertCharsToStrings(mat1{f});
    mat(f) = identifier;
    str(f) = insertAfter(basicStr,0,char(strtok(mat(f),' ')));
    str(f) = insertAfter(str(f),40,mat2(f));
    str(f) = strtrim(str(f));
    str(f) = strcat(str(f),"  ",len);
end

for f = 1 : length(varargin{2})
    disp(str(f));
end
strZ = insertAfter(basicStr,40,Z);
disp(strZ)
end


