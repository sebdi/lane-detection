function [ output_args ] = plotTrackingResult(TrackList)
%PLOTTRACKINGRESULT plots the 3 parameters of the polynomials
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.10.2016
a = nan(length(TrackList),1);
b = nan(length(TrackList),1);
c = nan(length(TrackList),1);
m_a = nan(length(TrackList),1);
m_b = nan(length(TrackList),1);
m_c = nan(length(TrackList),1);
m_xs = nan(length(TrackList),1);
m_ys = nan(length(TrackList),1);
m_xe = nan(length(TrackList),1);
m_ye = nan(length(TrackList),1);
idx = 1;
for i=1 : length(TrackList)
    for j=1 : length(TrackList{i})
        if TrackList{i}{j}.id == 1
            a(idx) = TrackList{i}{j}.x(1);
            b(idx) = TrackList{i}{j}.x(2);
            c(idx) = TrackList{i}{j}.x(3);
            if ~isempty(TrackList{i}{j}.measurement)
                m_a(idx) = TrackList{i}{j}.measurement(1);
                m_b(idx) = TrackList{i}{j}.measurement(2);
                m_c(idx) = TrackList{i}{j}.measurement(3);
                m_xs(idx)  = TrackList{i}{j}.measurement(4);
                m_ys(idx)  = TrackList{i}{j}.measurement(5);
                m_xe(idx)  = TrackList{i}{j}.measurement(6);
                m_ye(idx)  = TrackList{i}{j}.measurement(7);
            end
            idx = idx + 1;
        else
        end
    end
end
subplot(3,1,1);
plot(a,'-X');hold on; plot(m_a,'-O'); legend('x','m');
subplot(3,1,2);
plot(b,'-X');hold on; plot(m_b,'-O'); legend('x','m');
subplot(3,1,3);
plot(c,'-X');hold on; plot(m_c,'-O'); legend('x','m');
end

