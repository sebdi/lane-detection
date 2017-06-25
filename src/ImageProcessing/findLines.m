function [ BW ] = findLines( I )
%FINDLINES finds lines with hough transformation
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    29.08.2016
hedge = vision.EdgeDetector;
hhoughtrans = vision.HoughTransform(pi/360,'ThetaRhoOutputPort', true);
hfindmax = vision.LocalMaximaFinder(10,	'HoughMatrixInput', true);
hfindmax.NeighborhoodSize = [255 177];
hLocalMax.Threshold = 200;
hhoughlines = vision.HoughLines('SineComputation','Trigonometric function');

% Find the edges in the intensity image
I2 = I;
BW = step(hedge, I2);

end

