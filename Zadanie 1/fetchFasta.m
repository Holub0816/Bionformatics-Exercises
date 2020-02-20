function [fastaContent] = fetchFasta(identifier,URL);

fastaContent = urlread(URL, 'get', {'db','nucleotide',...
    'rettype','fasta',...
    'id',identifier});
end

%Czasowa z�o�ono�� obliczeniowa:
%1

%Przestrzenna z�o�ono�� obliczeniowa:
%3
