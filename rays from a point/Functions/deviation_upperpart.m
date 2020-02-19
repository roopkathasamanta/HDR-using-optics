function [devi_up] = deviation_upperpart(I,d)
% deviation suffered by the rays in the upper air medium

% I = imread('C:\Users\Roopkatha\Desktop\image\ArabicBMP\Ad00001.bmp');
% [ I, ~, ~, ~ ] = four_part(I);
% I1 = mirrorimage(I);
% I = waterimage(I);
% I3 = mirror_waterimage(I);
% size of image
% I = rgb2gray(I);

[r,~] = size(I);
% height from base upto which the second medium is placed
% d = round(2*r/3);

% B = strikingpoint(I,d);

a = refraction(I,d);
A = upper_part(I,d);
[s] = new_slope(I,d);

% size of A
[ra,~] = size(A);

[rs,~] = size(s);

devi_up = [];
if ra<=rs
    for i = 1:ra
        if rs~=1
            dev = [s(i,1)*sin(a(i+1,2)-a(i+1,3))/(cos(a(i+1,3))*cos(a(i+1,3))) a(i+1,3)*36/pi];
            devi_up = [devi_up;dev];
        else
            dev = [s(1,1)*sin(a(i+1,2)-a(i+1,3))/(cos(a(i+1,3))*cos(a(i+1,3))) a(i+1,3)*36/pi];
            devi_up = [devi_up;dev];
        end
        
    end
else
    for i = 1:rs
        if rs~=1
            dev = [s(i,1)*sin(a(i+1,2)-a(i+1,3))/(cos(a(i+1,3))*cos(a(i+1,3))) a(i+1,3)*36/pi];
            devi_up = [devi_up;dev];
        else
            dev = [s(1,1)*sin(a(i+1,2)-a(i+1,3))/(cos(a(i+1,3))*cos(a(i+1,3))) a(i+1,3)*36/pi];
            devi_up = [devi_up;dev];
        end
        
    end
end

end

