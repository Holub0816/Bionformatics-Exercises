function [fastaContent] = fetchFasta(identifier,URL);
%Funkcja fetchFasta() umo¿liwia pobranie sekwencji nukleotydów i jej identyfikatora prosto z bazy NCBI. 
fastaContent = urlread(URL, 'get', {'db','nucleotide',...
    'rettype','fasta',...
    'id',identifier});
end

%Czasowa z³o¿onoœæ obliczeniowa:
%1

%Przestrzenna z³o¿onoœæ obliczeniowa:
%3