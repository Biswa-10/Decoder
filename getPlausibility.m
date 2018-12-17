
function plausibility = getPlausibility(msg,map,symbols,transMat)
%RETURN THE PLAUSIBILITY VALUE
%{
Given a mapping function, the getPlausibility function evaluates how
closely it resembles to our original transition matrix.
It returns a numerical value that it associates with the plausibility.
%}
    plausibility =0;
    symbolsEnglish = zeros(1,53);
    symbolsEnglish(1,1) = 32;
    for i = 1:26
        symbolsEnglish(1,i+1) = 64+i ;
        symbolsEnglish(1,i+27) = 96+i ;
    end
    bias(2:54,2:54)= .0000001;
 
    transMat = 1000*(transMat+ bias);
    
    for i = 1:(strlength(msg)-1)
        symLoc1 = symbolLocation(msg(i),symbols,53);
        symLoc2 = symbolLocation(msg(i+1),symbols,53);
        x1=map(1,symLoc1);
        x2=map(1,symLoc2);
        
        plausibility = plausibility+log(transMat(x1+1,x2+1));
    end 
end

