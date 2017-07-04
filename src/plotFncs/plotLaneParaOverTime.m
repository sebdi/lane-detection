function [ output_args ] = plotLaneParaOverTime(lanes)
%PLOTLANEPARAOVERTIME displays polynom with start and endpoints
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    02.01.2017
for i=1:10
    for j=1:length(lanes{i})
        a(j,i) = lanes{i}{j}.p(1);
        b(j,i) = lanes{i}{j}.p(2);
        c(j,i) = lanes{i}{j}.p(3);
        l(j,i) = max(lanes{i}{j}.r) - min(lanes{i}{j}.r);
        pos(j,i) = min(lanes{i}{j}.r);
    end
    a(i) = lanes{i}{1}.p(1);
    b(i) = lanes{i}{1}.p(2);
    c(i) = lanes{i}{1}.p(3);
end
plot((pos(2,:)),'O'); hold on;
plot(pos(3,:),'O')
end

