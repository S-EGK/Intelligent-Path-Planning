function CC = cross(SS, S, obs)
[~, y] = size(obs);
[x0, y0] = size(SS);
for i=1:y0
    A = SS(:,i);
    a = randi(y);
    b = obs(10);
    [x2, y2] = find(A==b);
    if isempty(x2)
        a = randi(y);
        b1 = obs(9);
        [x2, y2] = find(A==b1);
        if isempty(x2)
            a = randi(y);
            b2 = obs(8);
            [x2, y2] = find(A==b2);
            if isempty(x2)
                a = randi(y);
                b3 = obs(7);
                [x2, y2] = find(A==b3);
                if isempty(x2)
                    a = randi(y);
                    b4 = obs(6);
                    [x2, y2] = find(A==b4);
                    if isempty(x2)
                        a = randi(y);
                        b5 = obs(5);
                        [x2, y2] = find(A==b5);
                        if isempty(x2)
                            b6 = obs(4);
                            [x2, y2] = find(A==b6);
                            if isempty(x2)
                                b7 = obs(3);
                                [x2, y2] = find(A==b7);
                                if isempty(x2)
                                    b8 = obs(2);
                                    [x2, y2] = find(A==b8);
                                    if isempty(x2)
                                        b9 = obs(1);
                                        [x2, y2] = find(A==b9);
                                    end
                                end
                            end
                        end
                    end
                        
                end
            end
        end
    end
    c = A(x2-1,y2);
    a1 = randi(y0);
    B =SS(:,a1);
    cc = c(1,1);
    [x4, ~] = find(B==cc);
    A1 = A(1:x2(1)-1,y2(1));
    [x5, y5] = size(A1);
    B1 = B(x4+1:x0,1);
    [x6, ~] = size(B1);
    C1(1:x5,y5)=A1;
    C1(x5+1:x5+x6,y5)=B1;
    [x7, ~] = size(C1);
    if x7<x0
        C1(x7+1:x0,:) = 0;
        C(:,i) = C1;
    else
    C2 = C1(1:x0,1);
    C(:,i) = C2;
    end
end
[~,y8] = size(C);
[~,y9] = size(S);
CC(:,1:y9) = S;
CC(:,y9+1:y9+y8) = C;
end