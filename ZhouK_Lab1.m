function output = ZhouK_Lab1(ary)

% row vector containing the size of the input array
arySize = size(ary); 

% statement to set the output to 0 if the array isn't square
if arySize(1)~=arySize(2);
    output = 0;
else
    % START OF FIRST OUTPUT VALUE
    
    % row vector containing the max value of each column
    mostPositive = max(ary) 
    
    % row vector containing the min value of each row, which is done by transposing the matrix prior to calling min
    mostNegative = min(transpose(ary)); 

    % the flip command is used to reverse the order of the vector, then it is flipped again to become a column vector
    mostNegative = transpose(flip(mostNegative))

    % the first output value is the dot product of the vectors
    firstValue = dot(mostPositive,mostNegative); 

    % END OF FIRST OUTPUT VALUE

    %------------------------------------------------------------------------------------

    % START OF SECOND OUTPUT VALUE

    % START OF FIRST VECTOR TO BE DOTTED

    % Largest magnitude term in each column
    % Use this syntax of the max function in order to store the data for the row numbers of the largest magnitudes of each column of the matrix
    [M,I] = max(abs(ary)); 
    % define an empty column vector
    largestMag = []; 
    % iterate for each column of the matrix
    for c=1:arySize(1)
        % concatenate to the bottom of column vector another column vector containing the row index from the variable I, and the column index from the for loop variable
        largestMag = cat(1,largestMag,[ary(I(c),c)]); 
    end

    % Most negative term in each column
    % first take the min of all elements, then transpose the returned row vector into a column vector
    mostNegative = transpose(min(ary)); 

    % Magnitudes of the sort terms
    mostNegative = abs(mostNegative);

    % Concatenate them, with the sort terms first
    % concatenate the vectors by appending them as columns, in the correct order
    catVector = cat(2,mostNegative,largestMag); 

    % Sort descending by the first column
    % call the sortrows command, specifying descending order
    catVector = sortrows(catVector,'descend'); 

    % First vector to be dotted
    firstVec = catVector(:,2)

    % END OF FIRST VECTOR TO BE DOTTED

    % START OF SECOND VECTOR TO BE DOTTED

    % Smallest magnitude term in each row
    % Use this syntax of the min function in order to store the data for the column numbers of the largest magnitudes of each row of the matrix
    [M,I] = min(abs(transpose(ary))); 
    % define an empty column vector
    smallestMag = []; 
    % iterate for each column of the matrix
    for c=1:arySize(1)
        % concatenate to the bottom of column vector another column vector containing the column index from the variable I, and the row index from the for loop variable.
        smallestMag = cat(1,smallestMag,[ary(c,I(c))]); 
    end

    % Diagonal term in each row
    diagonalTerms = diag(ary);

    % Magnitudes of the sort terms
    diagonalTerms = abs(diagonalTerms);

    % Concatenate them with the sort terms first
    % concatenate the vectors by appending them as columns, in the correct order
    catVector = cat(2,diagonalTerms,smallestMag); 

    % Sort ascending by the first column
    % call the sortrows command
    catVector = sortrows(catVector); 

    % Second vector to be dotted
    secondVec = catVector(:,2)
    
    % the second output value is the dot product of the two vectors
    secondValue = dot(firstVec, secondVec); 

    % END OF SECOND VECTOR TO BE DOTTED

    % END OF SECOND OUTPUT VALUE

    %------------------------------------------------------------------------------------

    % START OF THIRD OUTPUT VALUE
    
    % assume that the matrix is positive definite
    thirdValue = 1; 
    
    % initialie the index variable
    index = 1; 

    % this while loop will only run when the matrix has not yet found to be not positive definite and when the current size of the submatrix being checked is still less than or equal to the size of the entire matrix
    while (thirdValue && index <= arySize(1))
        % iniitalize the submatrix with the proper size
        subMatrix = ary(1:index,1:index); 
        if det(subMatrix) <= 0
            % update the counter if the submatrix is found to not be positive definite
            thirdValue = 0; 
        end
        % increment the index to check the next submatrix
        index = index + 1; 
    end

    % END OF THIRD OUTPUT VALUE

    %------------------------------------------------------------------------------------

    % Combine the output values into a single column vector
    output = [firstValue; secondValue; thirdValue]; 

end