function measurement = getMeasurement(lane)
%GETMEASUREMENT Extracts measurement vector from lane structure
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.09.2016
x1 = linspace(min(lane.r),max(lane.r));
f1 = polyval(lane.p,x1);
% a_2, a_1, a_0, x_start, y_start, x_ende, y_ende
measurement = [lane.p';f1(1);min(lane.r);f1(end);max(lane.r)];
end

