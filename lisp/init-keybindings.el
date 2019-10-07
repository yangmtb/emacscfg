;; 快捷键设置

(global-set-key "\C-s" 'swiper)

;; 绑定打开配置文件到按键F12上
(global-set-key (kbd "<f12>") 'open-init-file)

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 设置缩进按键
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 设置 hippie 补全按键
(global-set-key (kbd "s-/") 'hippie-expand)

;;(require 'expand-region)

;; 设置区域选中按键
(global-set-key (kbd "C-=") 'er/expand-region)

;; 同时编辑多个区域
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 全项目搜索
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; 开关树
(global-set-key [f8] 'neotree-toggle)

(provide 'init-keybindings)
