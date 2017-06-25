function color = genCameraImage(R, t, K, fx, fy, cx, cy, delta_R, delta_t, noise)
%GENCAMERAIMAGE Generates one camera image
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.10.2016
color = zeros((cx*2-1)*(cy*2)+cy*2,1);
r = 0;
for v=1:cy*2
    if noise
        if ~mod(v,15)
            r = (rand*((w(3)/50)^0.3));
        end
    end
    for u=1:cx*2
        idx = (u-1)*(cy*2)+v;
        w = raytracing(R,t,[u v],K,fx,fy,cx,cy);
        x(idx) = w(1);
        z(idx) = w(3);
        if z(idx)>0
            color(idx) = roundTrip(inv(delta_R)*w+[delta_t(1);delta_t(2);delta_t(3)],r);
        end
    end
end
end

