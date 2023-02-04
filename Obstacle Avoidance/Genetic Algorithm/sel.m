function [S, SS] = sel(P, obs)
[x,y] = size(P);
S = zeros(x,50);
SS = zeros(x,50);
for j=1:y
    if ismember(obs(1), P(:,j)) || ismember(obs(2), P(:,j)) || ismember(obs(3), P(:,j)) || ismember(obs(4), P(:,j)) || ismember(obs(5), P(:,j)) || ismember(obs(6), P(:,j)) || ismember(obs(7), P(:,j)) || ismember(obs(8), P(:,j)) || ismember(obs(9), P(:,j)) || ismember(obs(10), P(:,j))
        SS(:,j) = P(:,j);
    else
        S(:,j) = P(:,j);
    end
end
S(:, all(~any(S), 1)) = [];
SS(:, all(~any(SS), 1)) = [];
end