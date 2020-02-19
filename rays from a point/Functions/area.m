I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');
% size of image
[r,c] = size(I);
[xcoord,ycoord] = centreofgravity(I);
for i = 0:24
    if xcoord>=sin(i*15*pi/180) && (ycoord+cos(i*15*pi/180))<=128
        
    end
end