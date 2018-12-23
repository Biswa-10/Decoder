function [transMatOrder1,transMatOrder2] = getTransMat(text,symbolsOriginal,numberOfSymbolsOriginal)
%CALCULATE THE TRANSITION MATRIX
%The function getTransMat returns the transtion matrix for a language that it calculates from an input text.
  
    transMatOrder1 = zeros(numberOfSymbolsOriginal+1,'double');
    transMatOrder2 = zeros(numberOfSymbolsOriginal+1,'double');
    transMat = zeros(numberOfSymbolsOriginal,'double');
    
    for i=2:numberOfSymbolsOriginal+1
        transMatOrder1(1,i) = symbolsOriginal(1,i-1);
        transMatOrder1(i,1) = symbolsOriginal(1,i-1);
        transMatOrder2(1,i) = symbolsOriginal(1,i-1);
        transMatOrder2(i,1) = symbolsOriginal(1,i-1);
    end
    
    for k = 1:(strlength(text)-2)
        character1 = text(1,k);
        character2 = text(1,k+1);
        character3 = text(1,k+2);
        for i = 2:numberOfSymbolsOriginal+1
            if(character1 == transMatOrder1(i,1))
                for j = 2:numberOfSymbolsOriginal+1
                    if(character2 == transMatOrder1(1,j))
                        transMatOrder1(i,j)= transMatOrder1(i,j)+1;
                    end
                    if(character3 == transMatOrder2(1,j))
                        transMatOrder2(i,j)= transMatOrder2(i,j)+1;
                    end
                end
            end
        end
    
    end
    
   
    S1 = sum(transMatOrder1,2);
    S2 = sum(transMatOrder2,2);
    for i = 2:numberOfSymbolsOriginal+1
        for j = 2:numberOfSymbolsOriginal+1
            transMatOrder1(i,j) = transMatOrder1(i,j)/S1(i,1);
            transMatOrder2(i,j) = transMatOrder2(i,j)/S2(i,1);
        end
    end
end

