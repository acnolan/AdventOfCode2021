% Written in R2021b

% Read the input data
T = readtable("input");
numRows = size(T,1);

% Initialize the position data
horzPos = 0;
vertPos = 0;

% Loop through and adjust position data
for i = 1:numRows
    switch char(T{i,1})
        case "forward"
            horzPos = horzPos + T{i,2};
        case "down"
            vertPos = vertPos + T{i,2};
        case "up"
            vertPos = vertPos - T{i,2};
    end
end

% Display answer and clear data
disp(vertPos * horzPos);
clear;