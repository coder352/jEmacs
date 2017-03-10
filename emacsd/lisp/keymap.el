;==========================================
; Keymap 键盘快捷键映射
;==========================================
;; 下面这句话会再次引入 .emacs.d/init.el, 报错
;; (global-set-key (kbd "<f2>") (load-file "~/.emacs.d/init.el"))

;; 通常我们定义 key einding 的时候都是使用 (global-set-key (kbd "C-c x) 'some-function)
;; 问题是 global-set-key 没有像 setq 那么方便的 list 处理方式, 自己写一个 set-key-bindings
(defun set-key-bindings (action bindingList)
  ""
  (mapcar
    (lambda(lst)
      ""
      (let ((x (car lst))
            (y (car (last lst))))
        (funcall action x y))) bindingList ))
;; set-key-bindings 接收一个函数作为指令, 告诉它需要做什么, 然后接收一个 list 作为数据, 通过 mapcar 遍历这个 list, 对每个元素执行接受到的指令
;; Lisp 不仅仅能够处理 list, 更重要的是它能够像传递数据一样简单方便的传递指令(函数)
;; 这里只是简单的示范一下, 我还是喜欢用 global-set-key
(set-key-bindings
  'global-set-key
  (list
    '([f2]                            calendar)  ; 日历
    '([(shift f2)]                    remember)
    '([f5]                            revert-buffer)
    '([f10]                           rename-buffer)
    '([f11]                           query-replace)
    '([(shift f11)]                   query-replace-regexp)

    ;; copy paste operations
    ; (list (kbd "C-=")                 'set-mark-command)
    ; (list (kbd "C-c l")               'copy-line)
    ; (list (kbd "C-c w")               'copy-word)
    ; (list (kbd "C-S-k")               (lambda()  " " (interactive) (kill-visual-line -1)))
    ; (list (kbd "C-c s")               'thing-copy-string-to-mark)
    ; (list (kbd "C-c a")               'thing-copy-parenthesis-to-mark)
    ; (list (kbd "C-c p")               'copy-paragraph)
    ; (list (kbd "C-x a d")             'delete-region)

    ;         ... ... ... ... 按键太多，中间省略
    ; (list (kbd "C-c c")               '(lambda() " " (interactive) (if emaci-mode  (emaci-mode-off) (emaci-mode-on))))
    ; (list
    ;   (kbd "M-DEL")
    ;   (lambda(&optional arg)
    ;     "Act as the obsolete dove-backward-kill-word "
    ;     (interactive "P")
    ;     (if arg
    ;       (let ((arg (- 0 arg))) (dove-forward-kill-word arg))
    ;       (dove-forward-kill-word -1))))
    ;
    ))
