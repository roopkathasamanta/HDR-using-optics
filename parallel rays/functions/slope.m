function [incline] = slope(I)

% I = imread('C:\Users\Roopkatha\Desktop\image\ArabicBMP\Ad01006.bmp');
% I = rgb2gray(I);
[r,c]= size(I);
s = striking_point(I);
[rs,~] = size(s);
%I = im2bw(~I);
%I = bwmorph(I,'remove');
I = ~I;
incline = [];
for i = 1:rs
    x = s(i,1);
    y = s(i,2);
    if x>1 && y<c && y>1 && x<r
        if I(x-1,y+1) == 0
            if I(x+1,y-1)== 0
                inc = pi/4;
                incline = [incline; inc i];
            elseif I(x+1,y+1) == 0
                inc = pi/2;
                incline = [incline; inc i];
            elseif I(x-1,y-1) == 0
                inc = 0;
                incline = [incline; inc i];
            elseif I(x,y-1) == 0
                inc = pi/6;
                incline = [incline; inc i];
            elseif I(x+1,y) == 0
                inc = pi/3;
                incline = [incline; inc i];
            elseif I(x,y+1) == 0
                inc = pi*5/8;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = pi/4;
                incline = [incline; inc i];
            else
                incline = [incline; pi/4 i];
            end
        elseif I(x-1,y-1) == 0
            if I(x+1,y-1) == 0
                inc = pi/2;
                incline = [incline; inc i];
            elseif I(x,y+1) == 0
                inc = 5*pi/6;
                incline = [incline; inc i];
            elseif I(x+1,y) == 0
                inc = pi*2/3;
                incline = [incline; inc i];
            elseif I(x+1,y+1) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            elseif I(x,y-1) == 0
                inc = pi/8;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            else
                incline = [incline; 3*pi/4 i];
            end
        elseif I(x,y-1) == 0
            if I(x,y+1) == 0
                inc = 0;
                incline = [incline; inc i];
            elseif I(x+1,y+1) == 0
                inc = 5*pi/6;
                incline = [incline; inc i];
            elseif I(x+1,y) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            elseif I(x+1,y-1) == 0
                inc = pi/4;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = pi/4;
                incline = [incline; inc i];
            else
                incline = [incline; 0 i];
            end
        elseif I(x+1,y-1) == 0
            if I(x+1,y) == 0
                inc = pi/4;
                incline = [incline; inc i];
            elseif I(x+1,y+1) == 0
                inc = 0;
                incline = [incline; inc i];
            elseif I(x,y+1) == 0
                inc = pi/8;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = pi/8;
                incline = [incline; inc i];
            else
                incline = [incline; pi/4 i];
            end
        elseif I(x+1,y) == 0
            if I(x,y+1) == 0
                inc = pi/4;
                incline = [incline; inc i];
            elseif I(x+1,y+1) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = pi/2;
                incline = [incline; inc i];
            else
                incline = [incline; pi/2 i];
            end
        elseif I(x+1,y+1) == 0
            if I(x,y+1) == 0
                inc = 3*pi/8;
                incline = [incline; inc i];
            elseif I(x-1,y) == 0
                inc = 7*pi/8;
                incline = [incline; inc i];
            else
                incline = [incline; 3*pi/4 i];
            end
        elseif I(x,y+1) == 0
            if I(x-1,y) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            else
                inc = 0;
                incline = [incline; inc i];
            end
        end
    elseif y==1
        if x==1
            if I(x,y+1) == 0 && I(x+1,y) == 0
                incline = [incline; pi/4 i];
            end
        elseif x<r
            if I(x-1,y+1) == 0
                if I(x+1,y) == 0
                    incline = [incline; 3*pi/8 i];
                elseif I(x+1,y+1) == 0
                    incline = [incline; pi/2 i];
                else
                    incline = [incline; pi/4 i];
                end
            elseif I(x,y+1) == 0
                if I(x+1,y) == 0
                    incline = [incline; pi/4 i];
                else
                    incline = [incline; 0 i];
                end
            else
                incline = [incline; 3*pi/4 i];
            end
        end
    elseif y==c
        if x<r && x>1
            if I(x-1,y) == 0
                if I(x-1,y-1) == 0
                    inc = 3*pi/4;
                    incline = [incline; inc i];
                elseif I(x,y-1) == 0
                    incline = [incline;pi/4 i];
                elseif I(x+1,y-1) == 0
                    incline = [incline; pi/8 i];
                elseif I(x+1,y) == 0
                    incline = [incline; pi/2 i];
                else
                    incline = [incline; pi/2 i];
                end
            elseif I(x-1,y-1) == 0
                %                 if I(x,y+1) == 0
                %                     inc = 3*pi/8;
                %                     incline = [incline; inc i];
                if I(x+1,y-1) == 0
                    inc = pi/2;
                    incline = [incline; inc i];
                elseif I(x+1,y) == 0
                    inc = pi/8;
                    incline = [incline; inc i];
                else
                    inc = pi*3/4;
                    incline = [incline; inc i];
                end
            elseif I(x,y-1) == 0
                if I(x+1,y-1) == 0
                    inc = 7*pi/8;
                    incline = [incline; inc i];
                elseif I(x+1,y) == 0
                    inc = 3*pi/4;
                    incline = [incline; inc i];
                else
                    inc = 0;
                    incline = [incline; inc i];
                end
            elseif I(x+1,y-1) == 0
                if I(x+1,y) == 0
                    inc = 7*pi/8;
                    incline = [incline; inc i];
                else
                    inc = pi/4;
                    incline = [incline; inc i];
                end
            else
                inc = pi/2;
                incline = [incline; inc i];
            end
        elseif x>1
            if I(x-1,y) == 0
                if I(x-1,y-1) == 0
                    inc = 3*pi/4;
                    incline = [incline; inc i];
                elseif I(x,y-1) == 0
                    inc = 7*pi/8;
                    incline = [incline; inc i];
                else
                    inc = pi/2;
                    incline = [incline; inc i];
                end
            elseif I(x-1,y-1) == 0
                if I(x,y-1) == 0
                    inc = 3*pi/8;
                    incline = [incline; inc i];
                else
                    inc = 3*pi/4;
                    incline = [incline; inc i];
                end
            else
                inc = 0;
                incline = [incline; inc i];
            end
        end
    elseif x==1
        if y==1
            if I(x,y+1) == 0
                if I(x+1,y+1) == 0
                    inc = 3*pi/4;
                    incline = [incline; inc i];
                elseif I(x+1,y) == 0
                    incline = [incline; pi/4];
                else
                    incline = [incline; 0];
                end
            elseif I(x+1,y) == 0
                if I(x+1,y+1) == 0
                    inc = 3*pi/8;
                    incline = [incline; inc i];
                else
                    inc = 0;
                    incline = [incline; inc i];
                end
            end
        else
            if y<c
                if I(x,y-1) == 0
                    if I(x,y+1) == 0
                        inc = 0;
                        incline = [incline; inc i];
                    elseif I(x+1,y+1) == 0
                        inc = 7*pi/8;
                        incline = [incline; inc i];
                    elseif I(x+1,y) == 0
                        inc = 3*pi/4;
                        incline = [incline; inc i];
                    elseif I(x+1,y-1) == 0
                        inc = 5*pi/8;
                        incline = [incline; inc i];
                    else
                        incline = [incline; 0 i];
                    end
                elseif I(x,y+1) == 0
                    if I(x+1,y+1) == 0
                        inc = 3*pi/8;
                        incline = [incline; inc i];
                    elseif I(x+1,y) == 0
                        inc = pi/4;
                        incline = [incline; inc i];
                    elseif I(x+1,y-1) == 0
                        inc = pi/8;
                        incline = [incline; inc i];
                    else
                        incline = [incline; 0 i];
                    end
                elseif I(x+1,y+1) == 0
                    if I(x+1,y) == 0
                        inc = pi/8;
                    elseif I(x+1,y-1) == 0
                        inc = 0;
                        incline = [incline; inc i];
                    else
                        incline = [incline; 3*pi/4 i];
                    end
                elseif I(x+1,y) == 0
                    if I(x+1,y-1) == 0
                        inc  = 7*pi/8;
                        incline = [incline; inc i];
                    else
                        incline = [incline; pi/2 i];
                    end
                else
                    incline = [incline; pi/4 i];
                end
            end
        end
    elseif x==c
        if I(x-1,y) == 0
            if I(x-1,y+1) == 0
                inc = 7*pi/8;
                incline = [incline; inc i];
            elseif I(x,y+1) == 0
                inc = 3*pi/4;
                incline = [incline; inc i];
            else
                incline = [incline; pi/2 i];
            end
        elseif I(x-1,y+1) == 0
            if I(x,y+1) == 0
                inc = 5*pi/8;
                incline = [incline; inc i];
            else
                incline = [incline; pi/4 i];
            end
        else
            incline = [incline; 0 i];
        end
    end
end
% imshow(I);

end