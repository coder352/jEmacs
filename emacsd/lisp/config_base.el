;;================================================================
;; General Settings 基础设置
;;================================================================
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))  ;; 开启默认全屏
(setq make-backup-files nil)  ;; 取消自动保存文件, 在 git 面前显得很渺小
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setenv "EMACSSHELL" shell-file-name)

(delete-selection-mode 1)  ;; 当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字

;; 使用下面的配置来加入最近打开过文件的选项让我们更快捷的在图形界面的菜单中打开最近 编辑过的文件
;; require 的意思为从文件中加载特性
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 时间戳设置 (time-stamp), 设定文档上次保存的信息
;; 只要里在你得文档里有 Time-stamp: 的设置, 就会自动保存时间戳
;; 启用 time-stamp
(setq time-stamp-active t)
;; 去掉time-stamp的警告?
(setq time-stamp-warn-inactive t)
;; 设置time-stamp的格式, 我如下的格式所得的一个例子:
(setq time-stamp-format "%:u %02m/%02d/%04y %02H02M02S")
;; 将修改时间戳添加到保存文件的动作里.
(add-hook 'write-file-hooks 'time-stamp)

;; 备份设置
;; emacs 还有一个自动保存功能, 默认在 ~/.emacs.d/auto-save-list 里, 这个非常有用, 我这里没有改动,
;; 具体可以参见 Sams teach yourself emacs in 24hours (我简称为 sams24)
(setq auto-save-default nil)
;; 启用版本控制, 即可以备份多次
(setq version-control t)
;; 备份最原始的版本两次, 记第一次编辑前的文档, 和第二次编辑前的文档
(setq kept-old-versions 2)
;; 备份最新的版本五次, 理解同上
(setq kept-new-versions 5)
;; 删掉不属于以上 7 中版本的版本
(setq delete-old-versions t)
;; 设置备份文件的路径
(setq backup-directory-alist '(("." . "~/.emacs.tmp")))
;; 备份设置方法, 直接拷贝
(setq backup-by-copying t)

;; 自动补全功能, 这事从王垠的网站直接Copy过来的, 引用一些他对此的说明
;; 你可以设置以下 hippie-expand 的补全方式. 它是一个优先列表,  hippie-expand 会优先使用表最前面的函数来补全
;; 这是说, 首先使用当前的 buffer 补全, 如果找不到, 就到别的可见的窗口里寻找, 如果还找不到, 那么到所有打开的buffer去找,
;; 如果还……那么到kill-ring里, 到文件名, 到简称列表里, 到list, …… 当前使用的匹配方式会在 echo 区域显示.
;; 特别有意思的是 try-expand-line, 它可以帮你补全整整一行文字. 我很多时后有两行文字大致相同, 只有几个字不一样, 但是我懒得去拷贝粘贴以下.
;; 那么我就输入这行文字的前面几个字. 然后多按几下 M-/ 就能得到那一行.
(global-set-key [(meta ?/)] 'hippie-expand)
(setq
  hippie-expand-try-functions-list
  '(try-expand-line
     try-expand-line-all-buffers
     try-expand-list
     try-expand-list-all-buffers
     try-expand-dabbrev
     try-expand-dabbrev-visible
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-complete-file-name
     try-complete-file-name-partially
     try-complete-lisp-symbol
     try-complete-lisp-symbol-partially
     try-expand-whole-kill))

;; 时间显示设置
;; 启用时间显示设置, 在 minibuffer 上面的那个杠上 (忘了叫什么来着)
(display-time-mode 1)
;; 时间使用24小时制
(setq display-time-24hr-format 1)
;; 时间显示包括日期和具体时f
(setq display-time-day-and-date t)
;; 时间栏旁边启用邮件设置
(setq display-time-use-mail-icon t)
;; 时间的变化频率, 单位多少来着?
(setq display-time-interval 10)

(minibuffer-electric-default-mode 1)
;; 启用部分补全功能, 如输入M-x q r r 相当于M-x query-replace-regexp
; (partial-completion-mode 1)
;; 在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;; 所有的问题用 y/n 方式, 不用yes/no方式. 有点懒, 只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)
;; 允许 minibuffer 自由变化其大小 (指宽度)
(setq resize-mini-windows t)
;; 当寻找一个同名的文件, 自动关联上那个文件?
(setq uniquify-buffer-name-style 'forward)
;; 在 emacs 读 man 文档时, 使用当前 buffer
(setq Man-notify-method 'pushy)
;; 鼠标自动避开指针, 如当你输入的时候, 指针到了鼠标的位置, 鼠标有点挡住视线了
(mouse-avoidance-mode 'animate)
;; 允许自动打开图片, 如 wiki 里面
(auto-image-file-mode)
;; 可以操作压缩文档
(auto-compression-mode 1)
;; 在minibuffer上面可以显示列号
(column-number-mode t)
;; 显示默认的文档的宽度, 看起来比较舒服?
(setq default-fill-column 60)
;; 指针不要闪, 我得眼睛花了
(blink-cursor-mode -1)
(transient-mark-mode 1)
;; 当指针到一个括号时, 自动显示所匹配的另一个括号
(show-paren-mode 1)
;; 是用滚轴鼠标
(mouse-wheel-mode t)
;; 去掉烦人的警告铃声
(setq visible-bell nil)
;; 滚动页面时比较舒服, 不要整页的滚动
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;; 设定句子结尾, 主要是针对中文设置
(setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space -1)
;; 去掉 Emacs 和 gnus 启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
;; 当指针移到另一行, 不要新增这一行? d
(setq next-line-add-newlines -1)
;; 在文档最后自动插入空白一行, 好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)
;; 使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
;; 设定删除保存记录为 200, 可以方便以后无限恢复
(setq kill-ring-max 200)
;; 增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)
;; 是用 aspell 程序作为 Emacs 的拼写检查成学
(setq-default ispell-program-name "aspell")
;; 使用 narrow 功能时的一个设置
(put 'narrow-to-region 'disabled nil)
;; 允许 emacs 和外部其他程序的粘贴
(setq x-select-enable-clipboard t)
