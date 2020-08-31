clear

a = input('');
b = input('');
c = input('');
x = input('');

% 全探索
answer = 0;
for i = 0:a
    for j = 0:b
        for k = 0:c
            if x == 500*i + 100*j + 50*k
                answer = answer + 1;
            end
        end
    end
end
fprintf('%d\n', answer)

% MATLAB
answer = 0;
matrix = x - (0:a) * 500 - (0:b)' * 100;
answer = sum(matrix >= 0 & matrix <= c*50, 'all');
fprintf('%d\n', answer)
