function[I1] = mirror_waterimage(I)

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn01959.bmp');
I1 = waterimage(I);
% I = rgb2gray(I);
% size of image
% [r,~] = size(I);
I1 = flipdim(I1 ,2);
% imshow(I1);

end