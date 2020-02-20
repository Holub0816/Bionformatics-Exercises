function g = displayMatrix(valuesToEquations, valuesToSave)
%Funkcja wyœwietlaj¹ca wszystkie lokalne œcie¿ki dopasowania w jednym
%oknie graficznym.
length(valuesToSave)
for i = 1 : length(valuesToSave)
R = valuesToEquations.R;
matrix = valuesToSave{i}.helpMatrix;
if (i > 1)
matrix = valuesToSave{i-1}.helpMatrix + valuesToSave{i}.helpMatrix;
matrix(matrix>1) = 1;
end
g = figure;
hold on;
maxValue = max(max(R));
colormap('autumn')
clims = [0 maxValue];
imagesc(R,clims);
colorbar
spy(matrix, '*');
hold on;
end
xlabel('Sequence number 1');
ylabel('Sequence number 2');
set(gca,'XAxisLocation','top');
title('Macierz dopasowania lokalnego','Color', 'm');
legend('lokalne œcie¿ki dopasowania','Location','northwest')
hold off;
saveMatrixToPngFile(g)

end