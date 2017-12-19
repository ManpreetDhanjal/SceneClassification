function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    layerWeight = [0.25 , 0.25, 0.5];
    
    a = size(wordMap,1);
    b = size(wordMap,2);
    
    for i=0:layerNum-1
        distRow = floor(a/(2^i));
        distCol = floor(b/(2^i));
        for j=1:distRow:a-(2^i)
            for k=1:distCol:b-(2^i)
                rowEnd = j+distRow-1;
                colEnd = k+distCol-1;
                tempImg = wordMap(j:rowEnd, k:colEnd);
                if k==1 && j==1
                    layerHist = getImageFeatures(tempImg, dictionarySize);
                else
                    layerHist = [layerHist ; getImageFeatures(tempImg, dictionarySize)];
                end
            end
        end
        
        if i==0
            h = layerWeight(i+1) * layerHist;
        else
            h = [h ; layerWeight(i+1) * layerHist];
        end
    end
end