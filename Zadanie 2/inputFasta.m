function fastaContent = inputFasta(a)
%Funkcja fastaContent() umo�liwia wprowadzenie sekwencji prosto z
%klawiatury. Wymaga si� r�wnie� podania jej unikalnego identyfikatora.
fastaContent=['>',input('identifier: ','s'),...
    char(10), input('sequence: ','s')];
end

%Czasowa z�o�ono�� obliczeniowa:
%1

%Przestrzenna z�o�ono�� obliczeniowa:
%1