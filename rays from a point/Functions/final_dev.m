function [f] = final_dev(I,d)
% final deviation suffered by all the rays

% I = imread('C:\Users\Roopkatha\Desktop\image\ArabicBMP\Ad00001.bmp');
% [ I, ~, ~, ~ ] = four_parts( I );
% I = waterimage(I);
% I = rgb2gray(I);

% size of image
[r,~] = size(I);
% height from base upto which the second medium is placed
% d = round(2*r/3);
% a = refraction(I,d);
f = zeros(1,5);
devi_up = deviation_upperpart(I,d);
t = totaldev(I,d);
final = [t;devi_up];
final = transpose(final);
%f(1,1) = 0;
[rf,cf] = size(final);
if cf>=2
    for i = 2:cf
        f(1,i) = final(1,i-1);
    end
end

end