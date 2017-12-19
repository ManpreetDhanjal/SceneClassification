function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here
    
    filterResponses = extractFilterResponses(img, filterBank);
    wordMap = zeros(size(img,1),size(img,2));
    for i=1:size(img,1)
        for j=1:size(img,2)
            temp = filterResponses(i,j,:);
            temp = temp(:)';
            dist = pdist2(dictionary,temp);
            [~,I] = min(dist);
            wordMap(i,j) = I;
        end
    end
    
end
