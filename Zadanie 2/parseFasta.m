function odp = parseFasta(fastaContent)
%Funkcja parseFasta() oddziela identyfikator od sekwencji, czyli parsuje
%warto�ci wej�ciowe zgodnie z za�o�on� wcze�niej konwencj�.
[token,remain] = strtok(fastaContent,newline);
fasta = struct('identifier',token,'sequence',remain);
odp = strtrim(fasta.sequence);
end

%Czasowa z�o�ono�� obliczeniowa:
%3

%Przestrzenna z�o�ono�� obliczeniowa:
%5