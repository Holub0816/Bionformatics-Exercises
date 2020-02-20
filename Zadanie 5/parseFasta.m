function [identifier,sequence] = parseFasta(fastaContent)
%Funkcja parseFasta() oddziela identyfikator od sekwencji, czyli parsuje
%wartoœci wejœciowe zgodnie z za³o¿on¹ wczeœniej konwencj¹.
[token,remain] = strtok(fastaContent,newline);
fasta = struct('identifier',token,'sequence',remain);
sequence = strtrim(fasta.sequence);
identifier = strtrim(fasta.identifier);
end
