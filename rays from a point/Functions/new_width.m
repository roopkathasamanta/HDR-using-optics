function [new] = new_width(I,d)
% I = imread('C:\Users\Roopkatha\Desktop\image\BengaliBMP\bn00001.bmp');
% I = rgb2gray(I);
% size of image
[r,c] = size(I);

% height from base upto which the second medium is placed
% d = round(2*r/3);

%two centre points 
p = [r/4 c/2];
q = [3*r/4 c/2];
B = strikingpoint(I,d);
a = refraction(I,d);
m2 = 2;
width = [];
new = [];
[r1,~] = size(B);

for i = 1:r1
    count = 0;
    if B(i,1)>= r/2
        slope = ((B(i,2) - p(1,2))/(B(i,1) - p(1,1)));
        angle = atan(slope);
        sec_ang_incidence = pi - angle - a(i,2);
        sec_ang_refraction = asin(sin(sec_ang_incidence)/m2);
        if c-B(i,2)>0
            for j = 1:c-B(i,2)
                if B(i,2)<p(1,2)
                    if (B(i,1)-round(B(i,2)-j*slope))>0 && (B(i,2)-j)>0 && (B(i,1)-round(B(i,2)-j)*slope)<=r && (B(i,2)-j)<=c
                        if I(B(i,1)-round(B(i,2)-j*slope),(B(i,2)-j)) == 0
                            break;
                        else
                            count = count + 1;
                        end
                    end
                else
                    if B(i,1)+round((B(i,2)-j)*slope)>0 && B(i,2)-j>0 && B(i,1)+round((B(i,2)-j)*slope)<=r && B(i,2)-j<=c
                        if I(B(i,1)+round((B(i,2)-j)*slope),(B(i,2)-j)) == 0
                            break;
                        else
                            count = count + 1;
                        end
                    end
                end
            end
        end
        dev = (count+1)*sin(sec_ang_incidence - sec_ang_refraction)/(cos(sec_ang_refraction)*cos(sec_ang_refraction));
        new = [new; dev];
    else
        slope = ((B(i,2) - q(1,2))/(B(i,1) - q(1,1)));
        angle = atan(slope);
        sec_ang_incidence = pi - angle - a(i,2);
        sec_ang_refraction = asin(sin(sec_ang_incidence)/m2);
        if c-B(i,2)>0
            for j = 1:c-B(i,2)
                if B(i,2)<q(1,2)
                    if (B(i,1)-round(B(i,2)-j*slope))>0 && (B(i,2)-j)>0 && (B(i,1)-round(B(i,2)-j)*slope)<=r && (B(i,2)-j)<=c
                        if I(B(i,1)-round(B(i,2)-j*slope),(B(i,2)-j)) == 0
                            break;
                        else
                            count = count + 1;
                        end
                    end
                else
                    if B(i,1)+round((B(i,2)-j)*slope)>0 && B(i,2)-j>0 && B(i,1)+round((B(i,2)-j)*slope)<=r && B(i,2)-j<=c
                        if I(B(i,1)+round((B(i,2)-j)*slope),(B(i,2)-j)) == 0
                            break;
                        else
                            count = count + 1;
                        end
                    end
                end
            end
        end
        dev = (count+1)*sin(sec_ang_incidence - sec_ang_refraction)/(cos(sec_ang_refraction)*cos(sec_ang_refraction));
        new = [new; dev];
    end    
end
       
end

