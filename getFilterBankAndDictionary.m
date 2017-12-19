function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();

    % TODO Implement your code here

    finalBool = 0;
    for i=1:length(imPaths)
        img = imread(imPaths{i});
        filterResponses = extractFilterResponses(img, filterBank);
        
        % get total number of pixel in 2D frame
        indices = randperm(numel(img(:,:,1)), 200);
        loopBool = 0;
        for j=1:3*size(filterBank,1)
            temp = filterResponses(:,:,j);
            
            if loopBool == 0
                randomPixels = temp(ind2sub(size(temp),indices))';
                loopBool = 1;
            else
                randomPixels = cat(2, randomPixels, temp(ind2sub(size(temp),indices))');
            end
            
        end
        
        if finalBool == 0
            finalMat = randomPixels;
            finalBool = 1;
        else
            finalMat = cat(1,finalMat, randomPixels);
        end
    end
    [~, dictionary] = kmeans(finalMat, 200);
end
