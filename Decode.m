clc
%We assume the encoded message belongs a language say X

originalLanguage = fileread('oldText.txt'); %file from which we derive tansition matrix of language X
%symbolsOriginal : unicode of symbols in assumed language
%numberOfSymbolsOriginal : number of symbols in assumed language(max:200)
[symbolsOriginal,numberOfSymbolsOriginal] = getSymbols(originalLanguage,200);

%Calculate the First order transition matrix of language X
[transMatOrder1,transMatOrder2] = getTransMat(originalLanguage,symbolsOriginal,numberOfSymbolsOriginal);

%read encoded originalLanguage
%symbolsEncoded : list of unicode of symbols encoded in the originalLanguage
%numberOfSymbolsEncoded : number of symbols in encoded originalLanguage
encodedMsg = fileread("Encoded.txt");
[symbolsEncoded,numberOfSymbolsEncoded] = getSymbols(encodedMsg,numberOfSymbolsOriginal);


%randomly initialize a mapping function and set the most frequent element
map = randperm(numberOfSymbolsOriginal);
map = setSpace(map,encodedMsg,symbolsEncoded,numberOfSymbolsEncoded,numberOfSymbolsOriginal);


%run simulation
counter = 0; %number of attempts to decoded the originalLanguage
numberOfIterations = 0;
upperThreshold = .5; %minimum matching criteria
lowerThreshold = .1; %
counterLimit = 10;
originalWords = getWords(originalLanguage);

while counter<counterLimit
    %disp(i);
    numberOfIterations = numberOfIterations + 1 ;
    plausibilityCurrent = getPlausibility(encodedMsg,map,symbolsEncoded,numberOfSymbolsOriginal,transMatOrder1,transMatOrder2);
    newMap = swapMap(map,numberOfSymbolsOriginal);
    plausibilityNew = getPlausibility(encodedMsg,newMap,symbolsEncoded,numberOfSymbolsOriginal,transMatOrder1,transMatOrder2);

    
    if(plausibilityNew>plausibilityCurrent)
            map = newMap;
    else 
        randomNo = rand();
        if(rand()<(plausibilityNew/plausibilityCurrent)/2000)
            map = newMap;
        end    
    end 
    
    
    
    %display the output every 1000 iterations
    %after 50000 itr check for termination condition every 5000 itr.
    if(numberOfIterations>50000 && mod(numberOfIterations,5000)== 4999)
        decodedMsgCurrent = getDecodedMsg(encodedMsg,map,symbolsEncoded,symbolsOriginal,numberOfSymbolsOriginal);
        wordScore = getWordScore(originalWords,decodedMsgCurrent);
        disp(wordScore);    
        disp(decodedMsgCurrent);
        %stop Iterations if word score if above the chosen threshold 
        if(wordScore>upperThreshold)
            break;
        end
        %Reset the mapping if wordscore if below lower threshold
        if(wordScore<lowerThreshold)
            counter = counter + 1;
            numberOfIterations = 0 ;
            disp("start again");
            map = randperm(numberOfSymbolsOriginal);
            map = setSpace(map,encodedMsg,symbolsEncoded,numberOfSymbolsEncoded,numberOfSymbolsOriginal);
        end 
        
    else 
        if(mod(numberOfIterations,1000)== 999)
            decodedMsgCurrent = getDecodedMsg(encodedMsg,map,symbolsEncoded,symbolsOriginal,numberOfSymbolsOriginal);
            disp(decodedMsgCurrent);
        end 
    end 
end


if(counter == counterLimit)
    disp("The encoded message probably doesnt belong to this language");
end

%display the original msg for comparison
fprintf("\n");
disp(encodedMsg);


    
 
    
