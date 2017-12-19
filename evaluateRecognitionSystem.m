function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('../data/traintest.mat');

	% TODO Implement your code here
    
    interval = 1;
    test_imagenames = test_imagenames(1:interval:end);
    conf = zeros(8,8);
    for i=1:size(test_imagenames,1)
        name = strcat(['../data/'], test_imagenames(i));
        I = guessImage(name{1,1});
        j = getIndex(I);
        conf(test_labels(i),j) = conf(test_labels(i),j)+1;
    end
    
end

function index = getIndex(mapping)
 
    if strcmp(mapping, 'art_gallery')
        index = 1;
    elseif strcmp(mapping, 'computer_room')
        index = 2;
    elseif strcmp(mapping, 'garden')
        index = 3;
    elseif strcmp(mapping, 'ice_skating')
        index = 4;
    elseif strcmp(mapping, 'library')
        index =5;
    elseif strcmp(mapping,'mountain')
         index = 6;
    elseif strcmp(mapping, 'ocean')
         index = 7;
    else
        index = 8;
    end
 
    
end