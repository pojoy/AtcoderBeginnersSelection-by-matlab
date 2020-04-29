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

``input('')``
ではコマンドウィンドウから入力を取ります。
``2/3``や``pi``といった入力も受け付けます。(doubleでの処理になります)

``str2num()``
は
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

``if ~ elseif ~ else ~ end``
は見やすさのためにインデントを入れていますが、MATLABでは必ずしも必要ではありません。

余りは ``mod(a, b)`` で求めます。 ``a % b`` ではできません。
MATLABでは ``%`` はコメントアウトです。
[Mathworksのmodのページ](https://jp.mathworks.com/help/symbolic/mod.html)の詳細に定義があります。

## ABC081A - Placing Marbles

```matlab
clear

str = input('', 's')
fprintf("%d\n", count(str, '1'))
```

``count(str, pattern)`` はstr内のpatternの出現回数を返します。
str, patternはともに行列でも大丈夫です。

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

``mod(a, 2)`` では1×nの行列が戻ってきます。
これらの値が0であるかを ``== 0`` で比較し、すべて0であれば真となります。

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

MATLABでは(0:N)と書くことにより1×(N+1)のベクトルを生成します。
またベクトルや行列に``'``をつけることにより転置したものになります。

行ベクトルと列ベクトルを ``+`` 演算子で足し合わせると、行列ができあがります。[Mathworksを確認されたし](https://jp.mathworks.com/help/matlab/ref/plus.html)

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

