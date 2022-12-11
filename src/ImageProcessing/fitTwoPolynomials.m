function [p_1, p_2, r_1, r_2, error_1, error_2, succ] = fitTwoPolynomials(row,col)
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
idx = 20:4:(size(row,1)-20);
for l=1:length(idx)
    if (max(row(1:idx(l)))-min(row(1:idx(l))))>80 && (max(row(idx(l)+1:end))-min(row(idx(l)+1:end)))>80
        r_1{n} = row(1:idx(l));
        r_2{n} = row(idx(l)+1:end);
        [p_1{n},S] = polyfit(row(1:idx(l)),col(1:idx(l)),2);
        error_1(n) = S.normr;
        [p_2{n},S] = polyfit(row(idx(l)+1:end),col(idx(l)+1:end),2);
        error_2(n) = S.normr;
        n = n + 1;
        succ = 1;
    end
end
end

