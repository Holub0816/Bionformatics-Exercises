function saveMatrixToPngFile(g)
%Funkcja maj�ca mo�liwo�� zapisu okna graficznego do pliku o rozszerzeniu
%png
print(g,'-dpng','matrix.png');
end