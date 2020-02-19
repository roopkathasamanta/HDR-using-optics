function[s_up] = new_slope(I,d)
%this function calculates the local slope and correspondng local width

% I = imread('C:\Users\Roopkatha\Desktop\image\HindiBMP\img000142.bmp');
% [ I, ~, ~, ~ ] = four_part(I);
% I2 = mirrorimage(I);
% I1 = waterimage(I);
% I = mirror_waterimage(I);
% I = rgb2gray(I);

% size of image
[r,c] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

B = strikingpoint(I,d);
A = upper_part(I,d);
[r1,~] = size(B);
[r2,~] = size(A);

% the fuction has two parts: one part is calculating slope for the striking point in the lower region where striking point for which slope is calculated is obtained after two refractions, rather where the second refraction is taking place
%{and the second part calculates the local slope for the upper part where striking point is the point where the first and only refraction is taking place}


x = [];
w = [];
v = [];
y = [];

% taking the striking point is taken as origin and width is claculated along a straight line which is rotated from 0 to 360 deg with an interval of 10 deg and the angle correspoonding to least width is taken as slope and that least width is taken as depth used for glass slab refraction} 

% its the first part
for i = 1:r1
    for ang = 0:36
        for j = 1:(c-B(i,2)-1)
            if (c-B(i,2)-1)>0 && (c-B(i,2)-1)<=r && (B(i,1)-j*round(tan(ang*10*pi/180)))>0 && (B(i,1)-j*round(tan(ang*10*pi/180)))<=r
                if I((B(i,1)-j*round(tan(ang*10*pi/180))),B(i,2)+j)==255
                    x = [ang*10 abs(round(j/cos(tan(ang*10*pi/180)))) i];                    
                end
            end
        end
        w = [w;x];
    end
end
w = unique(w,'rows');
[rw,~] = size(w);

m = [];
n = [];
p = [];

for i = 1:rw
    min = w(1,2);
    for j = i+1:rw
        if w(i,3) == w(j,3)
            if w(j,2)<w(i,2)
                if w(j,2)<min
                    min = w(j,2);
                end
                if w(j,1)>180
                    n = [w(j,3) 360-w(j,1) min];
                else
                    n = [w(j,3) w(j,1) min]; 
                end
            else
                if w(i,2)<min
                    min = w(i,2);
                end
                if w(i,1)>180
                    n = [w(i,3) 360-w(i,1) min];
                else
                    n = [w(i,3) w(i,1) min]; 
                end
            end
        end
    end
    m = [m; n];
end
m = unique(m,'rows');

% its the second part
for i = 1:r2
    for ang = 0:36
        for j = 1:(c-A(i,2)-1)
            if (c-A(i,2)-1)>0 && (c-A(i,2)-1)<=r && (A(i,1)-j*round(tan(ang*10*pi/180)))>0 && (A(i,1)-j*round(tan(ang*10*pi/180)))<=r
                if I((A(i,1)-j*round(tan(ang*10*pi/180))),A(i,2)+j)==255
                    y = [ang*10 abs(round(j/cos(tan(ang*10*pi/180)))) i];                    
                end
            end
        end
        v = [v;y];
    end
end
v = unique(v,'rows');
[rv,~] = size(v);
q = [];
for i = 1:rv
    min1 = v(1,2);
    for j = i+1:rv
        if v(i,3) == v(j,3)
            if v(j,2)<v(i,2)
                if v(j,2)<min1
                    min1 = v(j,2);
                end
                if v(j,1)>180
                    p = [v(j,3) 360-v(j,1) min1];
                else
                    p = [v(j,3) v(j,1) min1];
                end
            else
                if v(i,2)<min1
                    min1 = v(i,2);
                end
                if v(i,1)>180
                    p = [v(i,3) 360-v(i,1) min1];
                else
                    p = [v(i,3) v(i,1) min1];
                end
            end
        end
    end
    q = [q; p];
end
q = unique(q,'rows');

s = [m;q];
s = sort(s,1,'ascend');
[rs,~] = size(s);
s_up = [];

if rs~= 0
    for k = s(1,1):s(rs,1)
        for i = 1:rs
            if s(i,1) == k
                t = s(i,:);
                s_up = [s_up; t];
                break;
            end
        end
    end
else
    s_up = [1 0 c];
end
s_up = unique(s_up,'rows');


end