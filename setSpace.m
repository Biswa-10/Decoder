function map = setSpace(map,msg,symbols,numberOfSymbolsEncoded,numberOfSymbolsOriginal)
%FIX MAPPING OF HIGHEST FREQUENCY
%The code was found to converge significantly faster it we fix the position of the most frequently occuring symbol. 
    M = mode(0+msg);
    x1 = symbolLocation(M,symbols,numberOfSymbolsEncoded);
    x2 = symbolLocation(1,map,numberOfSymbolsOriginal);
    temp = map(1,x1);
    map(1,x1) = map(1,x2);
    map(1,x2) = temp;
end

