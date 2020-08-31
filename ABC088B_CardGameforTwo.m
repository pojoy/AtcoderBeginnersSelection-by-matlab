clear

n = input("");
a = str2num(input("","s"));

b = sort(a,'descend');

aliceScore = sum(b(1:2:n));
bobScore = sum(b(2:2:n));

fprintf("%d\n", aliceScore - bobScore)