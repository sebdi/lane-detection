function [t,TrackID] = createNewTrack(TrackID, measurements, initalP)
%CREATENEWTRACK Creates a new track from class Track
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    21.09.2016
TrackID = TrackID + 1;
t = Track(TrackID);
t.x = measurements;
t.P = initalP;
t.measurement = measurements;
t.status = 'i';
t.trackScore = 2;
end

