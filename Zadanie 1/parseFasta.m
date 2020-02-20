function odp = parseFasta(fastaContent)
[token,remain] = strtok(fastaContent,newline);
fasta = struct('identifier',token,'sequence',remain);
odp = strtrim(fasta.sequence);
end

%Czasowa z�o�ono�� obliczeniowa:
%3

%Przestrzenna z�o�ono�� obliczeniowa:
%3