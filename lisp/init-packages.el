;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

;; Common Lisp Extension
(require 'cl)

;; 包源配置
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"    .  "http://elpa.emacs-china.org/gnu/")
			   ("melpa"  .  "http://elpa.emacs-china.org/melpa/"))))

;;(add-to-list 'package-archives
;;	     '("melpa"  .  "http://melpa.org/packages"))

;; 包
(defvar yangyang/packages '(
		      ;; 自动补全
		      company
		      ;; 更好的编辑
		      swiper
		      counsel
		      ;; 括号处理
		      smartparens
		      ;; 新建窗口跳转聚焦
		      popwin
		      ;; 区域选择
		      expand-region
		      ;; 编辑多个区域
		      iedit
		      ;; 番茄时间
		      org-pomodoro
		      ;; ag搜索替换
		      helm-ag
		      ;; 窗口移动
		      window-numbering
		      ;; 按键指示
		      which-key
		      ) "Default packages")

(setq package-selected-packages yangyang/packages)

(defun yangyang/packages-installed-p()
  (loop for pkg in yangyang/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (yangyang/packages-installed-p)
  (message "%s" "Refreshing package database ... ")
  (package-refresh-contents)
  (dolist (pkg yangyang/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; ============================================================

;;(concat user-emacs-directory (convert-standard-filename "lisp/"))
;; neotree 设置
(add-to-list 'load-path "~/.emacs.d/elpa/neotree")
(require 'neotree)
;; all-the-icons 设置
(add-to-list 'load-path "~/.emacs.d/elpa/all-the-icons")
(require 'all-the-icons)

;; 括号
(smartparens-global-mode t)

;; 用什么mode打开文件
(setq auto-mode-alist
      (append
       '(("\\.c\\'" . c++-mode))
       '(("\\.h\\'" . c++-mode))
       auto-mode-alist))

;;(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t)

;; 开启全局 company 补全
(global-company-mode t)

;; 设置新窗口聚焦
(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
