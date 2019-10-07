;; 配置默认值

;; 关闭出错时警告音
(setq ring-bell-function 'ignore)

;; 显示行号，列号
;; TODO 要改到分文件类型大小判断是否显示
(global-linum-mode 1)
;;(setq column-number-mode t)

;; 自动加载外部修改的文件
(global-auto-revert-mode t)

;; 缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8yy" "yangyang")
					    ))

;; 禁止生成备份文件
(setq make-backup-files nil)

;; 禁止自动保存
(setq auto-save-default nil)

;; 括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 编辑时删除选中文字
(delete-selection-mode 1)

;; 缩进
(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (regin-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; 设置 y-yes n-no
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置目录递归操作
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; 重用唯一缓冲区作为目录mode显示专用缓冲区
(put 'dired-find-alternate-file 'disable nil)
;; 主动加载
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)

(setq dired-dwin-target t)

;; 不补全'
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; 高亮括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; 隐藏换行符
(defun hidden-dos-eol()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))
;; 删除换行符
(defun remove-dos-eol()
  "Replace DOS eolns CR LF with Unix eolns CR."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 设置默认语言
(set-language-environment "UTF-8")

;; 开启窗口号
(window-numbering-mode t)

;; 开启按键指示
(which-key-mode t)

;; neotree 主题
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; 显示时间
(display-time-mode t)
;; 24小时制
(setq display-time-24hr-format t)
;; 显示日期
(setq display-time-day-and-date t)
;; 启用邮件设置
;;(setq display-time-use-mail-icon t)
;; 时间变化频率，默认60
;;(setq display-time-interval 60)

;; 设置tab宽度
(setq-default tab-width 4)
;; 设置用空格填充tab,默认是t？
;;(setq indent-tabs-mode t)
(setq c-basic-offset 4)

;; 打开ido支持
(ido-mode t)

;; 最大粘贴缓冲条目
(setq kill-ring-max 222)

;; 防止页面滚动时跳动
(setq scroll-margin 5)

(provide 'init-better-defaults)
