;;; niposi.el  --- NipponGo Shien
;;日本語文書の作製を支援します。
;;基本的に色を変えるだけです。
;;色が多すぎる場合は単調であったり、饒舌であったり、違和感のある文章になっている可能性がある。
;;雛形は下からコピペ
;;http://www.kogu.ch/2007/02/24/emacs-lisp-マイナーモードの作り方
;; http://svn.coderepos.org/share/lang/elisp/taskpaper/trunk/taskpaper.el からもコピペ
;;多少参考にした論文
;;http://ci.nii.ac.jp/naid/110003743558

(setq niposiKeywords
      '(
        ("^\* .*" . font-lock-function-name-face);;見出し用
        ("^\*\* .*" . font-lock-type-face);;見出し用
	(".*[0-9]$" . font-lock-function-name-face);個人的に使用する読書メモ用
	(".*[0-9]:" . font-lock-string-face);同上
	("れる。\\|れた。" . font-lock-type-face);受け身の文章、あまり使わない。
	("ます。\\|です。\\|だ。\\|なる。\\|なのだ。\\|である。\\|ない。\\|いる。" . font-lock-builtin-face);文末。同じものを続けない。
	("これ\\|ここ\\|この\\|こう\\|こんな\\|それ\\|そこ\\|その\\|そう\\|そんな\\|あれ\\|あそこ\\|あの\\|あんな\\|どれ\\|どこ\\|どの\\|どう\\|どんな\\|よう[にな]\\|もの" . font-lock-builtin-face);指示語、多用しない。
	("[てをがには]、" . font-lock-builtin-face);接続
	("例えば\\|しかし\\|けれど\\|だが\\|もっとも\\|ともあれ\\|けど\\|時に\\|気[のがも]\\|ただし\\|こと" . font-lock-variable-name-face);便利っぽいけど多用しないほうが良い気のする言葉、堅いの
	("っぽい\\|それで\\|感じ\\|的\\|というか\\|もちろん\\|そんなわけで\\|思う" . font-lock-builtin-face);便利っぽいけど多用しないほうが良い気のする言葉、柔らかいの;	
	("\\([あ-ん]\\{24,\\}\\)" . font-lock-builtin-face);24文字以上続くひらがな、読みにくい場合が多い。
	("[てをがにはのば][てをがにはのば]" . font-lock-builtin-face);てにをはの連続、コピペ多用すると間違えやすい。
	("\\([てをがにはのば]\\)\\1" . font-lock-warning-face);ががををにに、など。ほぼ間違いなので強調表示。
;	("^\\([一-龠]\\{1,5\\}\\).*\\2.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じ単語が出てくる。きちんと動かない。
;	("^\\([あ-ん]\\{1,5\\}\\).*\\1.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じひらがな単語が出てくる。きちんと動かない。
        )
      )

(defun niposi-mode ()
  "niposi mode"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'niposi-mode)
  (setq mode-name "niposi")
  (setq font-lock-defaults '(niposiKeywords))
  (run-hooks 'niposi-mode-hook))

(provide 'niposi)
