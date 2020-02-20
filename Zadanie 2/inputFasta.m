function fastaContent = inputFasta(a)
%Funkcja fastaContent() umo¿liwia wprowadzenie sekwencji prosto z
%klawiatury. Wymaga siê równie¿ podania jej unikalnego identyfikatora.
fastaContent=['>',input('identifier: ','s'),...
    char(10), input('sequence: ','s')];
end

%Czasowa z³o¿onoœæ obliczeniowa:
%1

%Przestrzenna z³o¿onoœæ obliczeniowa:
%1