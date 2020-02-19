function [d] = depth(I)
% I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');

% size of image
[r,~] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

p = [];
% array to keep count
width = [];

% refractive index of second medium
m1 = 1.5;

% refractive index of the alphabet
m2 = 2;

% array to store horizontal deviation
d = [];
arr = [];
a = refraction(I);

% size of a
[r1,c1] = size(a);

[B] = strikingpoint(I);
% size of B
[r2,c2] = size(B);

% [A] = upper_part(I);
% [r1,~] = size(B);
% [r2,~] = size(A);

angle = slope(I);
% matrix arr has first angle of refraction, second angle of incidence and
% second angle of refraction
for i = 1:r1
    if a(i,1)<128
        sec_incident_angle = angle - a(i,2);
        sec_refracting_angle = asin((m1/m2)*sin(sec_incident_angle));
        p = [a(i,2) sec_incident_angle sec_refracting_angle];
        arr = [arr;p];
    end
end

for i = 1:r2
    count = 0;
    for j = 1:(r-B(i,1))
        if (j+B(i,1)-1)>0 && (B(i,2)-1+round(tan(angle)))>0 && B(i,2)~=128
            if I(j+B(i,1)-1,B(i,2)-1+round(tan(angle))) ~= 0
                break;
            end
        end
        count = count + 1;
    end
    width = [width;count];
end
% size of width
[rq,~] = size(width);
for i = 1:rq
    dev = width(i,1)*sin(arr(i,2)-arr(i,3))/(cos(arr(i,3))*cos(arr(i,3)));
    d = [d;dev];
end
end


