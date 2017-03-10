;==========================================
; Author:  coder352
; Version: 1.0
; Email: 352111644@qq.com
; BlogPost: http://blog.csdn.net/u014015972
; ReadMe: README.md
; Last_modify: 2016.12
; Sections:
;       -> General Settings 基础设置
;           -> Leader配置
;           -> 文件类型识别与对应插件加载
;           -> 语法高亮
;           -> 基础功能
;           -> 文件格式，编码
;           -> 其他设置
;       -> Display Settings 展示/排版等界面格式设置
;           -> 界面美化
;           -> 辅助信息
;           -> 代码缩进
;           -> 代码折叠
;           -> Others
;       -> Keymap 键盘快捷键映射
;           -> 基础快捷键
;           -> 选中及操作改键
;           -> tab/buffer 相关
;           -> 搜索相关
;           -> F1-F6 设置
;       -> Others 其它功能
;           -> 备份
;           -> 全屏
;           -> 恢复环境
;           -> 窗口缩放
;       -> FileType Settings  针对文件类型的设置
;       -> Theme Settings  主题设置
;       -> Plugins
;
;==========================================

;; 把目录lisp/添加到搜索路径中去
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'package)
(load "config_base")
(load "display")
(load "keymap")
(load "command")
(load "filetype")
(load "theme")
(load "others")

(load "bundles")
(load "cpp")
(load "python")
(load "php")
(load "web")
(load "ruby")
(load "go")
(load "markdown")
(load "latex")
(load "end")
