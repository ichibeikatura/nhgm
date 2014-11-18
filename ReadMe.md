# より良い日本語文書作製支援ツール niposi.el です。

## はじめに

日本語文書の作製を支援するためのツールです。

プログラムはよく分かっていませんから、当てずっぽうで作っています。

## 設定方法
パスが通った場所に niposi.el を置き、次の設定を反映させる。

(require 'niposi)</br>
(setq auto-mode-alist
       (append '((".*\.txt$" . niposi-mode))
           auto-mode-alist))

テキストファイルを開くと niposi が動きます。

## 使い方

+ ロードしたらテキストファイルを書く
+ 自然に色が付くので、普通に書く
+ 色が多すぎる場合は再確認する
+ 直したい場所は修正する

この様な表示になります。
![niposiの表示1](http://bmimg.nicovideo.jp/image/ch2559888/86943/b3906ab04ba20092fd6a2b6c4b749d802f139dd0.png)

![niposiの表示2](http://bmimg.nicovideo.jp/image/ch2559888/86942/38896452ea152cc62d104553b6b1a248cd3782c1.png)

色はあんまり気にしないのがポイントで、あくまで普通に文章を書いてください。色が多すぎる場所を認時に、違和感がある場合のみ修正します。

邪魔にならないよう、色は地味にしてあります。表示がうるさくないため、常時オンで書くことが出来ると思います。

\* + 空白文字と \*\* + 空白で、文字の色が付き、見出しとして使用することができます。
\* のある場所で C-c C-d を押すと \* が ✓ に変わります。
テキストファイル内で最小の todo として使用することが出来ます。

日本語の表記ゆれや誤字の指摘などはしません。

## 考え方

考え方の基本は次の三点です。

- 文末で文章の印象が大きく変わる
- 助詞周辺に重要な言葉が置かれやすい
- 手書きとコンピュータを使った文書の作製は間違える場所が違う

少しだけ解説すると、同じ文末が続くと単調な文章になってしまうため、色を変えて指摘します。ちなみに全ての語尾は網羅していません。色が変化する語尾と、変化しない語尾のバランスを良くすると、自然になめらかな文章になります。

助詞というのは文章の要ですから、こちらも着色します。色が変り助詞周辺が目に入ることによって、効率良く文章の微調整が可能となります。

あと次の論文から反映できる部分は反映しています。

http://ci.nii.ac.jp/naid/110003743558

その他、多用されると違和感のある表現、コンピュータ特有のミスなども色を変えて表示します。

次になにもできないという機能についてです。

誤字の指摘や、より良い文章のアドバイスという機能はすでにありますが、表示が押し付けがましかったり、操作が面倒だったりする場合がほとんどです。このツールの場合は、書くという事に集中したい時には、自由に無視することができます。書いている途中で使いたくなれば、意識するだけで使えます。

さらに言いますと、あえて違和感のある表現をしたい場合には、押し付けがましいツールは邪魔でしかありません。このツールは色を変えるだけですから、違和感のある表現を書く際には、ガイドラインとして使用することすら可能です。


## ToDo
+さっぱり意味が分からないから誰かに全般的に書き直してもらう
+外部辞書的なものを読み込みポイントを追加できるように誰かに機能追加してもらう

