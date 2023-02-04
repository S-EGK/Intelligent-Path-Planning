clc;
clear all;
close all;

for i=1:10
    for ii=1:10
        map(ii, i) = i+(ii-1)*(10);
    end
end

obs = [16 18 33 35 39 43 49 64 66 88];

%% pop

s = 1;
P = pop1(s, map);
for tg=1:100
    [S, SS] = sel(P, obs);
    if ~isempty(SS)
        P = cross(SS, S, obs);
    end
    if ~isempty(S)
        [E(:,tg), D(:,tg)] = fitness(S,map);
        E(:, all(~any(E), 1)) = [];
        D(:, all(~any(D), 1)) = [];
    end
    
end
[x,y] = find(D==min(D(1,:)));
MinPath = E(:,y);
MinDist = D(:,y);
