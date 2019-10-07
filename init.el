;; 我的emacs配置

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 定义打开配置文件函数
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
