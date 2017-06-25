function [ output_args ] = displayLanesInBirdsview(image_path, lanes)
%DISPLAYLANESINBIRDSVIEW Display lanes (measurements) in birdsview
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    02.01.2017
for i=1:30
    video = imread([image_path num2str(i) '.png']);
    imshow(video);hold on;
    for j=1:length(lanes{i})
        displayPoly(lanes{i}{j}.p, lanes{i}{j}.r');hold on;
    end
    pause(1);
end
end

