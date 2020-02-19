function [B] = strikingpoint(I,d)
%{it stores the coordinates of the point where the refracted ray meets the image}%

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00014.bmp');
% [ I, ~, ~, ~ ] = four_parts( I );
% I = rgb2gray(I);
% I = im2bw(I);

% size of image
[r,c] = size(I);

% height from base upto which the second medium is placed
%d = round(2*r/3);

%{the matrix with point of intersection, angle of refraction and angle of incidence is taken from function refraction}
a = refraction(I,d);
p = zeros(round(d),2);
array = zeros(round(d),2);

% the first row with unworthy info is emptied
if a(1,1) == 0 && a(1,2) == 0
    a(1,:) = [];
end

% size of a
[r1,~] = size(a);

%{this for loop finds out the data pixel in which the refracted ray gets incident}%
% for doing the above said thing axes are shifted 

for k = 1:r1
    for i = 1:d
%       a(k,2) = first angle of refraction
%       {i*tan(a(k,2) is the horizontal displacement of the light ray between first striking point and second striking point}
%       {(i+r-d) is the row number or the x coord of the striking point where the second refraction is taking place}
        j = round(i*tan(a(k,2)));
        if (i+r-d)>0 && (j+a(k,1))>0 && (i+r-d)<=r && (j+a(k,1))<=c
            if I(i+r-d,j+a(k,1)) == 0
                p = [i+r-d j+a(k,1)];
                array = [array;p];
                break;
            end
        else
            if round(d*tan(a(k,2)))+a(k,1)<=r
                p = [r round(d*tan(a(k,2)))+a(k,1)];
                array = [array;p];
            elseif round(d*tan(a(k,2)))+a(k,1)>r
                p = [round((r-a(k,1))/tan(a(k,2))) r];
                array = [array;p];
            end
        end
    end
end

% duplicate rows are eliminated
B = unique(array,'rows');

[R,~] = size(B);

% as the angle approaches 90 deg the value of tan(angle) will approach infinity
for i = 1:R
    if abs(B(i,2))>10000
        B(i,2) = 0;
    end
end

% end