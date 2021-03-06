function [fastaContent] = fetchFasta(identifier,URL)
%Funkcja fetchFasta() umożliwia pobranie sekwencji nukleotydów i jej identyfikatora prosto z bazy NCBI.
fastaContent = urlread(URL, 'get', {'db','nucleotide',...
    'rettype','fasta',...
    'id',identifier});
end

