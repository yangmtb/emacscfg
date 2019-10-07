(require 'org)

;; 设置默认 org agenda 文件目录
(setq org-agenda-files '("~/.emacs/org"))

;; 添加org-mode文本内语法高亮
(setq org-src-fontify-natively t)

(provide 'init-org)
