%% function to select new population set
function [pop_new, dist_new] = selection(pop, fit, n)
[~, c1] = find(fit == max(fit));
Y1(:,1) = pop(:,max(c1));
Fn(1,1) = 1/fit(1,max(c1));
% Totatl fitness of the population
C = sum(fit);
% Selection probability
D = fit/C;
% Cumulatice probability
E = cumsum(D);
% Generate a vector with random normalized value
N = rand(1);
d1 = 1;
d2 = 1;
while d2 <= n-1
    if N <= E(d1)
        Y1(:,d2+1) = pop(:,d1);
        Fn(1,d2+1) = 1/fit(1,d1);
        N=rand(1);
        d2 = d2 + 1;
        d1 = 1;
    else
        d1 = d1+1;
    end
end
pop_new = Y1;
dist_new = Fn;