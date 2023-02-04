function p = pop(s,map)
p(1,:) = s;
i = 2;
while s ~= 100
            [x, y] = find(map == s);
            a = randi(4);
            if a == 1
                x1 = x+1;
                y1 = y;
            elseif a == 2
                    x1 = x-1;
                    y1 = y;
            elseif a == 3
                    x1 = x;
                    y1 = y+1;
            else
                x1 = x;
                y1 = y-1;
            end
            if x1==0 || x1==11
                x1 = x;
            end
            if y1==0 || y1==11
                y1 = y;
            end
            s = map(x1,y1);
            p(i,:) = s;
            i = i+1;
end
end