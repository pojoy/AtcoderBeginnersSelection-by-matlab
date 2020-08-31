clear

n = input('');
a = str2num(input('', 's'));

answer = 0;

while mod(a, 2) == 0
    a = a / 2;
    answer = answer + 1;
end

fprintf('%d\n', answer);