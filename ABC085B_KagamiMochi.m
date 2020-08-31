clear

n = input("");
for i = 1:n
    a(i) = input("");
end

fprintf("%d\n", length(unique(a)))