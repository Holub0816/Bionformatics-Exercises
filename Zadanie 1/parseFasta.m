function odp = parseFasta(fastaContent)
[token,remain] = strtok(fastaContent,newline);
fasta = struct('identifier',token,'sequence',remain);
odp = strtrim(fasta.sequence);
end

%Czasowa z³o¿onoœæ obliczeniowa:
%3

%Przestrzenna z³o¿onoœæ obliczeniowa:
%3