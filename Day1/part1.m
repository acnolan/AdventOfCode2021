% Written in R2021b

% Open the file and read data
fid = fopen("input","r");
data = fscanf(fid,"%d");

% initialize the counter
increases = 0;

% Loop through the data
for i = 2:size(data,1)
    if(data(i) > data(i-1))
        increases = increases + 1;
    end
end

% Display the answer and clear data
disp(increases);
clear;