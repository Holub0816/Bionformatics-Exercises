function g = displayMatrix(valuesToEquations,helpMatrix)
%Funkcja przyjmuje za parametry macierz punktacji oraz macierz pomocnicz�
%przedstawiaj�c� optymaln� �cie�k� dopasowania. Funkcja zwraca wykrez
%przedstawiaj�cy przebieg drogi dopasowania globalnego.
mode = valuesToEquations.mode;
R = valuesToEquations.R;
g = figure;
hold on;
value = max(max(R))
value2 = min(min(R))
clims = [value2 value];

colormap('autumn')

imagesc(R, clims)
colorbar

hold on;
spy(helpMatrix);
xlabel('Sequence number 1');
ylabel('Sequence number 2');
set(gca,'XAxisLocation','top');
title('Macierz dopasowania lokalnego','Color', 'm');

legend('Globalna �cie�ka dopasowania','Location','northwest');

hold off;

print(g,'-dpng','matrix.png');

end