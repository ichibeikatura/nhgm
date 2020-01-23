# 日本語文書作製支援ツールです

## はじめに

nhgm.el は日本語文書の作製を支援するためのツールです。次の3点を実現するために色で警告します。

- 語尾の重複を避ける
- 受け身の多用を避ける
- 指示語の多用を避ける

日本語の表記ゆれや誤字の指摘などはしません。

## 設定方法

パスが通った場所に nhgm.el を置き、次の設定を反映させる。
```
(require 'nhgm)
(setq auto-mode-alist
       (append '((".*\.txt$" . niposi-mode))
           auto-mode-alist))
```
テキストファイルを開くと nhgm.el が動きます。

## 使い方

+ なにかを書く
+ 自然に色が付く
+ 色が多すぎる場合は確認する
+ 直したい場所を修正する

この様な表示になります。
![niposiの表示1](http://bmimg.nicovideo.jp/image/ch2559888/86943/b3906ab04ba20092fd6a2b6c4b749d802f139dd0.png)

![niposiの表示2](http://bmimg.nicovideo.jp/image/ch2559888/86942/38896452ea152cc62d104553b6b1a248cd3782c1.png)

\# + 空白文字と \#\# + 空白で、文字の色が付き、見出しとして使用することができます。


## 考え方

次の三点に着目して作られています。

- 文末で文章の印象が大きく変わる
- 助詞周辺に重要な言葉が置かれやすい
- 手書きとコンピュータを使った文書の作製は間違える場所が違う

同じ文末が続くと単調な文章になってしまうため、色を変えて指摘します。あえて全ての語尾は網羅していません。色が変化する語尾と、変化しない語尾のバランスを良くすると、自然になめらかな文章になるからです。

助詞というのは文章の要ですから、こちらも着色します。色が変り助詞周辺が目に入ることによって、効率良く文章の微調整が可能となります。その他、多用されると違和感のある表現、コンピュータ特有のミスなども色を変えて表示します。

作製にあたって、参考にした論文は次のものです。

http://ci.nii.ac.jp/naid/110003743558

このツールの特徴は、なにしないことです。誤字の指摘を見ることは、書くという行為とは別の要素です。このツールは書く事に集中したい際には、自由に無視することができます。書いている途中で使いたくなれば、色を意識するだけで使えます。また、あえて違和感のある表現をしたい場合には、押し付けがましいツールは邪魔でしかありません。このツールは色を変えるだけですから、違和感のある表現を書くために使用することも可能です。

この考え方を利用して別のツールを作ってもらってもかまいません。
