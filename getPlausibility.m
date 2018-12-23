function plausibility = getPlausibility(msg,map,symbols,symbolsOriginal,numberOfSymbolsOriginal,transMatOrder1,transMatOrder2)
%RETURN THE PLAUSIBILITY VALUE
%Given a mapping function, the getPlausibility function evaluates how closely it resembles to our original transition matrix. It returns a numerical value that it associates with the plausibility.

    plausibility =0;
    bias(2:(numberOfSymbolsOriginal+1),2:(numberOfSymbolsOriginal+1))= .0000001;
    
    %introducing bias term to avaoid log0
    transMatOrder1 = 1000*(transMatOrder1+ bias);
    transMatOrder2 = 1000*(transMatOrder2+ bias);
    
    for i = 1:(strlength(msg)-2)
        symLoc1 = symbolLocation(msg(i),symbols,numberOfSymbolsOriginal);
        symLoc2 = symbolLocation(msg(i+1),symbols,numberOfSymbolsOriginal);
        symLoc3 = symbolLocation(msg(i+2),symbols,numberOfSymbolsOriginal);
        x1=map(1,symLoc1);
        x2=map(1,symLoc2);
        x3=map(1,symLoc3);
        plausibility = plausibility+log(transMatOrder1(x1+1,x2+1))+log(transMatOrder2(x1+1,x3+1));
    end 
end

