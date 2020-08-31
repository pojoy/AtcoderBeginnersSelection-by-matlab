clear

s = input("", "s");
r_elem = ["dream" "dreamer" "erase" "eraser"];
r_len = [5 7 5 6];

s_length = strlength(s);

pos = s_length;
flg = 1;

while pos
    for e = 1:4
        if strcmp(r_elem(e), ...
                extractBetween(s, max(1, pos - r_len(e)+1), pos))
            flg = 0;
            pos = pos-r_len(e);
            break
        end
    end
    
    if flg
        fprintf("NO\n")
        return
    else
        flg = 1;
    end
end
fprintf("YES\n")