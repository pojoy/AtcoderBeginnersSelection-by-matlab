clear

n = input("");

txy = zeros(3,n+1);

for i = 2:n+1
    txy(:,i) = str2num(input("", 's'));
end

for i = 2:n+1
    diff_t = txy(1,i) - txy(1,i-1);
    distance = sum(abs(txy(2:3,i)-txy(2:3,i-1)));
    if mod(distance - diff_t, 2) || (diff_t < distance)
        fprintf("No")
        return
    end
end

fprintf("Yes")