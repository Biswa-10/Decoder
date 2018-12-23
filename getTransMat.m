function transMatOrder1 = getTransMat(text,symbolsOriginal,numberOfSymbolsOriginal)
%CALCULATE THE TRANSITION MATRIX
%The function getTransMat returns the transtion matrix for a language that it calculates from an input text.
  
    transMatOrder1 = zeros(numberOfSymbolsOriginal+1,'double');
    for i=2:numberOfSymbolsOriginal+1
        transMatOrder1(1,i) = symbolsOriginal(1,i-1);
        transMatOrder1(i,1) = symbolsOriginal(1,i-1);
    end
    
    for k = 1:(strlength(text)-1)
        character1 = text(1,k);
        character2 = text(1,k+1);
        for i = 2:numberOfSymbolsOriginal+1
            if(character1 == transMatOrder1(i,1))
                for j = 2:numberOfSymbolsOriginal+1
                    if(character2 == transMatOrder1(1,j))
                        transMatOrder1(i,j)= transMatOrder1(i,j)+1;
                    end
                end
            end
        end
    
    end
    S1 = sum(transMatOrder1,2);
    for i = 2:numberOfSymbolsOriginal+1
        for j = 2:numberOfSymbolsOriginal+1
            transMatOrder1(i,j) = transMatOrder1(i,j)/S1(i,1);
        end
    end
end

