% Written in R2021b

% Read the data
fid = fopen("input","r");
data = fscanf(fid,"%d");

% Initialize counter
increases = 0;

% Slide the windows
for i = 1:size(data,1)-3
    windowA = data(i) + data(i+1) + data(i+2);
    windowB = data(i+1) + data(i+2) + data(i+3);
    if(windowB > windowA)
        increases = increases + 1;
    end
end

% Display the answer and clean up data
disp(increases);
clear;