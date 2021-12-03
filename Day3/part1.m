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

% Loop through the numbers, we will average the values to determine if it should be 0 or 1
for i = 1:sizeOfData
    curVal = data{i};
    for j = 1:bitsPerRow
        frequencyCounter(j) = frequencyCounter(j) + str2num(curVal(j));
    end
end

% Determine Gamma and Epsilon from the frequency
for i = 1:bitsPerRow
    popularBit = frequencyCounter(i)/sizeOfData;
    if popularBit >= 0.5
        gamma = gamma + "1";
        epsilon = epsilon + "0";
    else
        gamma = gamma + "0";
        epsilon = epsilon + "1";
    end
end

% Convert binary to decimal
gammaDec = bin2dec(gamma);
epsilonDec = bin2dec(epsilon);

% Display the answer and clean up data
fprintf('%.0f\n', gammaDec * epsilonDec);
clear;
