function printTransMat(numberOfSymbolsOriginal,transMatOrder1)
%PRINT CALCULATED TRANSITION MATRIX
%From a pictorial view of calculated transition matrix, we can study how a language has evolved over time.

    Sx = sum(transMatOrder1);
    Sx(1,1) = 0;
    for i = 2:numberOfSymbolsOriginal+1
        Sx(1,i) = Sx(1,i) - transMatOrder1(1,i);
    end
    M = zeros(53,'double');
    for i = 1:numberOfSymbolsOriginal
        for j = 1:numberOfSymbolsOriginal
            M(i,j) = transMatOrder1(i+1,j+1);
        end
    end
    N = normalize(M,'range',[0 1]);
    image(N,'CDataMapping','scaled');
    colorbar;
end

