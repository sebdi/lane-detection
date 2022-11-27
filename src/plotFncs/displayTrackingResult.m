function [ output_args ] = displayTrackingResult(image_path, TrackList, lanes)
%DISPLAYTRACKINGRESULT displays tracking results in birdsview
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    02.01.2017
for k = 1 : length(lanes)
    video = imread([image_path num2str(k) '.png']);
    imshow(video); hold on;
    for j=1:length(TrackList{k})
     
        % measurement
        if strcmp(TrackList{k}{j}.status,'f')
            plot(TrackList{k}{j}.measurement(4),TrackList{k}{j}.measurement(5),'Xr','MarkerSize',10);
            plot(TrackList{k}{j}.measurement(6),TrackList{k}{j}.measurement(7),'Xr','MarkerSize',10);
            x1 = linspace(TrackList{k}{j}.measurement(5),TrackList{k}{j}.measurement(7));
            f1 = polyval(TrackList{k}{j}.measurement(1:3),x1);
            plot(f1,x1,'LineWidth',1);
            if TrackList{k}{j}.id == 1
                TrackList{k}{j}.measurement(5)
            end
        end
        
        plot(TrackList{k}{j}.x(4),TrackList{k}{j}.x(5),'Or','MarkerSize',10);
        plot(TrackList{k}{j}.x(6),TrackList{k}{j}.x(7),'Or','MarkerSize',10);
        x1 = linspace(TrackList{k}{j}.x(5),TrackList{k}{j}.x(7));
        f1 = polyval(TrackList{k}{j}.x(1:3),x1);
        plot(f1,x1,'--','LineWidth',4);
        
        if strcmp(TrackList{k}{j}.status,'f') || strcmp(TrackList{k}{j}.status,'i')
            text(TrackList{k}{j}.x(6),TrackList{k}{j}.x(7),num2str(TrackList{k}{j}.id),'Color','red','FontSize',14);
        else
            text(TrackList{k}{j}.x(6),TrackList{k}{j}.x(7),num2str(TrackList{k}{j}.id),'Color','green','FontSize',14);
        end
    end
      
    text(200,200,num2str(k),'Color','white','FontSize',14);
    pause(0.5)
    cla
end
end

