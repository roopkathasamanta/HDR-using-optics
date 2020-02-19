function [devi] = new_deviation(I,d)
%{it stores the horizontal shift the rays suffered due to the glass slab refraction in second medium}%

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00000.bmp');
% I = rgb2gray(I);

% size of image
[r,~] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

p = [];
% array to keep count
% width = [];
% refractive index of second medium
m1 = 1.5;

% refractive index of the alphabet
m2 = 2;

% array to store horizontal deviation
devi = [];
arr = [];

a = refraction(I,d);
% size of a
[r1,~] = size(a);

[B] = strikingpoint(I,d);
% size of B
[r2,~] = size(B);

% [A] = upper_part(I);
% [r1,~] = size(B);
% [r2,~] = size(A);

[s] = new_slope(I,d);
[rs,~] = size(s);

% {matrix arr has first angle of refraction, second angle of incidence and second angle of refraction}
for i = 1:rs
%     if a(i,1)<r
        angle = s(i,2);
        sec_incident_angle = angle - a(i,2);
        sec_refracting_angle = asin((m1/m2)*sin(sec_incident_angle));
        p = [a(i,2) sec_incident_angle sec_refracting_angle];
        arr = [arr;p];
%     end
end
[r3,~] = size(arr);
for i = 1:r3
    dev = [s(i,1)*sin(arr(i,2)-arr(i,3))/(cos(arr(i,3))*cos(arr(i,3))) a(i,3)*36/pi];
    devi = [devi;dev];
end


end


