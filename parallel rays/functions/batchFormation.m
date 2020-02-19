%%%%%%   batchFormation()

function [all_hist]=batchFormation(dir_in, file_ext)
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
savingFile = '/home/roopkatha/Downloads/paper work/new feature1/csv_newfeature_1/gurumukhi/0.csv';
for i = 1:num_pages
    dd = file_names{i};
    imgNum = str2double(dd(end-4));
  
    fprintf('Processing page No: %d\n', i);    
    
   
    % load the image from the directory
    I = imread(strcat(dir_in,file_names{i}));
    %I = rgb2gray(I);
    I = imresize(I,[64 64]);
    [ i1, i2, i3, i4 ] = four_part( I );
    I1 = mirror_waterimage(I);
    I2 = waterimage(I);
    I3 = mirror_waterimage(I);
    I11 = mirror_waterimage(i1);
    I21 = waterimage(i1);
    I31 = mirror_waterimage(i1);
    I12 = mirror_waterimage(i2);
    I22 = waterimage(i2);
    I32 = mirror_waterimage(i2);
    I13 = mirror_waterimage(i3);
    I23 = waterimage(i3);
    I33 = mirror_waterimage(i3);
    I14 = mirror_waterimage(i4);
    I24 = waterimage(i4);
    I34 = mirror_waterimage(i4);
%     [~,~] = size(I);
%     d = round(2*r/3);
%     [shift] = deviation(I);
    final_hist_string  = [deviation(I) deviation(I1) deviation(I2) deviation(I3) deviation(i1) deviation(I11) deviation(I21) deviation(I31) deviation(i2) deviation(I12) deviation(I22) deviation(I32) deviation(i3) deviation(I13) deviation(I23) deviation(I33) deviation(i4) deviation(I14) deviation(I24) deviation(I34)];
    rowToWrite = [final_hist_string, imgNum];
    all_hist = [all_hist; rowToWrite];
    dlmwrite(savingFile, rowToWrite, '-append');

end

disp('WOW! Successful Execution...');
end
