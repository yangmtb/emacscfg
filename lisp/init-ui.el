;; 界面配置

;; 关闭工具栏，tool-bar-mode 是一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑块控件
(scroll-bar-mode -1)

;; 更改显示字体大小 16pt    10=1pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 120)

;; 设置光标样式
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode t)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

(provide 'init-ui)
