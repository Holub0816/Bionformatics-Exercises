function [valuesToSave] = equations(valuesToEquations, helpMatrix, xpomoc, ypomoc)
%Funkcja equations() jako argumenty wejœciowe przyjmuje wszystkieparametry zwracane przez
%funkcjê matrix(). Wyœietla ona w konsoli parametry programu, sekwencje po
%i przed porównaniem, koszt przerw, dopasowañ i niedopasowañ, d³ugoœæ drogi
%dopasowania a tak¿e wynik koñcowy. Wszystkie wyœwietlane parametry zwraca
%jako wynik.

x = valuesToEquations.seq1;
y = valuesToEquations.seq2;
R = valuesToEquations.R;
mode = valuesToEquations.mode;
gap = valuesToEquations.gap;
match = valuesToEquations.match;
missmatch = valuesToEquations.missmatch;

seq1str = strcat('# seq1: ',x);
seq2str = strcat('# seq2: ',y);
modestr = strcat('# Mode: ',mode);
matchstr = strcat('# Match: ',int2str(match));
missmatchstr = strcat('# Missmatch: ',int2str(missmatch));
gapstr = strcat('# Gap: ',int2str(gap));
lengthstr = strcat('# Length: ',int2str(sum(helpMatrix,'all')));
scorestr = strcat('# Score: ',int2str(R(length(x)+1,length(y)+1)));



xpomoc = convertStringsToChars(xpomoc);
ypomoc = convertStringsToChars(ypomoc);

if(length(xpomoc) <= length(ypomoc))
    len = length(xpomoc);
else
    len = length(ypomoc);
end

Gaps = 0;
Identity = 0;

for i = 1 : len
    if(xpomoc(i) == '-' || ypomoc(i) == '-')
        Gaps = Gaps + 1;
        z(1,i) = ' ';
    elseif(xpomoc(i) == ypomoc(i) && xpomoc(i)~= '-' && ypomoc(i)~='-')
        Identity = Identity + 1;
        z(1,i) = '|';
    else
        z(1,i) = ' ';
    end
end
GapsPercent = round(Gaps * 100 / length(xpomoc));
IdentityPercent = round(Identity * 100 / length(ypomoc));

gapsstr = strcat('# Gaps: ',int2str(Gaps),'/',int2str(length(xpomoc)),'  (',int2str(GapsPercent),'%)');
identitystr = strcat('# Identity: ',int2str(Identity),'/',int2str(length(xpomoc)),'  (',int2str(IdentityPercent),'%)');

disp(seq1str)
disp(seq2str)
disp(modestr)
disp(matchstr)
disp(missmatchstr)
disp(gapstr)
disp(scorestr)
disp(lengthstr)
disp(gapsstr)
disp(identitystr)
disp(xpomoc)
disp(z)
disp(ypomoc)

valuesToSave = struct('seq1str',seq1str, 'seq2str', seq2str, 'modestr', modestr, 'matchstr', matchstr, 'missmatchstr', missmatchstr,'gapstr', gapstr, 'scorestr', scorestr, 'lengthstr', lengthstr, 'gapsstr', gapsstr, 'identitystr', identitystr, 'xpomoc', xpomoc, 'z', z, 'ypomoc', ypomoc);

%Czasowa z³o¿onoœæ obliczeniowa:
%29 + 5i

%Przestrzenna z³o¿onoœæ obliczeniowa:
%17 + 2n + 2m + 2nm
end