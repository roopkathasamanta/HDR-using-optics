function [a] = refraction(I,d)
% it stores the intersection point where the rays meets the second medium

% I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');
% I = rgb2gray(I);

% size of image
[r,c] = size(I);
% height from base upto which the second medium is placed
% d = round(2*r/3);

% final array 
a = [];


% refractive index of second medium
m1 = 1.5;
% refractive index of the alphabet
m2 = 2;

variation = 18;

extent = round((atan(c/(r-d))*180/pi)/5);

% rays are falling from a point source at an interval of 5 deg
for angle = 1:5
%   angle to be used = (pi*5*angle/180), since angle has to be in radian

%   the points are found out where the rays are meeting the second medium
    intersection_point = round((r-d)*tan(pi*variation*angle/180));
%   incident angle in radian
    incident_angle = variation*angle*pi/180;
    
%   refracting angle is found out in radian
    refracting_angle = asin(sin(incident_angle)/m1);
    
%{it is checked whether the point has y-coord less than c and accordingly they are separated with conditions and then merged in a matrix which is having 3 columns with headings point of intersection, angle of refraction and angle of incidence respectively}
    if intersection_point<=c
        b = [intersection_point refracting_angle incident_angle];
%         arr = [b incident_angle];
%         brr = [brr intersection_point];
        a = [a;b];
    else
        b = [r 0 incident_angle];
%        arr = [b incident_angle];
        a = [a;b];
    end
end
end


