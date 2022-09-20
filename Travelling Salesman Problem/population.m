%% Function to generate a random set of poputation using the given number of cities 
%% and the coordinates of the cities
function pop = population(n, Data)

[x0 , ~] = size(Data);
A = zeros(x0,n); % creating an empty matrix to store the generated chromosomes
A(1,1:n) = 1;

for j = 1:n
    B = Data;
    for i = 2:x0
        [x1 , ~] = size(B);
        r = 1+randi(x1-1); % generating a random number
        A(i,j) = B(r,1); % storing the randomly selected city in a gene
        B(r,:) = []; % removing the selected city to avoid repetiton
    end
end
pop = A;