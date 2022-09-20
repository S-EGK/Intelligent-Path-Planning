%% function to perform swap mutation
function mut = mutation(pop, m)
[x1, y1] = size(pop);
Y = zeros(x1,m);
for z = 1:m
   A = pop(:,randi(y1));
   r1 = 1+randi(x1-1,1,2); % selecting random genes for swap mutation
   while r1(1) == r1(2)
       r1 = 1 + randi(x1-1,1,2);
   end
   % swaping the genes
   B = A(r1(1),1);
   A(r1(1),1) = A(r1(2),1);
   A(r1(2),1) = B;
   Y(:,z) = A;
end
mut = Y;