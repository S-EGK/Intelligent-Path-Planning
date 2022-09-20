%% function to perform crossover
function cross = crossover(pop, c)
[x, y] = size(pop);
Y = zeros(x, c);
def1 = randperm(x)'; % randomly generation a set for child 1
def2 = randperm(x)'; % randomly generation a set for child 2
for z=1:c
    a = pop(:, randi(y)); % parent 1
    b = pop(:, randi(y)); % parent 2
    while a == b
         b = pop(:, randi(y));
    end
    [x0, ~] = size(def1);
    r = randi(x0-1)-1; % randomly generating the crossover point
    A1 = a(1:r,:); % parent 1 part 1
    B1 = b(1:r,:); % parent 2 part 1
    A2 = a(r+1:x0,:); % parent 1 part 2
    B2 = b(r+1:x0,:); % parent 2 part 2
    C1 = setdiff(B2,A1,'stable'); % checking the unique values in part 2 of parent 2 from part 1 of parent 1
    C2 = setdiff(A2,B1,'stable'); % checking the unique values in part 2 of parent 1 from part 1 of parent 2
    [x1, ~] = size(C1);
    [x2, ~] = size(C2);
    
    D1 = zeros(x,1);
    D2 = zeros(x,1);
    D1(1:r,:) = A1;
    D1(r+1:r+x1,:) = C1;
    z1 = setdiff(def1,D1,'stable'); % sorting the missing cities
    D1(r+x1+1:x0,:) = z1; % child 1
    
    D2(1:r,:) = B1;
    D2(r+1:r+x2,:) = C2;
    z2 = setdiff(def2,D2,'stable'); % sorting the missing cities
    D2(r+x2+1:x0,:) = z2; % child 2
    
    j=2*z-1;
    Y(:,j) = D1;
    Y(:,j+1) = D2;
end
cross = [pop, Y];