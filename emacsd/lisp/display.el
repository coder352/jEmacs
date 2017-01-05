;================================================================
; Display Settings 展示/排版等界面格式设置
;================================================================
;; 启动Emacs自动设置为两个窗口(上下各一个)
; (split-window-vertically)
;; 改变 emacs 标题栏的标题
(setq frame-title-format "%b@vj.org")

;; 修改了一下 ansi-color, 默认颜色里面的深蓝色的目录实在是太刺眼了
(custom-set-variables
  ;; custom-set-variables was added by Custom. If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance. If there is more than one, they won't work right.
  '(ansi-color-faces-vector [default default default italic underline bold bold-italic modeline])
  '(ansi-color-names-vector ["black" "red" "PaleGreen" "yellow" "DodgerBlue1" "magenta" "cyan" "white"]))
;; 窗口位置
(setq initial-frame-alist '((left . 700) (top . 50)))
;; 窗口大小设置
(custom-set-faces
  ;; custom-set-faces was added by Custom. If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance. If there is more than one, they won't work right.
  '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
;; 由于 GNU Emacs 23以后基本都在 daemon方式下工作, 如果直接使用原来那种方式设置中文字体的话, 在 emacsclient中是无效的
;; 所以要把它加到 make-frame 的hook里面. 这样每次 emacsclient -c 生成的 frame就都是指定的中文字体了
;; 当然这下面这个函数还有一个缺陷, 就是如果不是使用 daemon 方式的话…… 你懂得, 鱼和熊掌, 不可兼得
(add-hook 'after-make-frame-functions
          (lambda(arg)
            (if  (>= (length (frame-list)) 1)
              (set-fontset-font  "fontset-startup" 'chinese-gbk (font-spec :family "文泉驿微米黑") nil 'prepend))
            ) t
          )

;; 鼠标 和 光标 颜色设置为白色
(set-cursor-color "white")
(set-mouse-color "white")
(global-hl-line-mode 1)  ;; 高亮当前行

;; 设置背景颜色和字体颜色
(set-foreground-color "white")
(set-background-color "darkblue")

;; 设置另外一些颜色: 语法高亮显示的背景和主题, 区域选择的背景和主题, 二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;; 设置日历的一些颜色
(setq
  calendar-load-hook
  '(lambda ()
     (set-face-foreground 'diary-face "skyblue")
     (set-face-background 'holiday-face "slate blue")
     (set-face-foreground 'holiday-face "white")))

;; 去掉工具栏
(tool-bar-mode -1)  ; (tool-bar-mode nil)
;; 去掉菜单栏, F10 绑定为显示菜单栏, 万一什么东西忘了, 需要菜单栏了可以摁 F10 调出, 再摁F10就去掉菜单
(menu-bar-mode -1)  ; (menu-bar-mode nil)
;; a list of matching commands is echoed there so you can see how to complete a command
(icomplete-mode 1)
;; 不要滚动栏, 现在都用滚轴鼠标了, 可以不用滚动栏了
(scroll-bar-mode -1)  ; (scroll-bar-mode nil)
;; displays a ruler at the top of the window. The ruler doesn’t measure inches or centimeters; it measures columns, changing its scale with the font size.
(ruler-mode -1)
;; 设置行号
(global-linum-mode t)
(setq linum-format "%d ")
; (setenv "PATH"
;     (concat
;     "d:/program files/codeblocks/mingw/bin" ";"
;      (getenv "PATH")))
;; 设置 Tab
(setq-default indent-tabs-mode  -1)
(setq tab-width 4
      c-basic-offset 4)
