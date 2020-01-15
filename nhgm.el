;;; niposi.el  --- NipponGo Shien
;;日本語文書の作製を支援します。
;;基本的に色を変えるだけです。
;;色が多すぎる場合は単調であったり、饒舌であったり、違和感のある文章になっている可能性があります。
;;参考にした論文
;;http://ci.nii.ac.jp/naid/110003743558

(defun nhgm-mode ()
  "nhgm mode"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'niposi-mode)
  (setq mode-name "nhgm")
  (setq font-lock-defaults '(niposiKeywords))
  (run-hooks 'niposi-mode-hook))

(setq niposiKeywords
      '(
        ("^\* .*" . font-lock-function-name-face);;見出し用
        ("^\*\* .*" . font-lock-type-face);;見出し用
        ("^# .*" . font-lock-function-name-face);;見出し用
        ("^## .*" . font-lock-type-face);;見出し用
	(".*[0-9]$" . font-lock-function-name-face);個人的に使用する読書メモ用
	(".*[0-9]:" . font-lock-string-face);同上
	("れる。\\|れた。" . font-lock-type-face);受け身の文章、あまり使わない。
	("である。\\|" . font-lock-string-face);ありがちな文末その1。
	("だ。\\|" . font-lock-warning-face);ありがちな文末その2。
	("という\\|" . font-lock-warning-face);多用すべきではない
	("ます。\\|です。\\|なる。\\|なのだ。\\|ない。\\|いる。" . font-lock-builtin-face);文末。同じものを続けない。
	("これ\\|ここ\\|この\\|こう\\|こんな\\|それ\\|そこ\\|その\\|そう\\|そんな\\|あれ\\|あそこ\\|あの\\|あんな\\|どれ\\|どこ\\|どの\\|どう\\|どんな\\|よう[にな]\\|もの" . font-lock-builtin-face);指示語、多用しない。
	("なんな\\|" . font-lock-builtin-face);Dovorak配列特有の間違えやすい言葉
	("[てをがには]、" . font-lock-builtin-face);接続
	("例えば\\|しかし\\|けれど\\|だから\\|なるほど\\|ところが\\|だが\\|もっとも\\|ともあれ\\|けど\\|時に\\|気[のがも]\\|ただし\\|こと\\|でもない" . font-lock-variable-name-face);多用しないほうが良い言葉、堅目の表現
	("っぽい\\|それで\\|感じ\\|的\\|というか\\|もちろん\\|そんなわけで\\|思う\\|なって" . font-lock-builtin-face);便利っぽいけど多用しないほうが良い気のする言葉、柔らい表現
	("\\([あ-ん]\\{24,\\}\\)" . font-lock-builtin-face);24文字以上続くひらがな、読みにくい場合が多い。
	("[てをがにはのばで][てをがにはのばで]" . font-lock-builtin-face);てにをはの連続を避ける。
	("\\([てをがにはのばで]\\)\\1" . font-lock-warning-face);ががををにに、など。
	("『@.*』". font-lock-type-face);
        ("^#title: .*" . font-lock-type-face);;見出し用
;	("^\\([一-龠]\\{1,5\\}\\).*\\2.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じ単語が出てくる。きちんと動かない。
;	("^\\([あ-ん]\\{1,5\\}\\).*\\1.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じひらがな単語が出てくる。きちんと動かない。
        )
      )

(provide 'nhgm)
