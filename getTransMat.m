function transMatOrder1 = getTransMat(text)
%CALCULATE THE TRANSITION MATRIX
%{
The function getTransMat returns the transtion matrix for a language that
it calculates from an input text.
%}  
    transMatOrder1 = zeros(54,'double');
    transMatOrder1(2,1) = 32;
    transMatOrder1(1,2) = 32;
    for i = 1:26
        transMatOrder1(1,i+2) = 64+i ;
        transMatOrder1(i+2,1) = 64+i ;
        transMatOrder1(1,i+28) = 96+i ;
        transMatOrder1(i+28,1) = 96+i ;
    end
    
    for k = 1:(strlength(text)-1)
        character1 = text(1,k);
        character2 = text(1,k+1);
        for i = 2:54
            if(character1 == transMatOrder1(i,1))
                for j = 2:54
                    if(character2 == transMatOrder1(1,j))
                        transMatOrder1(i,j)= transMatOrder1(i,j)+1;
                    end
                end
            end
        end
    
    end
    S1 = sum(transMatOrder1,2);
    for i = 2:54
        for j = 2:54
            transMatOrder1(i,j) = transMatOrder1(i,j)/S1(i,1);
        end
    end
    
    


end

