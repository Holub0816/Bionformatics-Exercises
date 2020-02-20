function [identifier,sequence] = parseFasta(fastaContent)
%Funkcja parseFasta() oddziela identyfikator od sekwencji, czyli parsuje
%warto�ci wej�ciowe zgodnie z za�o�on� wcze�niej konwencj�.
[token,remain] = strtok(fastaContent,newline);
fasta = struct('identifier',token,'sequence',remain);
sequence = strtrim(fasta.sequence);
identifier = strtrim(fasta.identifier);
end
