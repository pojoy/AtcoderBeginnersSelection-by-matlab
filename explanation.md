# 解説

## PracticeA - Welcome to AtCoder

```matlab
clear

a = input('')
secondLine = str2num(input('', 's'))
% secondLine = str2double(input('', 's'))
str = input('', 's')

fprintf('%d %s\n', a+sum(secondLine), str)
```

``input('')``では``2/3``や``pi``といった入力も受け付けます。(doubleでの処理になります)

``str2num()``は
> X = str2num(chr) は文字配列または string スカラーを数値行列に変換します。入力には、個別の要素を示すためにスペース、コンマ、セミコロンを使用できます。[Mathworksより](https://jp.mathworks.com/help/matlab/ref/str2num.html:title)

だそうです。

これ以降もMathworksのリンクはたびたび出てくると思います。
MATLABの関数は公式ドキュメントにすべて記されているので、どのような引数が必要か戻り値はどうなっているのかは「matlab 関数名」と検索するとたいてい出てきます。
とても便利なので活用してみてください。

``sum(A)``はAがベクトルであれば総和を計算してくれます。
Aが行列なら各列の和の行ベクトルが帰ってきます。
``sum(matrix, 'all')``とかすると行列の総和が帰ってきます(2018b以降)

## ABC086A - Product

```matlab
clear

inputLine = str2num(input('', 's'))

c = prod(inputLine)

if mod(c, 2) == 0
    fprintf("Even\n")
else
    fprintf("Odd\n")
end
```

``prod()``
はベクトルの要素の積を返してくれます。

``if ~ elseif ~ else ~ end`` は見やすさのためにインデントを入れていますが、MATLABでは必ずしも必要ではありません。

余りは ``mod(a, b)`` で求めます。 ``a % b`` ではできません。
MATLABでは ``%`` はコメントアウトです。
[Mathworksのmodのページ](https://jp.mathworks.com/help/symbolic/mod.html)の詳細に定義があります。

## ABC081A - Placing Marbles

```matlab
clear

str = input('', 's')
fprintf("%d\n", count(str, '1'))
```

``count(str, pattern)`` はstr内のpatternの出現回数を返します。str, patternはともに行列でも大丈夫です。

## ABC081B - Shift only

```matlab
clear

n = input('')
a = str2num(input('', 's'))

answer = 0

while mod(a, 2) == 0
    a = a / 2
    answer = answer + 1
end

fprintf('%d\n', answer)
```

``while ~ end`` はそのままです。whileのあとの文が真であれば継続します。

``mod(a, 2)`` では1×nの行列が戻ってきます。これらの値が0であるかを ``== 0`` で比較し、すべて0であれば真となります。

## ABC087B - Coins

```matlab
clear

a = input('')
b = input('')
c = input('')
x = input('')

answer = 0
matrix = x - (0:a) * 500 + (0:b)' * 100
answer = sum(matrix >= 0 & matrix <= c*50, 'all')
fprintf('%d\n', answer)
```

MATLABでは(0:N)と書くことにより1×(N+1)のベクトルを生成します。またベクトルや行列に``'``をつけることにより転置したものになります。行ベクトルと列ベクトルを ``+`` 演算子で足し合わせると、行列ができあがります。[Mathworksを確認されたし](https://jp.mathworks.com/help/matlab/ref/plus.html)

``matrix >= 0 & matrix <= c*50`` では０か１のlogicalな行列ができます。
0は不適な組み合わせ、1は適当な組み合わせの時に発生するので、この行列の要素の総和が今回の答えとなります。

愚直な実装であると次のようになります。

```matlab
for i = 0:a
    for j = 0:b
        for k = 0:c
            if x == 500*i + 100*j + 50*k
                answer = answer + 1;
            end
        end
    end
end
```

## ABC083B - Some Sums

```matlab
clear

inputLine = str2num(input('', "s"))

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
```

**MATLABでは配列へのアクセスは1から始まります。**

``~=`` は不等価を表します。

## ABC088B - Card Game for Two

```matlab
clear

n = input("")
a = str2num(input("","s"))

b = sort(a,'descend')

aliceScore = sum(b(1:2:n))
bobScore = sum(b(2:2:n))

fprintf("%d\n", aliceScore - bobScore)
```

``sort(A)`` はベクトルAを昇順に並び替えます。
``sort(A,"descend")``にすることで降順にします。

[colon(:)](https://jp.mathworks.com/help/matlab/ref/colon.html)についてはMathworksを参照。``1:2:n`` はつまり ``[1, 3, 5 ..., 2*fix(n/2)]``を表します。
``b(1:2:n)``で奇数番目の要素を抜き出しています。

## ABC085B - Kagami Mochi

```matlab
clear

n = input("");
for i = 1:n
    a(i) = input("");
end

fprintf("%d\n", length(unique(a)))
```

MATLABでは行列の範囲外を指定して要素を挿入することができます。[(Mathworksの行列の作成、連結、および拡張を参照)](https://jp.mathworks.com/help/matlab/math/creating-and-concatenating-matrices.html)
ただし、サイズが大きくなるたびメモリを新しく確保するため、この方法は速度の低下の原因となります。あらかじめ``zeros(1,n)``などでメモリを確保しておくと良いでしょう。

## ABC085C - Otoshidama

```matlab
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
```

この解法ですが、Octaveで実行するとおそらくTLEします。

n = 2000, y = 20000000 とすると、自分のPCでの計測ですが、MATLABで0.085932秒であり、Octaveでは9.70843秒となりました。これではあまりにも差がありすぎるため、MATLABユーザーがOctaveを使っての参加をやめてしまう理由になると思います。

ぜひともMATLABを導入してもらいたいものです。

## ABC049C - 白昼夢

```matlab
clear

s = input("", "s");

s_reverse = reverse(s);

r_elem = reverse(["dream" "dreamer" "erase" "eraser"]);

flg = 1;

while s_reverse
    for e = r_elem
        k = strfind(s_reverse, e);
        if ~isempty(k) && k(1) == 1
            flg=0;
            s_reverse = s_reverse(strlength(e)+1:end);
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
```

``reverse(str)``で文字列を反転します。
``isempty()``は空配列であれば真となります。

## ABC086C - Traveling

```matlab
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
```

``txy(:,i)`` は txyのi列目のすべての要素を指しています。
よって最初のfor文によって``txy``には次のようにデータが入ります。

```matlab
txy =
     0     t1    t2   ...   tn
     0     x1    x2   ...   xn
     0     y1    y2   ...   yn
```
