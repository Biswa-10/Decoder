function uniqueWords = getWords(inputText)
%Returns the set of words in a text
%returns a sorted array of unique words
    M = mode(0+inputText);
    words = strsplit(inputText,char(M));
    uniqueWords = unique(words);
end

