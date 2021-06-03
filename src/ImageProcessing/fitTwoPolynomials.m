function [p_1, p_2, r_1, r_2, error_1, error_2, succ] = fitTwoPolynomials(r,c)
%FITTWOPOLYNOMIALS Fits 2 concatenated polynomials to a set of points
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    29.08.2016
n = 1;
p_1 = [];
p_2 = [];
r_1 = [];
r_2 = [];
S_1 = [];
S_2 = [];
succ = 0;
error_1 = 0;
error_2 = 0;
idx = 20:4:(size(r,1)-20);
for l=1:length(idx)
    if (max(r(1:idx(l)))-min(r(1:idx(l))))>80 && (max(r(idx(l)+1:end))-min(r(idx(l)+1:end)))>80
        r_1{n} = r(1:idx(l));
        r_2{n} = r(idx(l)+1:end);
        [p_1{n},S] = polyfit(r(1:idx(l)),c(1:idx(l)),2);
        error_1(n) = S.normr;
        [p_2{n},S] = polyfit(r(idx(l)+1:end),c(idx(l)+1:end),2);
        error_2(n) = S.normr;
        n = n + 1;
        succ = 1;
    end
end
end

