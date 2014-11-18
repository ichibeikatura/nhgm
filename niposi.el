;;; niposi.el  --- NipponGo Shien
;;日本語文書の作製を支援します。
;;基本的に色を変えるだけです。
;;色が多すぎる場合は単調であったり、饒舌であったり、違和感のある文章になっている可能性がある。
;;http://svn.coderepos.org/share/lang/elisp/taskpaper/trunk/taskpaper.el からもコピペ
;;参考にした論文
;;http://ci.nii.ac.jp/naid/110003743558
;;最小のtodo機能追加した
;;"* " の場所で \C-c\C-d で終った表示に出来る。
;;テキストファイルを書いている途中にタスク書いて使う。
;;\C-c\C-d だけ覚えれば良いのでラク

(defvar niposi-mode-map (make-keymap)
  "*Keymap for Niposi major mode")

(define-key niposi-mode-map "\C-c\C-d" 'niposi-toggle-task)

(defun niposi-toggle-task ()
  "Marks task as done"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (when (looking-at "[✓*]")
      (let ((mark (if (equal (match-string 0) "*") "✓" "*")))
        (delete-char 1)
        (insert mark)))))

(setq niposiKeywords
      '(
        ("^\* .*" . font-lock-function-name-face);;見出し用
        ("^\*\* .*" . font-lock-type-face);;見出し用
	(".*[0-9]$" . font-lock-function-name-face);個人的に使用する読書メモ用
	(".*[0-9]:" . font-lock-string-face);同上
	("れる。\\|れた。" . font-lock-type-face);受け身の文章、あまり使わない。
	("ます。\\|です。\\|だ。\\|なる。\\|なのだ。\\|である。\\|ない。\\|いる。" . font-lock-builtin-face);文末。同じものを続けない。
	("これ\\|ここ\\|この\\|こう\\|こんな\\|それ\\|そこ\\|その\\|そう\\|そんな\\|あれ\\|あそこ\\|あの\\|あんな\\|どれ\\|どこ\\|どの\\|どう\\|どんな\\|よう[にな]\\|もの" . font-lock-builtin-face);指示語、多用しない。
	("[てをがには]、" . font-lock-builtin-face);接続
	("例えば\\|しかし\\|けれど\\|だが\\|もっとも\\|ともあれ\\|けど\\|時に\\|気[のがも]\\|ただし\\|こと\\|でもない" . font-lock-variable-name-face);便利っぽいけど多用しないほうが良い気のする言葉、堅いの
	("っぽい\\|それで\\|感じ\\|的\\|というか\\|もちろん\\|そんなわけで\\|思う" . font-lock-builtin-face);便利っぽいけど多用しないほうが良い気のする言葉、柔らかいの;	
	("\\([あ-ん]\\{24,\\}\\)" . font-lock-builtin-face);24文字以上続くひらがな、読みにくい場合が多い。
	("[てをがにはのば][てをがにはのば]" . font-lock-builtin-face);てにをはの連続、コピペ多用すると間違えやすい。
	("\\([てをがにはのば]\\)\\1" . font-lock-warning-face);ががををにに、など。ほぼ間違いなので強調表示。
	("✓.*". font-lock-type-face);todo用、終り
;	("^\\([一-龠]\\{1,5\\}\\).*\\2.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じ単語が出てくる。きちんと動かない。
;	("^\\([あ-ん]\\{1,5\\}\\).*\\1.*[あ-ん]\\|。^\\[。\\]" . font-lock-builtin-face);一文に同じひらがな単語が出てくる。きちんと動かない。
        )
      )

(defun niposi-mode ()
  "niposi mode"
  (interactive)
  (kill-all-local-variables)
  (setq major-mode 'niposi-mode)
  (setq mode-name "niposi")
  (setq font-lock-defaults '(niposiKeywords))
  (use-local-map niposi-mode-map)
  (run-hooks 'niposi-mode-hook))

(provide 'niposi)
