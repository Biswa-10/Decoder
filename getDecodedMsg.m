function decodedMsg = getDecodedMsg(msg,map,symbolsEncoded,symbolsOriginal,numberOfSymbolsOriginal)
%Calculate the decoded string 
%from input set of symbols and mapping function
    decodedMsg = char(zeros([1 strlength(msg)])) ;
    for i = 1:(strlength(msg))
        symLoc1 = symbolLocation(msg(i),symbolsEncoded,numberOfSymbolsOriginal);
        x1=map(1,symLoc1);
        decodedMsg(1,i) = char(symbolsOriginal(1,x1));
    end 
end

