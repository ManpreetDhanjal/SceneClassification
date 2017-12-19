function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('../data/traintest.mat');

	% TODO create train_features

    % building a 3 layer model
    layerNum = 3;
    dictsize = size(dictionary,1);
    interval = 1;
    train_imagenames = train_imagenames(1:interval:end);
    for i=1:size(train_imagenames,1)
        
        wordMapName = strcat(['../data/'],strrep(train_imagenames(i),'.jpg','.mat'));
        wordMapStruct = load(wordMapName{1,1});
        wordMap = wordMapStruct.wordMap;
        if i==1
            train_features = getImageFeaturesSPM(layerNum,wordMap,dictsize);
        else
            train_features = cat(2, train_features, getImageFeaturesSPM(layerNum,wordMap,dictsize));
        end
    end
	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end