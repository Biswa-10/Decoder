clc
%We assume the encoded message belongs a language say X
%Calculate the First order transition matrix of language X
text = fileread('oldText.txt'); %text file from which we derive tansition matrix of language X
[symbolsOriginal,numberOfSymbolsOriginal] = getSymbols(text);%symbols and #symbols in the original text file of language X
transMat = getTransMat(text,symbolsOriginal,numberOfSymbolsOriginal);

%read encoded text
symbolsEncoded = zeros(1,numberOfSymbolsOriginal);
msg = fileread("Encoded.txt");
map = randperm(numberOfSymbolsOriginal);
numberOfSymbolsEncoded = 0; %number of symbols in encoded text

for i = 1:(strlength(msg))
    if(symbolLocation(msg(i),symbolsEncoded,numberOfSymbolsEncoded)==0)
        symbolsEncoded(numberOfSymbolsEncoded+1) = msg(i);
        numberOfSymbolsEncoded = numberOfSymbolsEncoded+1;  
    end
end

%set the most frequently occuring element
map = setSpace(map,msg,symbolsEncoded,numberOfSymbolsEncoded,numberOfSymbolsOriginal);

%run simulation
for i = 1:200000
    
    plausibilityCurrent = getPlausibility(msg,map,symbolsEncoded,symbolsOriginal,numberOfSymbolsOriginal,transMat);
    newMap = swapMap(map,numberOfSymbolsOriginal);
    plausibilityNew = getPlausibility(msg,newMap,symbols,symbolsOriginal,numberOfSymbolsOriginal,transMat);
    
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
            decodedmsg = decodedmsg  + char(symbolsOriginal(1,map(1,symbolLocation(msg(k),symbolsEncoded,numberOfSymbolsEncoded))));
        end 
        disp(decodedmsg);  
    end 
end

%display the original msg for comparison
fprintf("\n");
disp(msg);


    
 
    