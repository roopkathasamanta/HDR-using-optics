function [ percent_inside ] = cal_per_inside( img, pos )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

count = 0;

for i = 1:360
    x = is_inside(img,pos,i);
    if x == 1
        count = count + 1;
    end
end

percent_inside = (count/360)*100;


end

