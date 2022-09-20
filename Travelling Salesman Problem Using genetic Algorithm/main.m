clc;
clear all;
close all;

%% Number of cities, population size, and number of generations
% number of cities
prompt = '# of cities='; % please enter number of cities accordingly if importing data
n1 = input(prompt);
% population size
prompt1 = 'pop size=';
n = input(prompt1);
% chromosomes for crossover
prompt2 = 'crossover size=';
c = input(prompt2);
% chromosomes for mutation
prompt3 = 'mutation size=';
m = input(prompt3);
% total generations
prompt4 = '# of generations=';
tg = input(prompt4);

% %% Block of code to import x and y data (uncomment line 22 to 25 for it to work)
% Data(:,1) = 1:n1;
% Data(:,2) = import(); % please give the file location of the x coordinates
% Data(:,3) = import(); % please give the file location of the y coordinates

%% Block of code to randomly generate city coordinates (uncomment line 27 to 33 for it to work)
% data generation
x = randi(n1*10,n1,1);
y = randi(n1*10,n1,1);
Data(:,1) = 1:n1;
Data(:,2) = x;
Data(:,3) = y;

pop = population(n, Data);
for i=1:tg
    pop_c = crossover(pop,c);
    [~, y0] = size(pop_c);
    pop_c(:,y0+1:y0+m) = mutation(pop_c, m);
    fit = fitness(pop_c, Data);
    [pop_new, dist_new] = selection(pop_c, fit, n);
    Best_pop(:,i) = pop_new(:,1);
    Best_dist(:,i) = dist_new(:,1);
end

Min_dist = min(Best_dist); % selecting the minimum distance from the matrix holding the min from each iteration
[~,idxx] = find(Best_dist == min(Best_dist)); % finding the index of the min
pop_min = Best_pop(:,idxx(1)); % selecting the best path
[~, idx] = sort(pop_min);
order = Data(idx,:); % ordering the data according to path

%% Visualization
figure()
plot(order(:,2),order(:,3),'g->');
hold on;
plot(x,y,'r.');
hold on;
for ii = 1:length(x)
    text(x(ii),y(ii),num2str(ii),'Color','b')
end
xlabel('X Coordinate')
ylabel('Y Coordinate')
title('Path of the TSP')

%% Displaying the results
disp('Best path for TSP is:');
path = pop_min';
disp(path);
disp('The distance covered for best path is:');
disp(Min_dist);