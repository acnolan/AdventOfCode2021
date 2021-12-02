% Written in R2021b

% Read the input data
T = readtable("input");
numRows = size(T,1);

% Initialize the position data
horzPos = 0;
vertPos = 0;
aim = 0;

% Loop through and adjust position data
for i = 1:numRows
    switch char(T{i,1})
        case "forward"
            horzPos = horzPos + T{i,2};
            vertPos = vertPos + aim * T{i,2};
        case "down"
            aim = aim + T{i,2};
        case "up"
            aim = aim - T{i,2};
    end
end

% Display answer and clear data
fprintf('%.0f\n',vertPos * horzPos);
clear;