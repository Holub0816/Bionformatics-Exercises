function [valuesToSave] = equations(valuesToEquations, Z, xvalues, yvalues)
%Funkcja equations() jako argumenty wejœciowe przyjmuje wszystkieparametry zwracane przez
%funkcjê matrix(). Wyœietla ona w konsoli parametry programu, sekwencje po
%i przed porównaniem, koszt przerw, dopasowañ i niedopasowañ, d³ugoœæ drogi
%dopasowania a tak¿e wynik koñcowy. Wszystkie wyœwietlane parametry zwraca
%jako wynik.

for k = 1 : length(Z)
helpMatrix = Z{k};
xHelp = xvalues{k};
yHelp = yvalues{k};
xHelp = char(xHelp);
yHelp = char(yHelp);

if(length(xHelp) <= length(yHelp))
    l = length(xHelp);
else
    l = length(yHelp);
end

seq1str = strcat("# seq1: ",valuesToEquations.x);
seq2str = strcat("# seq2: ",valuesToEquations.y);
modestr = strcat("# Mode: SIMILARITY");
gapstr = strcat("# Gap: ",int2str(valuesToEquations.gap));
lengthstr = strcat("# Length: ",int2str(sum(helpMatrix,'all')));
scorestr = strcat("# Score: ",int2str(valuesToEquations.R(length(valuesToEquations.seq1),length(valuesToEquations.seq2))));

[pairs, scoring] = displayScoring(valuesToEquations.filename);
Gaps = 0;
Identity = 0;
for i = 1 : l
    if(xHelp(i) == '-' || yHelp(i) == '-')
        Gaps = Gaps + 1;
        z(1,i) = ' ';
    elseif(xHelp(i) == yHelp(i) && xHelp(i)~= '-' && yHelp(i)~='-')
        Identity = Identity + 1;
        z(1,i) = '|';
    else
        z(1,i) = ' ';
    end
end


GapsPercent = round(Gaps * 100 / length(xHelp));
IdentityPercent = round(Identity * 100 / length(yHelp));

gapsstr = strcat("# Gaps: ",int2str(Gaps),"/",int2str(length(xHelp)),"  (",int2str(GapsPercent),"%)");
identitystr = strcat("# Identity: ",int2str(Identity),"/",int2str(length(xHelp)),"  (",int2str(IdentityPercent),"%)");
pairsstr = strcat("# Punctation: ",pairs);
scoringstr = strcat("#              ",scoring);
valuesToSave{k} = struct('seq1str',seq1str,'seq2str',seq2str,'modestr',modestr,'pairsstr', pairsstr, 'scoringstr', scoringstr, 'gapstr', gapstr, 'scorestr', scorestr,'lengthstr', lengthstr, 'gapsstr', gapsstr, 'identitystr', identitystr, 'xHelp', xHelp, 'z', z, 'yHelp', yHelp, 'helpMatrix', helpMatrix);
disp(strcat(num2str(k)," lokalne dopasowanie:"));
disp(seq1str)
disp(seq2str)
disp(modestr)
disp(pairsstr)
disp(scoringstr)
disp(gapstr)
disp(scorestr)
disp(lengthstr)
disp(gapsstr)
disp(identitystr)
disp(xHelp)
disp(z)
disp(yHelp)
disp(" ")
end
end