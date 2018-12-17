function newMap = swapMap(map,numberOfSymbolsEncoded)
%GENERATE NEW MAPPING FUNCTION
%{
randomly swap the mapping of two of the symbols to get a new mapping
function
%}
    newMap = map;
    indices = randperm(53,2);
    if(map(1,indices(1,1))~=1 && map(1,indices(1,2))~=1)
    temp = newMap(indices(1,1));
    newMap(indices(1,1)) = newMap(indices(1,2));
    newMap(indices(1,2))=temp;
    end
    
end

