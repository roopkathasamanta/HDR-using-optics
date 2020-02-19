function [shift] = deviation(I)

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00010.bmp');
% I = rgb2gray(I);
[r,~]= size(I);
% s = striking_point(I);
[incline] = slope(I);
[ri,~] = size(incline);
d = 2;
m = 1.5;
shift = zeros(1,r);
for i = 1:ri
    ref = asin(sin(incline(i,1))/m);
    sh = d*sin(incline(i,1)-ref)/cos(ref);
    shift(i) = sh;
end

end