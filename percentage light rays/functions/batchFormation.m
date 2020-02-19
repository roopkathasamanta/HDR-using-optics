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
savingFile = '/home/roopkatha/Downloads/paper work/percentage light rays/csv/Gurumukhi/9.csv';
for i = 1:num_pages
    dd = file_names{i};
    imgNum = str2double(dd(end-4));
  %if((i>=120)&&(i<125))  
    fprintf('Processing page No: %d\n', i);    
    
   
    % load the image from the directory
    I = imread(strcat(dir_in,file_names{i}));
    

    final_hist_string  = main( I,9, 9);
    rowToWrite = [final_hist_string, imgNum];
    all_hist = [all_hist; rowToWrite];
    dlmwrite(savingFile, rowToWrite, '-append');

end

disp('WOW! Successful Execution...');
end
