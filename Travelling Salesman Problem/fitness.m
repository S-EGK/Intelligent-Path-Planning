%% function to evaluate fitness using distance between cities
function fit = fitness(pop, Data)

[x0, y0] = size(pop);

for i=1:y0
    A=pop(:,i);
    B = zeros(size(A));
    for j1 = 1:x0-1
        [x1, ~] = find(Data(:,1) == A(j1,1));
        [x2, ~] = find(Data(:,1) == A(j1+1,1));
        B(j1, 1) = sqrt(power((Data(x1,2)-Data(x2,2)),2) + power((Data(x1,2)-Data(x2,2)),2)); % finding distance between each city
    end
    [x1, ~] = find(Data(:,1) == A(1,1));
    [x2, ~] = find(Data(:,1) == A(x0,1));
    B(j1+1,1) = sqrt(power((Data(x1,2)-Data(x2,2)),2) + power((Data(x1,2)-Data(x2,2)),2));
    Y(1,i) = 1/sum(B); % calculating fitness as inverse of distance between cities
end
fit = Y;