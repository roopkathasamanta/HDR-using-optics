function [ fin_feature ] = inside_per_all_source( img, source_list )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% final feature merging all the percentage of sources

[r,~] = size(source_list);

fin_feature = [];

for i = 1:r
    
    x = cal_per_inside( img, source_list(i,:) );
    fin_feature = [fin_feature x];
    
end


end

