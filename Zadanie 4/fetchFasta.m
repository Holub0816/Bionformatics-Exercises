function [fastaContent] = fetchFasta(identifier,URL)
%Funkcja fetchFasta() umo�liwia pobranie sekwencji nukleotyd�w i jej identyfikatora prosto z bazy NCBI. 
fastaContent = urlread(URL, 'get', {'db','nucleotide',...
    'rettype','fasta',...
    'id',identifier});
end

