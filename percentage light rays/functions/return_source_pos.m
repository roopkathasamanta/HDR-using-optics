function [ pos ] = return_source_pos( R,C,m,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% m is source per row, n is source per coloumn

stepr = R/(m+1);
stepc = C/(n+1);

stepr = round(stepr);
stepc = round(stepc);

pos = [];

x = 1;
y = 1;

for i = 1:m
    x = x + stepr;
    for j = 1:n
        y = y+stepc;
        pos = [pos; [x y]];
    end
    
    y = 1;
end

end

