clear

inputLine = str2num(input('', 's'));

c = prod(inputLine);

if mod(c, 2) == 0
    fprintf("Even\n")
else
    fprintf("Odd\n")
end
