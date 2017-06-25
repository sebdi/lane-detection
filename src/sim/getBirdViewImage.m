function color2 = getBirdViewImage(fx, fy, cx, cy, Image, K, R_b, inKb, cxb, cyb , t_b)
%GETBIRDVIEWIMAGE Transforms a image into birdsview
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    01.10.2016

lambda2 = 100;
color2 = zeros((cxb*2-1)*cyb*2+cyb*2,1);

for u=1:cx*2
    for v=1:cy*2
        idx = (u-1)*cy*2+v;
        c = [(u-cx)/fx;(v-cy)/fy;1];
        lambda = (lambda2-t_b(3)) / ( R_b(3,1:3) * c);
        uv2 = (1/lambda2) * inKb * (R_b * inv(K) * lambda * [u;v;1] + t_b);
        u2 = round(uv2(1));
        v2 = round(uv2(2));
        if u2 < cx*8 && v2 < cy*8 && u2 > 0 && v2 > 0
            color2((u2-1)*cxb*2+v2) = Image(idx);
        end
    end
end
end

