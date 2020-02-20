function [content1, content2] = saveToFastaFile(filename, valuesToSave)
display('Input informations to FASTA-like file:');

fileID = fopen(filename,'wt');
for i = 1 : length(valuesToSave)
a1 = input(strcat("identifier of sequence 1 of local alignment ",num2str(i)," :"),"s");
a2 = input(strcat("description of sequence 1 of local alignment ",num2str(i)," :"),"s");
b1 = input(strcat("identifier of sequence 2 of local alignment ",num2str(i)," :"),"s");
b2 = input(strcat("description of sequence 2 of local alignment ",num2str(i)," :"),"s");

content1=[a1, char(10), a2];

content2=[b1, char(10), b2];

[token1,remain1] = strtok(content1,newline);

[token2,remain2] = strtok(content2,newline);

fasta1 = struct('identifier1',token1,'description1',remain1);

fasta2 = struct('identifier2',token2,'description2',remain2);

identifier1 = strtrim(token1);
identifier2 = strtrim(token2);
description1 = strtrim(remain1);
description2 = strtrim(remain2);


firstString = strcat(">",identifier1," ",description1);
secondString = strcat(">",identifier2," ",description2);
fprintf(fileID,'\n%s %s\n', firstString);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.xHelp);
fprintf(fileID,'\n%s %s\n', "       ");
fprintf(fileID,'\n%s %s\n', secondString);
fprintf(fileID,'\n%s %s\n', valuesToSave{i}.yHelp);
fprintf(fileID,'\n%s %s\n', " ");
end
fclose(fileID);
end

