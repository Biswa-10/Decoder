function foundSymbol = symbolLocation(targetSymbol,readSymbols,numberOfSymbolsEncoded)
%RETURN LOCATION OF TARGET SYMBOL
%The function symbolLocation takes in an target symbol and a list of of symbol read from the text. It then searches the list for the target symbol and returns the location of the symbol. else it returns 0

    foundSymbol = 0; 
    for i = 1:numberOfSymbolsEncoded
        if(targetSymbol == readSymbols(i))
            foundSymbol = i;
        end
    end 
end

