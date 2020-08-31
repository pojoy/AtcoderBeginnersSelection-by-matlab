clear

inputLine = str2num(input('', 's'));

n = inputLine(1);
y = inputLine(2);

answer = [-1 -1 -1];

for i=0:n
    for j=0:n-i
        if y == 10000*i+5000*j+1000*(n-i-j)
            answer = [i, j, n-i-j];
        end
    end
end

fprintf("%d %d %d\n", answer)