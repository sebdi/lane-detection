function TrackList = doTracking(TrackList, measurements, trackIDX, F, Q, R, H)
%DOTRACKING Performs tracking with the auction algorithm
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.09.2016

initalP = eye(7);

%% predict Tracks
for j=1 : length(TrackList)
    t = TrackList{j};
    t.x = F * t.x;
    t.P = F * t.P * F' + Q;
    t.status = 'p';
    t.measurement = [];
    TrackList{j} = t;
end

%% associate Tracks with measurements
r = association(measurements, TrackList);

tempTrackList=TrackList;
newTracks=struct([]);

if ~isempty(measurements)
    
    for j=1 : length(measurements)
        
        if r(j) > length(tempTrackList) 
            % Measurement is associated with virutal track -> new track
            newTracks{end+1} = createNewTrack(trackIDX, measurements{j}, initalP);
        else
            t = tempTrackList{r(j)};
            t.measurement = measurements{j};
            
            % kf filter step
            S = R + H * t.P * H';
            K = t.P * H' * pinv(S);
            t.x = t.x + K * (t.measurement - H * t.x);
            t.P = (eye(size(t.P,2)) - K * H) * t.P * (eye(size(t.P,2)) -  K * H )' + K * R * K'; % Joseph Form
            
            t.status = 'f';
            t.filtered = t.filtered+1;
            t.trackScore = t.trackScore+1;
            tempTrackList{r(j)} = t;
        end
    end
end

%% split track list into filtered tracks
% and tracks where no measurement has been associated
filteredTracks = struct([]);
lowTrackScoreTracks = struct([]);

for j=1 : length(tempTrackList)
    
    if strcmp(tempTrackList{j}.status,'f')
        filteredTracks{end+1} = tempTrackList{j};
    end
    
    if strcmp(tempTrackList{j}.status,'p')
        % reduce track score if not filtered and track score high enough
        if tempTrackList{j}.trackScore>0
            tempTrackList{j}.trackScore = tempTrackList{j}.trackScore - 10;
            lowTrackScoreTracks{end+1} = tempTrackList{j};
        end
    end
end

%% New tracklist is [newTracks filteredTracks lowTrackScoreTracks];
% (~isempty to account for empty structs)
if ~isempty(newTracks)
    TrackList=[newTracks filteredTracks lowTrackScoreTracks];
else
    if ~isempty(filteredTracks)
        TrackList=[filteredTracks lowTrackScoreTracks];
    else
        TrackList=lowTrackScoreTracks;
    end
end

end

