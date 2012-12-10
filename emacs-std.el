(set-language-environment 'chinese-gbk)
(set-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

;;; 苹果键位remap
(setq mac-command-modifier 'meta) ;映射苹果键
;;(setq mac-cntrol-modifier 'control) ;映射Ctrl键
(setq mac-option-modifier 'control) ;映射Alt键
;;(setq mac-option-modifier 'alt) ;映射Alt键


 ;; highlight marked region
(transient-mark-mode t)

;; enable syntax highlight
(global-font-lock-mode t)

;; show column number on status bar
(setq column-number-mode t)

;; close toolbar
(tool-bar-mode 0)

;; close menubar
;;(menu-bar-mode 0)

;; enable mouse wheel support
(mouse-wheel-mode)
(put 'upcase-region 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)

(setq byte-compile-dynamic t)

;;emacs server
(setq server-socket-dir "~/.emacs.d/server")
(server-start)

(setq next-line-add-newlines t)

;;让烦人的开始消息滚蛋
(setq inhibit-startup-message t)

;;更换bookmark文件的位置
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

;;To make Emacs save your bookmarks to a file every time you change, delete, or add a bookmark,
;;及时更新bookmark
(setq bookmark-save-flag 1)

;;To enable highlighting when searching, insert the following line in your .emacs file:
(setq search-highlight t)

;;To hightlight matches when using search-and-replace(search-and-replace is described in the next section)
(setq query-replace-highlight t)

;;中键粘贴
(setq mouse-yank-at-point t)

(setq kill-ring-max 200)

(setq default-fill-column 80)

;;可以递归的使用 minibuffer。我经常需要这么做。
(setq enable-recursive-minibuffers t)

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
    scroll-conservatively 10000)

(show-paren-mode t)
(setq show-paren-style 'parenthesis) 


(mouse-avoidance-mode 'animate)

(setq frame-title-format "emacs@%b")

(auto-image-file-mode)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
(setq make-backup-files t)
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;;keep all your backup files in one directory
;;(require 'backup-dir) 
;;(setq bkup-backup-directory-info 
;;      '((t "~/.emacs.d/backups" ok-create full-path))) 
;;

(setq user-full-name "Bryant yan")
(setq user-mail-address "bryant.yan@gmail.com")

  (defun my-switch-buffer () 
    "Like switch-buffer but in the opposite direction" 
    (interactive "") 
    (other-window -1) 
  )

;;dired 配置
;;自动调整 minibuffer大小
;;(resize-minibuffer-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq resize-mini-windows t)

;;让 dired 可以递归的拷贝和删除目录。 
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;(setq dired-recursive-deletes t) ; 可以递归的删除目录
;;(setq dired-recursive-copies t)  ; 可以递归的进行拷贝
;; 有些特殊的功能

(require 'dired-x) 

(setq dired-guess-shell-alist-user
      (list
       (list "\\.chm$" "open")
       (list "\\.rm$" "open")
       (list "\\.pdf$" "open")       
       (list "\\.rmvb$" "open")
       (list "\\.avi$" "open")
       (list "\\.asf$" "open")
       (list "\\.wmv$" "open")
       (list "\\.htm$" "w3m")
       (list "\\.html$" "w3m")
       (list "\\.mpg$" "open")
       (list "\\.key$" "open")
       (list "\\.key$" "open")              
      )
 ) 

(if (eq system-type 'windows-nt)
    (defun ywb-dired-copy-fullname-as-kill (&optional arg)
      "In dired mode, use key W to get the full name of the file"
      (interactive "P")
      (let (file)
        (setq file (dired-get-filename nil t))
        (or (not arg)
            (cond ((= arg 1)
                   (setq file (convert-standard-filename file)))
                  ((= arg 2)
                   (setq file (ywb-convert-to-cygwin-path file)))
                  ((= arg 3)
                   (setq file (convert-standard-filename (file-name-directory file))))))
        (if (eq last-command 'kill-region)
            (kill-append file nil)
          (kill-new file))
        (message "%s" file)))
  (defun ywb-dired-copy-fullname-as-kill ()
    (interactive)
    (dired-copy-filename-as-kill 0)))

;; Convert path to cygwin format path
(defun ywb-convert-to-cygwin-path (path)
  (concat "file:///cygdrive/" (substring path 0 1) (substring path 2)))
(add-hook 'dired-mode-hook (lambda ()
(define-key dired-mode-map "W" 'ywb-dired-copy-fullname-as-kill)))

;;设置临时文件夹
;;(defvar temp-directory (concat "~/tmp/" ))
;;(make-directory temp-directory t)

;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     ; 标记calendar上有diary的日期
;;(setq mark-holidays-in-calendar nil)        ; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日 

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 3 14 "白色情人节")
                         (holiday-fixed 4 1 "愚人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-fixed 6 1 "儿童节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 7 1 "建党节")
                         (holiday-fixed 8 1 "建军节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))

;;缩进不用 tab 模式, 用空格模式
(setq indent-tabs-mode nil)
(setq tab-width 4)

;;自动调整 minibuffer大小
(setq resize-mini-windows t)
;;(setq special-display-buffer-names '("*Help*" "*Apropos*" 
;;                                     "*compilation*" "*grep*" "*igrep*"))
;;在help compilation grep igrep 时采用 专注模式
(setq special-display-buffer-names '("*Help*" "*compilation*" "*grep*" "*igrep*")) 

;;When this line is in the .emacs file, abbreviations are loaded during startup of Emacs
(read-abbrev-file)

(require 'sams-lib)
;;you want the abbreviations to be saved as soon as they are defined, insert the following into your .emacs file
(sams-write-abbrev-at-once)

;;(add-hook 'php-mode-hook (lambda () (abbrev-mode nil)))
;;随便搞搞的小玩意
(defun task-list() 
(interactive) 
(occur "TODO"))

;;setFonts


(defun cha-b()
  (interactive)
  (set-default-font "-apple-Heiti_SC-bold-normal-normal-*-*-*-*-*-p-0-iso10646-1")
  (set-face-attribute 'default (selected-frame) :height 130))

(defun cha-a()
  (interactive)
  (set-default-font "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))


(create-fontset-from-fontset-spec
 "-apple-bitstream vera sans mono-medium-r-normal--12-*-*-*-*-*-fontset-mymonaco,
 ascii:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
 chinese-gb2312:-apple-STHeiti-medium-normal-normal-12-*-*-*-*-p-0-iso10646-1,
 latin-iso8859-1:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
 mule-unicode-0100-24ff:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")


(setq default-frame-alist (append '((font . "fontset-mymonaco")) default-frame-alist))
(set-default-font "fontset-mymonaco")


;;info配置
(require 'info)
;;(setq Info-directory-list
;;      (cons (expand-file-name "/usr/share/info") 
;;	    Info-directory-list))
;;(setq Info-directory-list
;;      (cons (expand-file-name "your-info-path")
;;	    Info-directory-list))


(setq exec-path
      (cons "/opt/local/bin" exec-path))


(setq eshell-path-env "/usr/bin:/bin:/usr/sbin:/sbin")
;;("/usr/bin:/bin:/usr/sbin:/sbin" . ":/opt/local/bin")
;;eshell-path-env

(setq eshell-path-env
      (concat eshell-path-env ":/opt/local/bin"))

;;aspell配置
(setq-default ispell-program-name "aspell") 

;;解决ansi-color乱码问题
	
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

