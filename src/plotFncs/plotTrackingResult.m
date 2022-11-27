function [ output_args ] = plotTrackingResult(TrackList,id)
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
xe = nan(length(TrackList),1);
ye = nan(length(TrackList),1);
xs = nan(length(TrackList),1);
ys = nan(length(TrackList),1);
m_a = nan(length(TrackList),1);
m_b = nan(length(TrackList),1);
m_c = nan(length(TrackList),1);
m_xe = nan(length(TrackList),1);
m_ye = nan(length(TrackList),1);
m_xs = nan(length(TrackList),1);
m_ys = nan(length(TrackList),1);
idx = 1;
for i=1 : length(TrackList)
    for j=1 : length(TrackList{i})
        if TrackList{i}{j}.id == id
            a(idx) = TrackList{i}{j}.x(1);
            b(idx) = TrackList{i}{j}.x(2);
            c(idx) = TrackList{i}{j}.x(3);
            xe(idx) = TrackList{i}{j}.x(4);
            ye(idx) = TrackList{i}{j}.x(5);
            xs(idx) = TrackList{i}{j}.x(6);
            ys(idx) = TrackList{i}{j}.x(7);
            if ~isempty(TrackList{i}{j}.measurement)
                m_a(idx) = TrackList{i}{j}.measurement(1);
                m_b(idx) = TrackList{i}{j}.measurement(2);
                m_c(idx) = TrackList{i}{j}.measurement(3);
                m_xe(idx) = TrackList{i}{j}.measurement(4);
                m_ye(idx) = TrackList{i}{j}.measurement(5);
                m_xs(idx) = TrackList{i}{j}.measurement(6);
                m_ys(idx) = TrackList{i}{j}.measurement(7);
            end
            idx = idx + 1;
        else
        end
    end
end
figure(1)
subplot(3,1,1);
plot(m_a,'g'); hold on; plot(a,'--r'); legend('Measurement','Kalman filter');
ylabel('a_2'); xlabel('time step k');
subplot(3,1,2);
plot(m_b,'g'); hold on; plot(b,'--r'); legend('Measurement','Kalman filter');
ylabel('a_1'); xlabel('time step k');
subplot(3,1,3);
plot(m_c,'g'); hold on; plot(c,'--r'); legend('Measurement','Kalman filter');
ylabel('a_0'); xlabel('time step k');
figure(2);
subplot(4,1,1);
plot(m_xs,'g'); hold on; plot(xs,'--r'); legend('Measurement','Kalman filter');
ylabel('xs'); xlabel('time step k');
subplot(4,1,2);
plot(m_ys,'g'); hold on; plot(ys,'--r'); legend('Measurement','Kalman filter');
ylabel('ys'); xlabel('time step k');
subplot(4,1,3);
plot(m_xe,'g'); hold on; plot(xe,'--r'); legend('Measurement','Kalman filter');
ylabel('xe'); xlabel('time step k');
subplot(4,1,4);
plot(m_ye,'g'); hold on; plot(ye,'--r'); legend('Measurement','Kalman filter');
ylabel('ye'); xlabel('time step k');
end

