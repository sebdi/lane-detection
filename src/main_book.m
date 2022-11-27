% This script loads saved lane information and produces the plots from the book
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    03.06.2021
%% Read images and extract lanes
addpath('ImageProcessing','plotFncs','Tracking');
image_path = 'sim/noise/bird_view_';
load('lanes_noise.mat')

%% Tracking with Kalman-Filter

TrackID=0;
initalP = eye(7);
TrackList=struct([]);

% First measurements are initial tracks
for i=1:length(lanes{1})
    [TrackList{1}{i},TrackID]=createNewTrack(TrackID, getMeasurement(lanes{1}{i}), initalP);
end

% generatre measurements structure
for i=2:length(lanes)
    for k=1:length(lanes{i})
        measurements{i-1}{k} = getMeasurement(lanes{i}{k});
    end
end

% setup kalman filter
F = eye(7);
H = eye(7);
Q = bsxfun(@times,[1.174e-09;7.585e-04;26.266;1.631;1.631;1.631;1.631],eye(7)*0.25);
R = bsxfun(@times,[1.174e-09;7.585e-04;26.266;1.631;1.631;1.631;1.631],eye(7));

% do tracking
for i=1:length(measurements)
    TrackList{i+1} = doTracking(TrackList{i},measurements{i},TrackID,F,Q,R,H);
end

plotTrackingResult(TrackList,1);
% uncomment if you want to see video of tracks
%displayTrackingResult(image_path, TrackList, lanes);