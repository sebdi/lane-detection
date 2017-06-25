function ret = roundTrip(w,r,useNoise)
%ROUNDTRIP Contains a round trip road scene
%
% AUTHOR  Sebastian Dingler <s.dingler@gmail.com>
%
% LICENSE github.com/sebdi/lane_detection/blob/master/LICENSE
%
% DATE    03.09.2016
x = w(1);
y = w(2);
z = w(3);
ret = 0;
%% upper curve
if z > 0
    % compute euclidian distance
    if abs(sqrt(z^2 + x^2) -100)<1
        if mod(ceil(atan2(x,z)*10),2)
            ret = 255;
        end
    end
    if abs(sqrt(z^2 + x^2) -(100-42-r))<1
        ret = 255;
    end
    if abs(sqrt(z^2 + x^2) -(100+42+r))<1
        ret = 255;
    end
end
%% straight
if z < 0 & z > -600
    % one side
    % inner lane
    if abs(x-(100-42-r)) < 1
        ret = 255;
    end
    
    % outer lane
    if abs(x-(100+42+r)) < 1
        ret = 255;
    end
    
    % middle lane
    if abs(x -100) < 1
        if mod(ceil(z/20),2)
            ret = 255;
        end
    end
    % other side
        % inner lane
    if abs(x+(100-42-r)) < 1
        ret = 255;
    end
    
    % outer lane
    if abs(x+(100+42+r)) < 1
        ret = 255;
    end
    
    % middle lane
    if abs(x +100) < 1
        if mod(ceil(z/20),2)
            ret = 255;
        end
    end
end
% bottom curve
if z < -600
    % compute euclidian distance
    if abs(sqrt((z+600)^2 + (x)^2) -100) < 1
        if mod(ceil(atan2(x,(z+600))*10),2)
            ret = 255;
        end
    end
    if abs(sqrt((z+600)^2 + (x)^2) -(100-42-r)) < 1
        ret = 255;
    end
    if abs(sqrt((z+600)^2 + (x)^2) -(100+42+r)) < 1
        ret = 255;
    end
end

% marker (100,100)
% if z-100 > 0
%     if x+100 > 0
%         if z-100 < 5
%             if x+100 < 5
%                 ret = 255;
%             end
%         end
%     end
% end

end

