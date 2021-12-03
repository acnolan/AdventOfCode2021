% Written in R2021b

% Read the data
fid = fopen("input","r");
data = textscan(fid,"%s");
data = data{1};
sizeOfData = size(data,1);
bitsPerRow = size(data{1},2);

% initialize the values
frequencyCounter = zeros(1,bitsPerRow);
gamma = "";
epsilon = "";

% Loop until we have one oxygenGeneratorRating option left
oxygenGeneratorRatingData = data;
currentBit = 1;
frequencyCount = 0;
while size(oxygenGeneratorRatingData, 1) > 1
    % Determine most common current bit
    for i = 1:size(oxygenGeneratorRatingData, 1)
        curVal = oxygenGeneratorRatingData{i};
        frequencyCount = frequencyCount + str2num(curVal(currentBit));
    end
    popularBit = frequencyCount/size(oxygenGeneratorRatingData, 1);
    if popularBit >= 0.5
        popularBit = '1';
    else
        popularBit = '0';
    end
    tempdata = {};
    for i = 1:size(oxygenGeneratorRatingData, 1)
        if(oxygenGeneratorRatingData{i}(currentBit) == popularBit)
            tempdata = [tempdata; oxygenGeneratorRatingData{i}];
        end
    end
    oxygenGeneratorRatingData = tempdata;
    frequencyCount = 0;
    currentBit = currentBit+1;
end

% Loop until we have one CO2 Scrubber Rating option left
CO2ScrubberRatingData = data;
currentBit = 1;
frequencyCount = 0;
while size(CO2ScrubberRatingData, 1) > 1
    % Determine most common current bit
    for i = 1:size(CO2ScrubberRatingData, 1)
        curVal = CO2ScrubberRatingData{i};
        frequencyCount = frequencyCount + str2num(curVal(currentBit));
    end
    popularBit = frequencyCount/size(CO2ScrubberRatingData, 1);
    % Invert the check so we find least popular bit
    if popularBit >= 0.5
        popularBit = '0';
    else
        popularBit = '1';
    end
    tempdata = {};
    for i = 1:size(CO2ScrubberRatingData, 1)
        if(CO2ScrubberRatingData{i}(currentBit) == popularBit)
            tempdata = [tempdata; CO2ScrubberRatingData{i}];
        end
    end
    CO2ScrubberRatingData = tempdata;
    frequencyCount = 0;
    currentBit = currentBit+1;
end

% Convert binary to decimal
oxygenGeneratorRating = bin2dec(oxygenGeneratorRatingData{1});
CO2ScrubberRating = bin2dec(CO2ScrubberRatingData{1});

% Display the answer and clean up data
fprintf('%.0f\n', oxygenGeneratorRating * CO2ScrubberRating);
clear;
