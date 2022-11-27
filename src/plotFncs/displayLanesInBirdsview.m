function [ output_args ] = displayLanesInBirdsview(image_path, lanes, start_index, end_index)
%DISPLAYLANESINBIRDSVIEW Display lanes (measurements) in birdsview
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    02.01.2017
for i=start_index:end_index
    video = imread([image_path num2str(i) '.png']);
    imshow(video);hold on;
    for j=1:length(lanes{i})
        if length(lanes{i}) == 1
            displayPoly(lanes{i}.p, lanes{i}.r');hold on;
        else
            displayPoly(lanes{i}{j}.p, lanes{i}{j}.r');hold on;
        end
    end
    pause(0.5);
end
end

