function [ fin ] = main( img,m,n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

img = im2bw(img);
img = imresize(img,[64 64]);
[R,C] = size(img);
pos = return_source_pos( R,C,m,n );
 
 fin = inside_per_all_source( img, pos );


end

