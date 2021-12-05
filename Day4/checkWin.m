% Helper function to check if a bingo board has won
function hasWon = checkWin(board, numbersDrawn)
    hasWon = false;
    markedNumbers = zeros(5);
    for i = 1:numel(board)
        for j = 1:numel(numbersDrawn)
            if board(i) == numbersDrawn(j)
                markedNumbers(i) = 1;
            end
        end
    end
    for i = 1:5
        if markedNumbers(i, :) == ones(1,5)
            hasWon = true;
        end
        if markedNumbers(:, i) == ones(5,1)
            hasWon = true;
        end
    end

end