function lane = laneExtraction( video )
%LANEEXTRACTION extracts lanes from image
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    29.08.2016
if size(video,3)>1
    GreyImage = rgb2gray(video); % imshow(GreyImage);
else
    GreyImage = video;
end

threshold = graythresh(GreyImage);
SegImage = im2bw(GreyImage,threshold); % imshow(SegImage);

bw=findLines(GreyImage); % imshow(bw)

%  remove all object containing fewer than 90 pixels
bw1 = bwareaopen(bw,90); % imshow(bw1)

% remove noise
%SE = strel('square',2); % imshow(SegImage-bw1);
%erodedI = imerode(SegImage-bw1,SE); % imshow(erodedI);
erodedI = SegImage;

% segmentation
L = bwlabel(erodedI>0,8);
RGB = label2rgb(L); % imshow(RGB)

lane = polyFitting(L);
end

