% Written in R2021b
fid = fopen("input","r");
data = fscanf(fid,"%d");
increases = 0;
for i = 2:size(data,1)
    if(data(i) > data(i-1))
        increases = increases + 1;
    end
end
disp(increases);
clear;