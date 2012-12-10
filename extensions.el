;;(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)
;;(color-theme-greiner)
;;(color-theme-dark-blue2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load CEDET
;;(load-file "~/emacs/bak/20120913/Extensions/cedet-1.0pre4/common/cedet.el")
(require 'cedet)
;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator

(setq semanticdb-default-save-directory "~/.emacs.d/semantic")

;;(semantic-load-enable-code-helpers)
;;(global-set-key [(f4)] 'speedbar-get-focus)

(setq semanticdb-project-roots 
        (list
        (expand-file-name "/")))

(defun my-indent-or-complete ()
  (interactive)
  (if (looking-at "\\>")
      (hippie-expand nil)
    (indent-for-tab-command))
  )

(global-set-key [(shift tab)] 'my-indent-or-complete)

(autoload 'senator-try-expand-semantic "senator")

(setq hippie-expand-try-functions-list
      '(
	senator-try-expand-semantic
	try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-expand-list
	try-expand-list-all-buffers
	try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB(Emacs Code Browser)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;install ecb
(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/ecb-2.32/")
(require 'ecb-autoloads)

;;启动时不显示tip
(setq ecb-tip-of-the-day nil)

;; 加载显示行号模块
(require 'display-line-number)
;; 如果想所有打开的文件都显示行的话就打开下面的注释
;;(global-display-line-number-mode 1)
;; 设置显示格式
(setq display-line-number-format "%4d|")
;; 使用方法
;; M-x display-line-number-mode
;; 用来 toggle 显示行号的模式
;; M-x display-line-number-mode-on
;; 启动显示行号的模式
;; M-x display-line-number-mode-off
;; 关闭显示行号的模式
;; 仅对某种 mode 启动显示行号的模式

(require 'xcscope)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;image view
;;(require 'thumbs)
(auto-image-file-mode t)

;;tabber
(require 'tabbar)
(setq tabbar-speedkey-use t)
(setq tabbar-speedkey-prefix (kbd "<f1>"))
(tabbar-mode 1)
(global-set-key (kbd "M-[") 'tabbar-backward-group)
(global-set-key (kbd "M-]") 'tabbar-forward-group)
(global-set-key (kbd "M-p") 'tabbar-backward-tab)
(global-set-key (kbd "M-n") 'tabbar-forward-tab)

;;(require 'w3m-load)
;;(autoload 'w3m "w3m" "interface for w3m on emacs" t)
;;(setq w3m-use-cookies t)
;;(setq w3m-use-tab t)
;;(setq w3m-command-arguments '("-cookie" "-F"))
;;(setq w3m-home-page "http://www.google.com")
;;(setq w3m-command-arguments 
;;              (nconc w3m-command-arguments
;;              '("-o" "http_proxy=http://proxy.hogege.com:8000/")))
;;(setq w3m-no-proxy-domains '("local.com" "neighbor.com"))
;;;; w3m模式的tab切换和tabbar不搭配，重新定义一下
;;(global-set-key (kbd "")     'w3m)                 ;; F12召唤出 w3m
;;(global-set-key (kbd "")  'w3m-previous-buffer) ;; 前一个页面，Win键+左方向键
;;(global-set-key (kbd "") 'w3m-next-buffer)     ;; 后一个页面，Win键+右方向键
;;
;;(add-to-list 'load-path (expand-file-name "~/site-lisp/mmm-mode"))
;;



;;load the file of macros
(load-file "~/emacs/bak/20120913/Extensions/macros.el")
;;load the macros extension file
(load-file "~/emacs/bak/20120913/Extensions/macros+.el")
;;load the file save macros
(load-file "~/emacs/bak/20120913/Configurations/save-macros.el")
;;load the javascript-mode
(load-file "~/emacs/bak/20120913/Extensions/javascript-mode.el")
;;load my customize set
;;(load-file "~/extensions/php-mode.el")

;;(require 'template)
;;(template-initialize)
;;(setq template-home-directory "~/lib/templates")
;;(setq template-default-directories (quote ("~/.emacs.d/templates/")))
;;
;;support edit compress files
;;(require 'jka-compr)
;;(jka-compr-install)

;;is switch buffer
;;(require 'iswitchb)
;;(iswitchb-default-keybindings)

;;like switch buffer
(require 'ido)
(ido-mode t)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(setq desktop-path (quote ("~/.emacs.d/")))
;;(setq desktop-enable t nil (desktop))
;;(setq desktop-globals-to-clear nil)
;;(setq desktop-save t)


(desktop-load-default)
(desktop-read)
(desktop-save-mode 1)


;;switch buffers
(load-library "yic-buffer")

;;redo
(require 'redo)

;;; psvn
(setq svn-status-prefix-key '[(hyper s)])
(setq svn-status-svn-process-coding-system 'cp936)
(setq svn-status-svn-file-coding-system 'cp936)
(require 'psvn)
;;(define-key svn-log-edit-mode-map [f6] 'svn-log-edit-svn-diff)
      

(defun xsteve-svn-log-edit-setup ()
  (setq ispell-local-dictionary "english")
  (auto-fill-mode 1))

(add-hook 'svn-log-edit-mode-hook 'xsteve-svn-log-edit-setup)

;;pager
;;(require 'pager)
;;(global-set-key "\C-v"   'pager-page-down)
;;(global-set-key [next]    'pager-page-down)
;;(global-set-key "\ev"   'pager-page-up)
;;(global-set-key [prior]   'pager-page-up)
;;(global-set-key '[M-up]    'pager-row-up)
;;(global-set-key '[M-kp-8]  'pager-row-up)
;;(global-set-key '[M-down]  'pager-row-down)
;;(global-set-key '[M-kp-2]  'pager-row-down)
;;
;;;;hideshow
;;(require 'hideshow)
;;(easy-menu-define hs-minor-mode-menu
;;    hs-minor-mode-map
;;    "Menu used when hideshow minor mode is active."
;;    (cons "Hide/Show"
;;          (mapcar
;;           ;; Interpret each table entry as follows: first, populate keymap
;;           ;; with elements 2 and 1; then, for easymenu, use entry directly
;;           ;; unless element 0 is nil, in which case the entry is "omitted".
;;           (lambda (ent)
;;             (define-key hs-minor-mode-map (aref ent 2) (aref ent 1))
;;             (if (aref ent 0) ent "-----"))
;;           ;; These bindings roughly imitate those used by Outline mode.
;;           ;; menu entry command key
;;           '(["Hide Block" hs-hide-block "\C-o\C-c"]
;;             ["Show Block" hs-show-block "\C-o\C-e"]
;;             ["Hide All" hs-hide-all "\C-o\C-t"]
;;             ["Show All" hs-show-all "\C-o\C-a"]
;;             ["Hide Level" hs-hide-level "\C-o\C-l"]
;;             ["Toggle Hiding" hs-toggle-hiding "\C-o\C-h"]
;;             [nil hs-mouse-toggle-hiding [(shift mouse-2)]]
;;             ))))
;;
;;(add-hook 'php-mode-hook 'hs-minor-mode)
;;(add-hook 'latex-mode-hook 'outline-minor-mode)
;;(add-hook 'perl-mode-hook 'cperl-mode)
;;(add-hook 'php-mode-hook
;;          '(lambda ()
;;             (c-set-style "Stroustrup")))
;;;;     (outline-minor-mode "t")))

(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;;(require 'uniquify)拼写检查
;;(require 'flyspell)


(load-file "~/emacs/bak/20120913/Configurations/customize.el")
;; Tell customize to save to ~/Emacs/customize.el TI 
(setq custom-file "~/emacs/bak/20120913/Configurations/customize.el")
;; Load the customizations.


;;ibuffer mode
;;ibuffer 设置
(require 'ibuf-ext)
(setq ibuffer-mode-hook
      (lambda ()
        (setq ibuffer-filter-groups
              '(
                ("*buffer*" (name . "\\*.*\\*"))
                ("dired" (mode . dired-mode))
                ("php" (mode . php-mode))
                ("html" (mode . html-mode))
                ("org" (mode . org-mode))
		("erl" (mode . erlang-mode))
		("rb" (mode . ruby-mode))		
                ("elisp" (or (mode . emacs-lisp-mode)
                             (mode . lisp-interaction-mode)))
                ("prog" (or (mode . c++-mode)
                            (mode . c-mode)
                            (mode . java-mode)))
                ("tags" (name . "^TAGS"))))))

;;ibuffer 过滤器 / a ?
(setq ibuffer-saved-filters
      '(
        ("t" (or (mode . latex-mode) (mode . plain-tex-mode))) 
        ("c" ((or (mode . c-mode) (mode . c++-mode))))
        ("p" ((mode . php-mode)))
        ("e" ((or (mode . emacs-lisp-mode) (mode lisp-interaction-mode))))
        ("d" ((mode . dired-mode)))
        ("w" ((mode . emacs-wiki-mode)))
        ("*" ((name . "*\\w*")))
        ))


;;;;设置窗口在windows下最大化
;;(defun w32-restore-frame (&optional arg)
;;    "Restore a minimized frame"
;;     (interactive)
;;     (w32-send-sys-command 61728 arg))
;;(defun w32-maximize-frame (&optional arg)
;;    "Maximize the current frame"
;;     (interactive)
;;     (w32-send-sys-command 61488 arg))
;;(w32-maximize-frame)
;;(add-hook 'after-make-frame-functions 'w32-maximize-frame)
;;
;;;;erc 编码
;;(setq erc-default-coding-system '(utf-8 . utf-8))
;;;(setq erc-encoding-coding-alist '(("#linuxfire" . chinese-iso-8bit))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ska jumper
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;临时记号:当你按 C-. 时就做了一个记号。然后你可以到别处，按C-, 就可以在这两点之间来回跳转了

(global-set-key [(control ?\.)] 'ska-point-to-register) 
(global-set-key [(control ?\,)] 'ska-jump-to-register) 
(defun ska-point-to-register() 
"Store cursorposition _fast_ in a register.  
Use skitema-jump-to-register to jump back to the stored  
position." 
(interactive) 
(setq zmacs-region-stays t) 
(point-to-register 8)) 

(defun ska-jump-to-register() 
"Switches between current cursorposition and position 
that was stored with ska-point-to-register." 
(interactive) 
(setq zmacs-region-stays t) 
(let ((tmp (point-marker)))
(jump-to-register 8) 
(set-register 8 tmp))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;w3m
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)


(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/w3m")
(require 'w3m-load)
;;(require 'w3m-e21)
;;(provide 'w3m-e23)
(setq w3m-command "/opt/local/bin/w3m")
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.google.com")

(setq w3m-display-inline-image t)


;;启动和初始化w3m.el
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;使用w3m作为默认的浏览器
(setq browse-url-browser-function 'w3m-browse-url)
;;使用mule-ucs，只有在你安装mule-ucs elisp扩展包时这个才有用，可以看Unicode解码的网页
;(setq w3m-use-mule-ucs t)
;;使用工具包
(setq w3m-use-toolbar t)
;;使用info的快件键绑定
;(set-default 'w3m-key-binding 'info)
;;启用cookie
(setq w3m-use-cookies t)
;;这个是作什么的?
(setq w3m-use-tab-menubar t)
;;设定w3m图标所在文件夹
;(setq w3m-icon-directory "/home/jerry/software/xemacs/w3m/emacs-w3m-1.4.4/icons")
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))
;;用w3m浏览网页时也显示图片
(setq w3m-display-inline-image t)
;; ;;设定w3m的语言设置，以便方便使用和阅读中文-用了就乱码
;; ;;书签解码设置
;; (setq w3m-bookmark-file-coding-system 'chinese-iso-8bit)
;; ;;w3m的解码设置，后面最好都有，我也不详解了
;; (setq w3m-coding-system 'chinese-iso-8bit)
;; (setq w3m-default-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-name-coding-system 'chinese-iso-8bit)
;; (setq w3m-terminal-coding-system 'chinese-iso-8bit)
;; (setq w3m-input-coding-system 'chinese-iso-8bit)
;; (setq w3m-output-coding-system 'chinese-iso-8bit)
;;w3m是使用tab的，设定Tab的宽度
(setq w3m-tab-width 4)
;;设定w3m的主页
(setq w3m-home-page "http://www.google.cn")
;;当用 shift+RET 打开新链接时将不自动跳转到新的页面，等提示已经完全打开，才用 C-c C-n ，
;;C-c C-p 打开，这个好用
(setq w3m-view-this-url-new-session-in-background t)
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
;;好像是有利于中文搜索的
(defun remove-w3m-output-garbages ()
"去掉w3m输出的垃圾."
(interactive)
(let ((buffer-read-only))
(setf (point) (point-min))
(while (re-search-forward "[\200-\240]" nil t)
(replace-match " "))
(set-buffer-multibyte t))
(set-buffer-modified-p nil))
;;颜色设置
;(setq w3m-
;;;;;;;;;;;;;;;;;;;;;
;;语言设置
;;这个不知道有用没，好像在下一版emacs对unicode支持好了就可以了
;;当然这个是用emacs-cvs
;;;;;;;;;;;;;;;;;;;;;
(when (boundp 'utf-translate-cjk)
(setq utf-translate-cjk t)
(custom-set-variables
 '(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
    (utf-translate-cjk-mode 1))
;;配置handle text/html part with emacs-w3m under SEMI MUAs such as Wanderlust

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'chm-view)

(setq browse-url-browser-function 'w3m-browse-url)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loccur
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'loccur)
;; defines shortcut for loccur of the current word
(define-key global-map [(control o)] 'loccur-current)
;; defines shortcut for the interactive loccur command
(define-key global-map [(control meta o)] 'loccur)
;; defines shortcut for the loccur of the previously found word
(define-key global-map [(control shift o)] 'loccur-previous-match)


;;
;;set grep-find-command, which ask grep-find to filter out some files specified by filter-name-list
;;(let (filter-name-list)
;; (setq filter-name-list '(".svn" "*~" "#*#"))
;; (setq grep-find-command "find .")
;; (dolist (filter-file-name filter-name-list)
;;   (setq grep-find-command (format "%s -name \"%s\" -prune -o" grep-find-command filter-file-name)))
;; (setq grep-find-command (concat grep-find-command " -type f -print0 | xargs -0  grep -inH -e ")))
;;(defun grep-find-with-querystring-quoted (command-args)
;; "Enhance grep-find by auto quoting query string, and preventing show the lengthy grep-find-command in minibuffer"
;; (interactive
;;  (progn
;;    (grep-compute-defaults)
;;    (if grep-find-command
;;        ;; auto quote query string
;;        (list (concat grep-find-command "\"" (read-shell-command "Run find in current directory: "
;;                                                                 nil 'grep-find-history) "\""))
;;      ;; No default was set
;;      (read-string
;;       "compile.el: No `grep-find-command' command available. Press RET.")
;;      (list nil))))
;; (when command-args
;;   (let ((null-device nil))
;;     (grep command-args))));; perform the querying
;;(defalias 'gfind 'grep-find-with-querystring-quoted)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EasyPg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; password gpg
(require 'epa-file)
(epa-file-enable)
;; 总是使用对称加密
(setq epa-file-encrypt-to nil)
;; 允许缓存密码，否则编辑时每次保存都要输入密码
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; 允许自动保存
(setq epa-file-inhibit-auto-save nil)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun python-shell()
  "make a python shell"
  (interactive)p
  (switch-to-buffer (make-comint "python" "python" nil "-i")))

(defun perl-shell()
  "make a perl db shell"
  (interactive)
  (switch-to-buffer (make-comint "perl" "perl" nil "-d -e''")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defun clean-php-mode ()
  (interactive)
  (php-mode)
  (setq c-basic-offset 2) ; 2 tabs indenting
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;git-emacs
(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/git-emacs")
(require 'git-emacs)
