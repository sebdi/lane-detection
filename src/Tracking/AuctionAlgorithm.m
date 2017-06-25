function r = AuctionAlgorithm(D , gamma )
%AUCTIONALGORITHM Associates tracks with the auction algorithm
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.09.2016
r = zeros( length( D(:,1) ) , 1 );
tol = 0.01; % tolerance

% prize
D = gamma*2-D;

% augmentation of virtual tracks
D = [D gamma*eye(length(D(:,1)))];
p = zeros(1,length(D(1,:)));
for i=1 : length(D(:,1))
    temp = D(i,:);
    [max1 iElement1] = max(temp(1,:)-p);
    r(i) = iElement1;
    temp(1,iElement1) = 0;
    [max2 iElement2] = max(temp(1,:)-p);
    p(iElement1) = p(iElement1) + (max1-max2) + tol;
end

end

