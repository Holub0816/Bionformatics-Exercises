function odp = scoring(seq1, seq2, filename)

[columnsStr, rowStr, matrix] = substMatrix(filename);

result1 = rowStr==seq1;
result2 = columnsStr==seq2;
odp = matrix(result1,result2);



end