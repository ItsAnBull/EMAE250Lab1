function output = ZhouK_Lab1(ary)

arySize = size(ary); % vector containing the size of the input array

% if statement to set the output to 0 if the array isn't square
if arySize(1)~=arySize(2);
    output = 0;
else
    % START OF FIRST OUTPUT VALUE

    mostPositive = max(ary) % row vector containing the max value of each column

    mostNegative = min(transpose(ary)); % row vector containing the min value of each row, which is done by transposing the matrix prior to calling min
    % the flip command is used to reverse the order of the vector
    mostNegative = flip(mostNegative)

    firstValue = dot(mostPositive,mostNegative); % the first output value is the dot product of the vectors

    % END OF FIRST OUTPUT VALUE

    %------------------------------------------------------------------------------------

    % START OF SECOND OUTPUT VALUE

    % START OF FIRST VECTOR TO BE DOTTED

    % Largest magnitude term in each column
    largestMag = transpose(max(abs(ary))); % first take the abs of all elements, then find max of each column and store that in a row vector, then turn that into a column vector.

    % Most negative term in each column
    mostNegative = transpose(min(ary)); % first take the min of all elements, then transpose the returned row vector into a column vector

    % Magnitudes of the sort terms
    mostNegative = abs(mostNegative)

    % Concatenate them, with the sort terms first
    catVector = cat(2,mostNegative,largestMag); % concatenate the vectors by appending them as columns, in the correct order

    % Sort descending by the first column
    catVector = sortrows(catVector,'descend'); % call the sortrows command, specifying descending order

    % First vector to be dotted
    firstVec = A(:,2)

    % END OF FIRST VECTOR TO BE DOTTED

    % START OF SECOND VECTOR TO BE DOTTED

    % Smallest magnitude term in each row
    smallestMag = trans(min(transpose(abs(ary)))); % first take the abs of all elements, then transpose it to target the rows, then call the min function to return a row vector, then finally transpose that into a column
    
    % Diagonal term in each row
    diagonalTerm = 

    % END OF SECOND VECTOR TO BE DOTTED
    

    % END OF SECOND OUTPUT VALUE
end