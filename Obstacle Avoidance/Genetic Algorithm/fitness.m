function [E, D] = fitness(S,map)
[x0,y0]=size(S);
for i=1:y0
    A = S(:,i);
    B = zeros(size(A));
    for j=1:x0-1
        [x1,y1] = find(map==A(j,1));
        [x2,y2] = find(map==A(j+1,1));
        B(j,1) = sqrt((x2(1)-x1(1))^2+(y2(1)-y1(1))^2);
    end
    F(1,i) = sum(B);
end
[x3,y3] = find(F==min(F));
E = S(:,y3);
D = F(:,y3);
[x4,y4] = size(D);
D(2,:) = zeros(1,y4);
end