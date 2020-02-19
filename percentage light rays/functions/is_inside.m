function [ flag ] = is_inside( img, pos, angle )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[r,c] = size(img);

flag = 0;

x = pos(1);
y = pos(2);

img(x,y) = 1;



if angle >=0 && angle <= 90
    angle = 90 - angle;
    count = 1;
    mf = tan(pi/180*angle);
    while((x+count) <= r)
        yy = round(y + count * mf);
        if yy <= c && img((x+count),yy) == 0
            flag = 1;
            break;
        end
        
        count = count + 1;
    end
   
end

if angle >90 && angle <= 180
    
    
    angle = angle - 90;
    count = 1;
    mf = tan(pi/180*angle);
    while((x + count) <= r)
        yy = round(y - count * mf);
        if yy >= 1 && img((x+count),yy) == 0
            flag = 1;
            break;
        end
        
        count = count + 1;
    end
    
end


if angle >180 && angle <= 270
    angle = 270 - angle;
    
    count = 1;
    mf = tan(pi/180*angle);
    while((x - count) >= 1)
        yy = round(y - count * mf);
        if yy >= 1 && img((x-count),yy) == 0
            flag = 1;
            break;
        end
        
        count = count + 1;
    end
    
end

if angle >270 && angle <= 360
    
    angle = angle - 270;
    
    count = 1;
    mf = tan(pi/180*angle);
    while((x - count) >= 1)
        yy = round(y + count * mf);
        if yy <= c && img((x-count),yy) == 0
            flag = 1;
            break;
        end
        
        count = count + 1;
    end
    
    
    
end


end

