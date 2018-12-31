function normalizedScore = getWordScore(originalWords,decodedMsg)
%Calculate the score of the decoded guess
%score proportional to the sum of lengths of all words that represents actualy words in english language 
    score=0;
    totalLength = 0;
    M = mode(double(decodedMsg));
    decodedWords = strsplit(decodedMsg,char(M));
    for i = 1:length(decodedWords)
        for j = 1:length(originalWords)
            if(strcmp(decodedWords(1,i),originalWords(1,j)))
                score = score + strlength(decodedWords(1,i));
                break;
            end
        end
        totalLength = totalLength + strlength(decodedWords(1,i));
    end
    normalizedScore = 1.0*score/totalLength;
end

