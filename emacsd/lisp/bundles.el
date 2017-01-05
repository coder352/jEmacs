;==========================================
; Plug 配置
;==========================================
;; 简单来说就是成堆成堆的 (require 'something)
(defun require-extensions (action lst)  ;; 函数讲解见: ./keymap.el
  ""
  (mapcar (lambda(ext) "" (funcall action ext)) lst))
(require-extensions
  'require
  (list
    ; 'tabbar
    ; 'switch-window
    ; 'thing-edit
    ; 'second-sel
    ; 'browse-kill-ring+
    ; 'bbdb
    ; 'gnuplot
    ; 'muse-mode
    ; 'ibuffer
    ; 'w3m-load
    ; 'rect-mark
    ; 'ido
    ; 'multi-term
    ; 'lusty-explorer
    ; 'oddmuse
    ; 'emaci
    ; 'move-text
    ; 'uniquify
    ; 'hide-region
    ))

;;""""""""""
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
	       ;; --- Auto-completion ---
	       company
	       ;; --- Better Editor ---
	       hungry-delete
	       swiper
	       counsel
	       smartparens
	       ;; --- Major Mode ---
	       js2-mode
	       ;; --- Minor Mode ---
	       nodejs-repl
	       exec-path-from-shell
	       ;; --- Themes ---
	       monokai-theme
	       ;; solarized-theme
	       ) "Default packages")

(setq package-selected-packages my/packages)

;; loop for ... in, 它来自 cl 即 Common Lisp 扩展.
;; for, in, collect 均为 cl-loop 中的保留关键字
(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;""""""""""
(require-package 'evil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(provide 'init-evil)
(evil-mode 1)  ; 以上的是设置启动 emacs 载入 evil, 同时默认进入Vim模式
; (setq evil-default-state 'emacs)  ; 这个是打开文件后默认进入 emacs 模式
; 我还要在 emacs 和 vim 模式里面切换 :C-z, 换来换去啊

(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
; C-o 按键调用 vim 功能 (就是临时进入 normal 模式, 然后自动回来)
; 比如, 你要到第一行, 可以使用 emacs 的 M-<, 也可以使用 evil 的 C-o gg
; 其中C-o是进入vim模式 gg是去第一行, 命令之后自动还原emacs模式!
; "hello jrp" 如何删除 "" 里面的内容呢? Emacs 的话, 默认文本对象能力不强, 有了 evil 的拓展 C-o di" 轻轻松松搞定~
; 比如 C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~ 发挥想象力吧

; 下面 4 行是设置使用 C-d 作为 ESC 按键, 这个自己看吧
(define-key evil-insert-state-map (kbd "C-d") 'evil-change-to-previous-state)
(define-key evil-normal-state-map (kbd "C-d") 'evil-force-normal-state)
(define-key evil-replace-state-map (kbd "C-d") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-d") 'evil-exit-visual-state)

; 以下设置时使用 t 作为多剪贴板的起始按键, 比如 tay (不是 "ay哦) tap(就是 "ap啦)~
(define-key evil-normal-state-map "t" 'evil-use-register)

; 注意, 如果有什么 bug 的话, 把这个函数也添加了, evil 作者给的代码, 不知道有没有添加到插件里面去
(defun evil-execute-in-normal-state ()
  "Execute the next command in Normal state. C-o o works in insert-mode"
  (interactive)
  (evil-delay
    '(not
       (memq this-command
             '(evil-execute-in-normal-state
                evil-use-register
                digit-argument
                negative-argument
                universal-argument
                universal-argument-minus
                universal-argument-more
                universal-argument-other-key)))
    `(progn
       (if (evil-insert-state-p)
         (let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
           (evil-change-state prev-state)
           (setq evil-previous-state 'normal))
         (evil-change-to-previous-state))
       (setq evil-move-cursor-back ',evil-move-cursor-back))
    'post-command-hook)
  (setq evil-move-cursor-back nil)
  (evil-normal-state)
  (evil-echo "Switched to Normal state for the next command ..."))
