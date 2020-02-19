function [angle] = slope(I)
% slope useful only for the straight alphabets

%I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');
% I = rgb2gray(I);
% size of image
[r,c] = size(I);
% height from base upto which the second medium is placed
% d = round(2*r/3);
p = zeros(r,1);
for i = 1:r
    for j = 1:c
        if I(i,j) == 0
            p(i) = j;
            break;
        end
    end
end

for i = 1:r
    if p(i,1) ~= 0
        initial = [r-i p(i,1)];
        break;
    end
end

for i = 0:r-1
    if p(r-i,1) ~= 0
        final = [i p(r-i,1)];
        break;
    end
end

s = (final(1) - initial(1))/(final(2) - initial(2));
angle = atan(s);
% angle_degree = atan(s)*180/3.14;
end