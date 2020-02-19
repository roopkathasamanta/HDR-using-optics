%%%%%  Image cropping program
% 'crop' preservthe dimension of original image by cropping certain portion

clear all;
close all;
clc;

% Color/Gray image rotation by white background
inputImg=imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00676.bmp');
figure,imshow(inputImg),title('Input Image');
theta=0.5;

rotateImg1 = imrotate(inputImg,theta,'crop'); % crop preserve the dimension by cropping
rotateImg1(rotateImg1 == 0) = 255;
figure,imshow(rotateImg1),title('Rotated Color Image');
imwrite(rotateImg1,'C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00676.bmp');

grayImg=rgb2gray(inputImg);
rotateImg2 = imrotate(grayImg,theta,'crop');
rotateImg2(rotateImg2 == 0) = 155;
figure,imshow(rotateImg2),title('Rotated Gray Image');

binImg=im2bw(inputImg);
rotateImg3=imrotate(binImg,theta);
%rotateImg3(rotateImg3 == 0) = 1;
figure,imshow(rotateImg3),title('Rotated Binary Image')

%figure,imshow(rotateImg, [min(min(rotateImg(:))) max(max(rotateImg(:)))]);