% Written in R2021b

% Initialize the data
bingoOrder = [];
bingoBoards = [];
bingoBoard = [];

% Read the input
fid = fopen('input','r');
isFirstLine = true;
while true
    curLine = fgetl(fid);
    if ~ischar(curLine)  %end of file
        break; 
    end
    if curLine == ""
        continue
    end
    if(isFirstLine)
        isFirstLine = false;
        bingoOrder = str2num(char(split(curLine,',')));
    else
        if size(bingoBoard, 1) == 0
            numericData = split(curLine, " ");
            bingoBoard = str2num(char(numericData(numericData ~= "")))';
        else
            numericData = split(curLine, " ");
            bingoBoard = [bingoBoard; str2num(char(numericData(numericData ~= "")))'];
        end

        if size(bingoBoard, 1) == 5
            if size(bingoBoards, 1) == 0
                bingoBoards = {bingoBoard};
            else
                bingoBoards = [bingoBoards, {bingoBoard}];
            end
            bingoBoard = [];
        end
    end
end
fclose(fid);

% Clean up some variables
clear ans bingoBoard curLine isFirstLine numericData fid;

% Loop through the input values and check if any boards have won
drawnNumbers = [];
winningBoard = [];
winningNumber = 0;
numberOfWinners = 0;
winners = [];
for i = 1:numel(bingoOrder)
    drawnNumbers = [drawnNumbers; bingoOrder(i)];
    for j = 1:numel(bingoBoards)
        alreadyWon = false;
        for k = 1:numel(winners)
            if(winners(k) == j)
                alreadyWon = true;
                break;
            end
        end
        if alreadyWon
            continue;
        end
        hasWon = checkWin(bingoBoards{j}, drawnNumbers);
        if hasWon
            winningBoard = bingoBoards{j};
            winningNumber = bingoOrder(i);
            numberOfWinners = numberOfWinners + 1;
            winners = [winners j];
            if numberOfWinners == size(bingoBoards,2)
                break
            end
        end
    end
    if numberOfWinners == size(bingoBoards,2)
        break
    end
end

% Sum the unmarked numbers of the winning board
summedVals = sumUnmarked(winningBoard, drawnNumbers);

% Determine the final answer
fprintf('%.0f\n', summedVals * winningNumber);
  