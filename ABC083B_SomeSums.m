clear

inputLine = str2num(input('', "s"));

answer = 0;
for i = 1:inputLine(1)
    temp = i;
    ref = 0;
    while temp ~= 0
        ref = ref + mod(temp, 10);
        temp = floor(temp/10);
    end
    if inputLine(2) <= ref & ref <= inputLine(3)
        answer = answer + i;
    end
end

fprintf("%d\n", answer)