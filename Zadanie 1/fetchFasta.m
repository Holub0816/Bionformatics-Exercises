function [fastaContent] = fetchFasta(identifier,URL);

fastaContent = urlread(URL, 'get', {'db','nucleotide',...
    'rettype','fasta',...
    'id',identifier});
end

%Czasowa z³o¿onoœæ obliczeniowa:
%1

%Przestrzenna z³o¿onoœæ obliczeniowa:
%3
