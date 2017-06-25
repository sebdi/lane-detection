% This script transforms the camera images into bird view
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    29.08.2016
%% Read images and extract lanes
addpath('ImageProcessing','plotFncs','Tracking');
image_path = 'sim/bird_view_';
for idx=1:158
    video = imread([image_path num2str(idx) '.png']);
    lanes{idx} = laneExtraction(video);
end
%save('lanes_noise.mat','lanes')
%load('lanes_noise.mat')
%% display lanes (measurements) in birdsview
displayLanesInBirdsview(image_path, lanes);
%% plot parameters of lanes over time (to be removed)
plotLaneParaOverTime(lanes);
%% TrackManagement

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



 
displayTrackingResult(image_path, TrackList, lanes) % plot to be removed
%%
plotTrackingResult(TrackList);
% data = [(1:length(m_a))' m_a m_b m_c a b c]
% save -ascii data_noise_test.dat data
for i=1:50
    [i var(m_c(1:i))]
end
[var(m_a(1:40)) var(m_b(1:40)) var(m_c(1:40)) var(m_xs(1:40)) var(m_ys(1:40)) var(m_xe(1:40)) var(m_ye(1:40))]