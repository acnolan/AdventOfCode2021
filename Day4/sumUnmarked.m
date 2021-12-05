% Helper function for part 1, to sum the values of unmarked squares
function summedVals = sumUnmarked(board, drawnNumbers)
    unmarked = setdiff(board, drawnNumbers);
    summedVals = sum(unmarked);
end
