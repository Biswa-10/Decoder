symbolsEnglish = zeros(1,53);
symbolsEnglish(1,1) = 32;
for i = 1:26
    symbolsEnglish(1,i+1) = 64+i ;
    symbolsEnglish(1,i+27) = 96+i ;
end

%We assume the encoded message belongs a language say X
%Calculate the First order transition matrix of language X
text = fileread('oldText.txt');    
transMat = getTransMat(text);

%read encoded text
symbols = zeros(1,53);
msg = fileread("Encoded.txt");
map = randperm(53);
numberOfSymbolsEncoded = 0; %number of symbols in encoded text
for i = 1:(strlength(msg))
    if(symbolLocation(msg(i),symbols,numberOfSymbolsEncoded)==0)
        symbols(numberOfSymbolsEncoded+1) = msg(i);
        numberOfSymbolsEncoded = numberOfSymbolsEncoded+1;
    
    end
end

%set the most frequently occuring element
map = setSpace(map,msg,symbols,symbolsEnglish,numberOfSymbolsEncoded);


%run simulation
for i = 1:200000
    plausibilityCurrent = getPlausibility(msg,map,symbols,transMat);
    newMap = swapMap(map,numberOfSymbolsEncoded);
    plausibilityNew = getPlausibility(msg,newMap,symbols,transMat);
    if(plausibilityNew>plausibilityCurrent)
        map = newMap;
        
    else 
        randomNo = rand();
        if(rand()<(plausibilityNew/plausibilityCurrent)/2000)
            map = newMap;
        end
          
            
        
    end 
    
    %display the output every 1000 iterations
    if(mod(i,1000)== 999)
        decodedmsg = "";
        for k = 1:strlength(msg)
            decodedmsg = decodedmsg  + char(symbolsEnglish(1,map(1,symbolLocation(msg(k),symbols,numberOfSymbolsEncoded))));
        end 
        
        disp(decodedmsg);
        
    end
    
end

%display the original msg for comparison
fprintf("\n");
disp(msg);


    
 
    