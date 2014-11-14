# より良い日本語文書作製支援ツール niposi.el です。

## はじめに

日本語文書の作製を支援するためのツールです。

プログラムはよく分かっていませんから、当てずっぽうで作っています。

## 設定方法
パスが通った場所に niposi.el を置き、次の設定を反映させる。

(require 'niposi)
(add-hook 'text-mode-hook
          '(lambda () (niposi-mode t)))

テキストファイルを開くと niposi が動きます。

## 使い方
1.ロードしたらテキストファイルを書く
2.自然に色が付くので、普通に書く
3.色が多すぎる場合は再確認する
4.直したい場所は修正する

色はあんまり気にしないのがポイントで、あくまで普通に文章を書いてください。色が多すぎる場所を認時に、違和感がある場合のみ修正します。

邪魔にならないよう、色は地味にしてあります。表示がうるさくないため、常時オンで書くことが出来ると思います。

# + 空白文字と ## + 空白で、文字の色が付き、見出しとして使用することができます。

日本語の表記ゆれや誤字の指摘などはしません。

## 考え方
そのうち書きます。


