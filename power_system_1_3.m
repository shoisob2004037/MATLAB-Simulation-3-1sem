clc;
clear;
size_matrix = input("Enter the size of the admittance matrix: ");
y = zeros(size_matrix)
disp("Enter the elements of the admittance matrix:");

for i = 1:size_matrix
    for j = 1:size_matrix
        y(i, j) = input(sprintf('Enter the value of y(%d,%d): ', i, j));
    end
end

disp("Original Matrix:");
disp(y);

[a1, b1] = size(y)

m = input("How many nodes do you want to eliminate: ");
if m >= 1 && m <= size_matrix
    
    for k = 1:m
        z = zeros(a1-1, b1-1); 
        for a = 1:a1-1
            for b = 1:b1-1
                z(a,b) = y(a,b) - ((y(a,size_matrix)*y(size_matrix,b))/y(size_matrix,size_matrix)); % Corrected variable names
            end
        end
        disp(['Matrix after eliminating node:']);
        disp(z);
        y = z;
        [a1, b1] = size(y);
        size_matrix=size_matrix-1;
    end
else
    disp('Invalid input: Number of nodes to eliminate must be between 1 and the size of the matrix.');
end
