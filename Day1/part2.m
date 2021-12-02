% Written in R2021b
fid = fopen("input","r");
data = fscanf(fid,"%d");
increases = 0;
for i = 1:size(data,1)-3
    windowA = data(i) + data(i+1) + data(i+2);
    windowB = data(i+1) + data(i+2) + data(i+3);
    if(windowB > windowA)
        increases = increases + 1;
    end
end
disp(increases);
%clear;