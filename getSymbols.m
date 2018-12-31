function [symbolsOriginal,numberOfSymbols] = getSymbols(text,maxNumberOfCharacters)
    symbolsOriginal = zeros(1,maxNumberOfCharacters);
    numberOfSymbols = 0 ;
    for i = 1:(strlength(text))
        if(symbolLocation(text(i),symbolsOriginal,numberOfSymbols)==0)
            symbolsOriginal(1,numberOfSymbols+1) = text(i);
            numberOfSymbols = numberOfSymbols+1;
        end
    end
    
    M = mode(0+text);
    x1 = symbolLocation(M,symbolsOriginal,numberOfSymbols);
    temp = symbolsOriginal(1,x1);
    symbolsOriginal(1,x1) = symbolsOriginal(1,1);
    symbolsOriginal(1,1) = temp;
    
end
