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
for l=20:(size(r,1)-20)
    if (max(r(1:l))-min(r(1:l)))>80 && (max(r(l+1:end))-min(r(l+1:end)))>80
        r_1{n} = r(1:l);
        r_2{n} = r(l+1:end);
        [p_1{n},S_1{n}] = polyfit(r(1:l),c(1:l),2);
        [p_2{n},S_2{n}] = polyfit(r(l+1:end),c(l+1:end),2);
        n = n + 1;
        succ = 1;
    end
end
error_1 = 0;
error_2 = 0;
for k =1  : n -1
    error_1(k) = S_1{k}.normr;
    error_2(k) = S_2{k}.normr;
end
end

