function [strike] = strikingpoint(I)

% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00778.bmp');
% I = rgb2gray(I);
[r,c]= size(I);
strike = [];
for i = 1:r
    for j = 1:c
        if I(i,j) == 0
            s = [i j];
            strike = [strike; s];
            break;
        end
    end
end

end