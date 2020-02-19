function [A] = upper_part(I,d)
%{it stores the coordinates of the point where the initial rays meet the character in first medium}%

%{the upper part will undergo only one refraction}%

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00014.bmp');
% [I,~,~,~] = four_parts(I);
% I = rgb2gray(I);
% imshow(I);

% size of image
[r,~] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

% {the matrix with point of intersection, angle of refraction and angle of incidence is taken from function refraction}%
a = refraction(I,d);
p = [];
array = [];

% size of a
[ra,~] = size(a);

% data pixels are obtained which are in rarer medium and will undergo only one refraction and incident rays hit them
for i = 1:ra
%   {this condition has been set based on some previous conditions}
%   a = [intersection point, angle of refracion, angle of incidence]
%   (tan(a(i,3))*j) is the y coord of the striking point in the upper part
    if a(i,1) == r && a(i,2) == 0
        for j = 1:(r-d)
            if round(tan(a(i,3))*j)<=r && I(j,round(tan(a(i,3))*j)) == 0
                p = [j round(tan(a(i,3))*j)];
                array = [array;p];
                break;
            end
        end
    end
end
[rA,~] = size(array);
if rA == 0
    A = [0 0];
else
    A = unique(array,'rows');
end

end