function [xcoord,ycoord] = centreofgravity(I)
% I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');
% size of image
[r,c] = size(I);
sumx = 0;
sumy = 0;
for i = 1:r
    for j = 1:c
        if I(i,j) == 0
            I(i,j) = 1;
            sumx = sumx + i;
            sumy = sumy + j;
        end
    end
end
xcoord = round(sumx/(r*c));
ycoord = round(sumy/(r*c));
end
