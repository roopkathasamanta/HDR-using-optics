function [I1] = mirrorimage(I)

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn01959.bmp');
% I = rgb2gray(I);
% size of image
% [r,~] = size(I);
I1 = flipdim(I ,2);
% imshow(I1);

end