function [t] = totaldev(I,d)
% total deviation suffered by the ray after travelling through all mediums

% I = imread('C:\Users\Roopkatha\Desktop\shadow\seperate\bold\Sample011\img011-00002.png.png');
% I = rgb2gray(I);

% size of image
[r,~] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

% matrix having measure of deviation of ray in medium 2
new = new_deviation(I,d);

% size of deviation
[rd,~] = size(new);

a = refraction(I,d);
% size of a
[ra,~] = size(a);

% if a(1,:) == [0 0 0]
%     a(1,:) = [];
% end

% here some formulae have been used to calculate the deviation
% d*tan(a(i,3)) = deviation due to first refraction
% new(i,1) = horizontal shift due to glass slab refraction

t = [];
for i = 2:rd
    if tan(a(i,3))>tan(a(i,2))
        total_dev = [d*tan(a(i,3)) - (d*tan(a(i,2)) + new(i,1)) a(i,3)*36/pi];
        t = [t;total_dev];
    else
        total_dev = [((d*tan(a(i,2)) + new(i,1)) - d*tan(a(i,3))) a(i,3)*36/pi];
        t = [t;total_dev];
    end
end

end


