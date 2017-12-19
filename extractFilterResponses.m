function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses


% TODO Implement your code here
if size(img,3) == 1
    img = repmat(img,[1,1,3]);
end
% convert from RGB to LAB
labImg = RGB2Lab(img);
filterResponses = zeros(size(img,1),size(img,2),3*size(filterBank,1));
responseArray = zeros(size(img,1),size(img,2),3, size(filterBank,1));
% apply filter on all the pixels on all the channels

startIndex = 1;
endIndex = 3;
for i=1:size(filterBank,1)
    a = imfilter(labImg, filterBank{i,1}, 'replicate');
    responseArray(:,:,:,i) = a;
    filterResponses(:,:,startIndex:endIndex) = responseArray(:,:,:,i);
    startIndex = startIndex + 3;
    endIndex = endIndex + 3;
    % to take print out
end

%montage(responseArray);

