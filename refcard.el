;----------------------------------------------------------------------
;                                   F1
;----------------------------------------------------------------------
;;;; F1 has is defined by Emacs by default!
;;;; (global-set-key [(f1)] 'sams-unbound-key)
(global-set-key [(f1)] 'eval-region)
;(global-set-key [(shift f1)] 'sams-unbound-key)
(global-set-key [(shift f1)] 'eval-current-buffer)
;;(global-set-key [(shift f1)] 'call-last-kbd-macro)
(global-set-key [(control f1)] 'display-line-number-mode);;added
(global-set-key [(meta f1)] 'xsteve-svn-log-edit-setup);;added

;----------------------------------------------------------------------
;                                    F2
;----------------------------------------------------------------------
(global-set-key [(f2)] 'list-matching-lines)

(global-set-key [(shift f2)] 'sams-keep-lines)
(global-set-key [(control f2)] 'sams-kill-lines)
;;(global-set-key [(meta f2)] 'sams-unbound-key)
(global-set-key [(meta f2)] 'browse-url)

;----------------------------------------------------------------------
;                                    F3
;----------------------------------------------------------------------
(global-set-key [(f3)] 'kill-rectangle)
(global-set-key [(shift f3)] 'yank-rectangle)
(global-set-key [(control f3)] 'string-rectangle)
(global-set-key [(meta f3)] 'open-rectangle)

;----------------------------------------------------------------------
;                                    F4
;----------------------------------------------------------------------
;;(global-set-key [(f4)] 'tags-search)
;;(global-set-key [(shift f4)] 'tags-query-replace)
;;(global-set-key [(control f4)] 'tags-apropos)
;;(global-set-key [(meta f4)] 'visit-tags-table)
;;
(global-set-key [(f4)] 'call-last-kbd-macro)
(global-set-key [(shift f4)] 'name-last-kbd-macro)
(global-set-key [(control f4)] 'insert-kbd-macro)
(global-set-key [(meta f4)] 'sams-apply-macro-on-region)

;----------------------------------------------------------------------
;                                    F5
;----------------------------------------------------------------------
(global-set-key [(f5)] 'sams-cm-rotate)
(global-set-key [(shift f5)] 'sams-cm-save-point)
(global-set-key [(control f5)] 'font-lock-fontify-buffer)
;;(global-set-key [(meta f5)] 'sams-unbound-key)
(global-set-key [(meta f5)] 'find-library)

;----------------------------------------------------------------------
;                                    F6
;----------------------------------------------------------------------
(global-set-key [(f6)] 'undo)
(global-set-key [(shift f6)] 'redo)
(global-set-key [(control f6)] 'sams-toggle-truncate)
(global-set-key [(meta f6)] 'sams-unbound-key)

;----------------------------------------------------------------------
;                                    F7
;----------------------------------------------------------------------
(global-set-key [(f7)] 'ispell-word)
(global-set-key [(shift f7)] 'ispell-region)
(global-set-key [(control f7)] 'ispell-buffer)
(global-set-key [(meta f7)] 'flyspell-mode)

;----------------------------------------------------------------------
;                                    F8
;----------------------------------------------------------------------
(global-set-key [(f8)] 'bookmark-jump)
(global-set-key [(shift f8)] 'bookmark-set)
(global-set-key [(control f8)] 'list-bookmarks)
(global-set-key [(meta f8)] 'sams-unbound-key)

;----------------------------------------------------------------------
;                                    F9
;----------------------------------------------------------------------
(global-set-key [(f9)] 'goto-line)
(global-set-key [(shift f9)] 'sams-apply-macro-on-region)
(global-set-key [(control f9)] 'compile)
(global-set-key [(meta f9)] 'sams-unbound-key)

;----------------------------------------------------------------------
;                                    F10
;----------------------------------------------------------------------
;;; F10 is defined by emacs by default.

(global-set-key [(f10)] 'ispell-word)
(global-set-key [(shift f10)] 'ispell-region)
(global-set-key [(control f10)] 'ispell-buffer)
(global-set-key [(meta f10)] 'flyspell-mode)

;----------------------------------------------------------------------
;                                    F11
;----------------------------------------------------------------------
;;(global-set-key [(f4)] 'speedbar-get-focus)
(global-set-key [(f11)] 'speedbar-get-focus);;added
(global-set-key [(shift f11)] 'sams-unbound-key) 
(global-set-key [(control f11)] 'sams-unbound-key)
(global-set-key [(meta f11)] 'sams-unbound-key)

;----------------------------------------------------------------------
;                                    F12
;----------------------------------------------------------------------
(global-set-key [(f12)] 'sams-unbound-key)
(global-set-key [(shift f12)] 'sams-unbound-key)
(global-set-key [(control f12)] 'sams-unbound-key)  
(global-set-key [(meta f12)] 'sams-unbound-key)




