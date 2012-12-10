;; 关闭一个frame，绑定到 C-F4
(global-set-key [(control f4)] 'delete-frame)
;; 在两个frame中切换
(global-set-key [(control tab)] 'other-frame)
(global-set-key [(control shift tab)] '(lambda ()
                                       (interactive)
                                       (other-frame -1)))

;; use Ctrl-+ and Ctrl-[ms] on the numeric keypad to move forward or backward
;;(global-set-key [(control kp-add)] 'other-window)
;;(global-set-key [(control kp-subtract)] 'sams-other-window-backwards)
(global-set-key [(control x) ?p] 'sams-other-window-backwards)
;;(global-set-key [(control meta s)] 'isearch-forward)

;;binding goto-line to M-g
(global-set-key [(meta g)] 'goto-line)
;;M-left backward M-right forward
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

(global-set-key [(meta q)] 'sams-fill)

(global-set-key [(control x) ?5 ?p] 'sams-other-frame-backwards) 

(global-set-key [(control h) (w)] 'sams-where-is)
(global-set-key [(control meta tab)] 'ispell-complete-word)

(global-set-key [(meta o)] 'open-line) 


;;A much more powerful function called hippie-expand exists. To use it, bind it to a key. 
(global-set-key "\M- " 'hippie-expand)

 ;;; shift the meaning of C-s and C-M-s
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control meta s)] 'isearch-forward)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control meta r)] 'isearch-backward)

(global-set-key [(control h) (control c)] 'sams-list-all-bindings)

(global-set-key [(control x) (control b)] 'ibuffer)

(global-set-key "\C-x\C-j" 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired

(global-set-key [(control \;)] 'redo)

(load "refcard")
(load "command")