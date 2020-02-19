%%%%%%   batchFormation()
function [all_hist]=batchFormation1(dir_in, file_ext)
disp('WAIT! Execution begining...');
% list of files in the directory name with the input file extension
listing = dir(strcat(dir_in,'*.',file_ext));
file_names = {listing.name};
% number of pages in the directory with this file extension
num_pages = length(file_names);
%display(num_pages);
fprintf('Total number of pages = %d\n', num_pages);
 all_hist = [];
% process all pages in the directory
savingFile = '/home/roopkatha/Downloads/paper work/new feature/18 degree interval/Gurumukhi/64/2.csv';
for i = 1:num_pages
    dd = file_names{i};
    imgNum = str2double(dd(end-4));  
    fprintf('Processing page No: %d\n', i);  
    % load the image from the directory
    I = imread(strcat(dir_in,file_names{i}));
    I = rgb2gray(I);
    I = imresize(I,[64,64]);
    [ i1, i2, i3, i4 ] = four_part( I );
    I11 = mirrorimage(i1);
    I21 = waterimage(i1);
    I31 = mirror_waterimage(i1);
    I12 = mirrorimage(i2);
    I22 = waterimage(i2);
    I32 = mirror_waterimage(i2);
    I13 = mirrorimage(i3);
    I23 = waterimage(i3);
    I33 = mirror_waterimage(i3);
    I14 = mirrorimage(i4);
    I24 = waterimage(i4);
    I34 = mirror_waterimage(i4);
    [r,~] = size(i1);
    [r1,~] = size(I);
%     [r,~] = size(I);
    d = round(4*r/5);
    d1 = round(0.8*r1);
%     fin = [final_dev(I,d)];
    fin = [final_dev(I,d1) final_dev(i1,d) final_dev(I11,d) final_dev(I21,d) final_dev(I31,d) final_dev(i2,d) final_dev(I12,d) final_dev(I22,d) final_dev(I32,d) final_dev(i3,d) final_dev(I13,d) final_dev(I23,d) final_dev(I33,d) final_dev(i4,d) final_dev(I14,d) final_dev(I24,d) final_dev(I34,d)];
    final_hist_string  = fin;
    rowToWrite = [final_hist_string, imgNum];
    all_hist = [all_hist; rowToWrite];
    dlmwrite(savingFile, rowToWrite, '-append');
end
disp('WOW! Successful Execution...');
end