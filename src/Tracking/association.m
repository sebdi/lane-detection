function r = association(measurements, TrackList)
%ASSOCIATION Associates predicted tracks with measurements
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.09.2016
if ~isempty(measurements)
    if ~isempty(TrackList)
        
        %% Create association matrix A
        A = NaN(length(measurements),length(TrackList));
        gamma = 100000;
        
        for j=1 : length(measurements)
            
            % for better readability
            m = measurements{j}; 
            
            for k=1 : length(TrackList)
                
                % for better readability
                t = [TrackList{k}.x(4);TrackList{k}.x(5);TrackList{k}.x(6);TrackList{k}.x(7)];
                
                % error function
                A(j,k) = abs( (t(1)-m(4)).^2 + (t(2)-m(5)).^2 ) + abs( (t(3)-m(6)).^2 + (t(4)-m(7) ).^2);
                
                % gating to reduce runtime
                if A(j,k) > gamma
                    A(j,k) = 2 * gamma;
                end
            end
        end
        
        %global nearest neighbour association with auction algorithm
        r = AuctionAlgorithm(A,gamma);

    else
        r = ones(length(measurements),1);
    end
end
end

