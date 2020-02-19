function [I1, I2, I3, I4] = four_part(I)
% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00778.bmp');
% I = rgb2gray(I);
[r,c]= size(I);
I1=I(1:r/2,1:c/2);
I2=I(1:r/2,c/2+1:c);
I3=I(r/2+1:r,1:c/2);
I4=I(r/2+1:r,c/2+1:c);
% imshow(I1);
end