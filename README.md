# AtcoderBiginnersSelection-by-matlab

AtcoderBiginnersSelectionをmatlabでやる

---

## はじめに

このツイートを見ました

https://twitter.com/chokudai/status/1255015433666564096

AtcoderでMATLABが使えるようになったら嬉しいな

---

## AtcoderBiginnersSelectionとは

[AtCoder に登録したら次にやること ～ これだけ解けば十分闘える！過去問精選 10 問 ～](https://qiita.com/drken/items/fd4e5e3630d0f5859067#5-%E9%81%8E%E5%8E%BB%E5%95%8F%E7%B2%BE%E9%81%B8-10-%E5%95%8F)の記事を読んでください。

Atcoderにまとまったページがあります。
https://atcoder.jp/contests/abs/

---

## 入力と出力について

### 入力

> x = input('')\
> str = input('', 's')

を利用します。

Pythonのように ``x = input()``とすると引数不足で怒られます。
空白区切りはstrで取って``split()``します。
数字の空白区切りは``str2num(input('', 's'))``か``str2double(input('','s'))``すると大変楽になると思います。

### 出力

適当に``print()``するとFigureがプリンターから印刷されます。(なければエラー)

> fprintf(formatSpec,A1,...,An)

formatSpecについては[こちら(MathWorks)](https://jp.mathworks.com/help/matlab/ref/fprintf.html#btf8xsy-1_sep_shared-formatSpec)を参照

公式の実装がどうなるか分からないけれどとりあえず``fprintf()``で答えを出すところまでを目指します。

### ；(セミコロン)について

MATLABは文末にセミコロンをつけないと代入やらなんやらが全部出力されます。
ここでは途中の遷移を見るためにすべてではないにしろ**セミコロンをつけない**方針で行きます。(たぶん公式に実装されたら必要になると思う)
