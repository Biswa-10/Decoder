function plausibility = getPlausibility(msg,map,symbols,symbolsOriginal,numberOfSymbolsOriginal,transMat)
%RETURN THE PLAUSIBILITY VALUE
%Given a mapping function, the getPlausibility function evaluates how closely it resembles to our original transition matrix. It returns a numerical value that it associates with the plausibility.

    plausibility =0;
    bias(2:(numberOfSymbolsOriginal+1),2:(numberOfSymbolsOriginal+1))= .0000001;
    
    %introducing bias term to avaoid log0
    transMat = 1000*(transMat+ bias);
    
    for i = 1:(strlength(msg)-1)
        symLoc1 = symbolLocation(msg(i),symbols,numberOfSymbolsOriginal);
        symLoc2 = symbolLocation(msg(i+1),symbols,numberOfSymbolsOriginal);
        x1=map(1,symLoc1);
        x2=map(1,symLoc2);
        
        plausibility = plausibility+log(transMat(x1+1,x2+1));
    end 
end

