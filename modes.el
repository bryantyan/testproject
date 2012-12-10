;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang distel Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This is needed for Erlang mode setup
;;(setq erlang-root-dir "/usr/local/lib/erlang")
;;(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.5/emacs" load-path))
;;(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;;(require 'erlang-start)
;;
;;;; This is needed for Distel setup
;;(let ((distel-dir "/usr/local/lib/erlang/lib/distel-4.0.1/elisp"))
;;  (unless (member distel-dir load-path)
;;    ;; Add distel-dir to the end of load-path
;;    (setq load-path (append load-path (list distel-dir)))))
;;
;;(require 'distel)
;;(distel-setup)
;;
;;
;;;; Some Erlang customizations
;;(add-hook 'erlang-mode-hook
;;          (lambda ()
;;            ;; when starting an Erlang shell in Emacs, default in the node name
;;            (setq inferior-erlang-machine-options '("-sname" "emacs"))
;;            ;; add Erlang functions to an imenu menu
;;            (imenu-add-to-menubar "imenu")))
;;
;;;; A number of the erlang-extended-mode key bindings are useful in the shell too
;;(defconst distel-shell-keys
;;  '(("\C-\M-i"   erl-complete)
;;    ("\M-?"      erl-complete)
;;    ("\M-."      erl-find-source-under-point)
;;    ("\M-,"      erl-find-source-unwind)
;;    ("\M-*"      erl-find-source-unwind)
;;    )
;;  "Additional keys to bind when in Erlang shell.")
;;
;;(add-hook 'erlang-shell-mode-hook
;;          (lambda ()
;;            ;; add some Distel bindings to the Erlang shell
;;            (dolist (spec distel-shell-keys)
;;              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))
;;
;;
;;(load-file "~/emacs/bak/20120913/Configurations/erlang-skel.el")
;;
;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; php mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/php-mode-1.5.0")
(require 'php-mode)
;;(add-hook 'php-mode-user-hook 'turn-on-font-lock)
(add-to-list 'auto-mode-alist '("\\.php[34]?\'" . php-mode))

;;(define-key php-mode-map
;;  "\C-c\C-f"
;;  'php-search-documentation)
;;(global-set-key [(shift tab)] 'my-indent-or-complete)
(add-hook 'php-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(require 'php-electric)
(setq php-mode-hook nil)

(add-hook 'php-mode-hook
   '(lambda()
      (php-electric-mode t)
      (tabbar-local-mode 0)
      
      (setq tab-width 4
	    c-basic-offset 4
	    c-hanging-comment-ender-p nil
	    indent-tabs-mode
	    (not
	     (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
		  (string-match "\.php$" (buffer-file-name)))))))

;;(add-hook 'php-mode-hook
;;   '(lambda()
;;      (php-electric-mode t)
;;      (tabbar-local-mode 0)
;;      
;;      (setq tab-width 4
;;	    c-basic-offset 4
;;	    c-hanging-comment-ender-p nil
;;	    indent-tabs-mode
;;	    (not
;;	     (and (string-match "/\\(PEAR\\|pear\\)/" (buffer-file-name))
;;		  (string-match "\.php$" (buffer-file-name)))))))

;;(setq php-mode-hook nil)

;;(add-hook 'php-mode-hook
;;          '(lambda ()
;;             (define-abbrev php-mode-abbrev-table "ex" "extends")
;;             ;;(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
;;             ;;(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)
;;             ;;php-mode php-electric-mode
;;
;;             (php-electric-mode t)
;;             (tabbar-local-mode 1)
;;             ;;(header-line-format 0)
;;             ;;(semantic-show-unmatched-syntax-mode 0)
;;             ;;      (c-set-style "Stroustrup")
;;             ;;      (outline-minor-mode "t")
;;             (setq c-basic-offset 4)
;;	     (setq php-indent-level 4
;;		   php-continued-statement-offset 4
;;		   php-continued-brace-offset 0
;;		   php-brace-offset 0
;;		   php-brace-imaginary-offset 0
;;		   php-label-offset -4)
;;             ))
;;

;;(defun phplint-thisfile ()
;;  (interactive)
;;  (compile (format "php -l %s" (buffer-file-name))))
;;(add-hook 'php-mode-hook
;;        '(lambda ()
;;           (local-set-key [f8] 'phplint-thisfile)))
;;;; end of php lint
;;
;;;;(defun clean-php-mode ()
;;;;  (interactive)
;;;;  (php-mode)
;;;;  (setq c-basic-offset 2) ; 2 tabs indenting
;;;;  (setq indent-tabs-mode nil)
;;;;  (setq fill-column 78)
;;;;  (c-set-offset 'case-label '+)
;;;;  (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
;;;;(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
;;;;(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; php-doc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'tree-mode)
(require 'windata)
(require 'help-dwim)
(require 'php-doc nil t)
(setq php-doc-directory "/Users/bryant/Books/php/php5")

(defun my-php-mode-hook ()
  (tempo-use-tag-list 'tempo-php-tags)
  (font-lock-add-keywords nil gtkdoc-font-lock-keywords)
  (setq php-beginning-of-defun-regexp "^\\s-*\\(?:\\(?:abstract\\|final\\|private\\|protected\\|public\\|static\\)\\s-+\\)*function\\s-+\\(\\(?:\\sw\\|\\s_\\)+\\)\\s-*(")
  (local-set-key (kbd "\C-c h") 'php-doc)

  (require 'xcscope)
  (when (featurep 'php-doc)
    (local-set-key "\t" 'php-doc-complete-function)
    (set (make-local-variable 'eldoc-documentation-function)
         'php-doc-eldoc-function)
    (setq php-doc-browser-function 'w3m-browse-url)
    (eldoc-mode 1))
  (when (featurep 'simpletest)
    (simpletest-mode 1))
  (local-set-key (kbd "C-M-a") 'beginning-of-defun)
  (local-set-key (kbd "C-M-e") 'end-of-defun)
  ;;(local-set-key (kbd "C-c s") 'compile-dwim-compile)
  )
(add-hook 'php-mode-hook 'my-php-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; xcsope
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(setq load-path (cons "~/lib/emacs-lisp/org-7.01h/lisp" load-path))
;;(setq load-path (cons "~/lib/emacs-lisp/org-7.01h/contrib/lisp" load-path))
(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/org-mode")

(require 'org-install)
(load-file "~/emacs/bak/20120913/Configurations/org-css-setting.el")

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files 
      (list "~/org_data/gtd.org"
	    "~/org_data/projects.org"
	    ))
(setq org-agenda-ndays 7)
(setq org-agenda-repeating-timestamp-show-all nil)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-sorting-strategy
      '((agenda time-up priority-down tag-up)
	(todo tag-up)))

(setq org-agenda-start-on-weekday nil)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-with-date nil)
(setq org-agenda-window-setup 'other-window)
(setq org-deadline-warning-days 7)
;;(setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
(setq org-fast-tag-selection-single-key nil)
(setq org-log-done 'done)
(setq org-refile-targets
      '(("gtd.org" :maxlevel . 1)
	("projects.org" :maxlevel . 1)
	("someday.org" :maxlevel . 2)
	))
(setq org-reverse-note-order nil)
(setq org-tags-column -78)
(setq org-tags-match-list-sublevels nil)
(setq org-time-stamp-rounding-minutes 5)
(setq org-use-fast-todo-selection t)
(setq org-use-tag-inheritance nil)

  
(setq org-agenda-custom-commands
    '(
	("P" "Projects"   
	 ((tags "PROJECT")))

	("H" "Office and Home Lists"
	 ((agenda)
	  (tags-todo "OFFICE"
		     (
		      (org-agenda-overriding-header "Office")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))	  
	  (tags-todo "HOME"
		     (
		      (org-agenda-overriding-header "Home")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))	  
	  (tags-todo "COMPUTER"
		     (
		      (org-agenda-overriding-header "Computer")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))	  
		     
	  (tags-todo "DVD"
		     (
		      (org-agenda-overriding-header "DVD")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))

	  (tags-todo "PROJECT"
		     (
		      (org-agenda-overriding-header "Project")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))	  
	  
	  (tags-todo "READING"
		     (
		      (org-agenda-overriding-header "Reading")
		      (org-agenda-tags-todo-honor-ignore-options t)
		      (org-agenda-todo-ignore-scheduled t)
		      (org-agenda-todo-ignore-deadlines t)
		      ))	  
	  ))
	("D" "Daily Action List"
	 (
        (agenda "" ((org-agenda-ndays 1)
                    (org-agenda-sorting-strategy
                     (quote ((agenda time-up priority-down tag-up) )))
                    (org-deadline-warning-days 0)
                    ))))
	)
    )


(setq org-default-notes-file "~/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org_data/gtd.org" "Tasks")
	("in-basket"   ?i "** %^{Head Line} \n%i%?\nAdded: %U"  "~/org_data/in-basket.org")  
	("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/org_data/journal.org")
	("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/org_data/journal.org")
	("Password" ?p "* %^{Head Line} \n%[~/.password_template.txt]\nAdded: %U" 
	 "~/org_data/passwords.org.gpg")
	("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/gtd/finances.org")
	("Book" ?b "** %^{Book Title} %t :BOOK: \n%[~/.book_template.txt]\n"
	 "~/gtd/journal.org")	 
	("Film" ?f "** %^{Film Title} %t :FILM: \n%[~/.film_template.txt]\n"
	 "~/gtd/journal.org")
	("Daily Review" ?a "** %t :COACH: \n%[~/.daily_review.txt]\n"
	 "~/gtd/journal.org")
	("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/org_data/someday.org")
	("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/gtd/vocab.org")
	("test" ?w "** %^{Book Title|a|b|c} %t :BOOK: \n%[~/.test_template.txt]\n%^Cd%^Cd"
	 "~/gtd/journal.org")
	)
      )

(require 'org-publish)
(setq org-publish-project-alist
      '(("training-org"
         :base-directory "~/Documents/org/training"
         :publishing-directory "~/Documents/org/training/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html

	 :auto-sitemap nil
	 :sitemap-filename "index.org"
	 :sitemap-title "sitemap"
	 
         :style "<link rel=\"stylesheet\" href=\"./css/mystyles.css\" type=\"text/css\"/>")
        ("training-static"
         :base-directory "~/Documents/org/training"
         :publishing-directory "~/Documents/org/training/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("training" 
         :components ("training-org" "training-static")
         :author "bryant.yan@gmail.com"
         )
	
	("study-org"
         :base-directory "~/Documents/org/study"
         :publishing-directory "~/Documents/org/study/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html

	 :auto-sitemap t
	 :sitemap-filename "index.org"
	 :sitemap-title "sitemap"
	 
         :style "<link rel=\"stylesheet\" href=\"./css/mystyles.css\" type=\"text/css\"/>")
        ("study-static"
         :base-directory "~/Documents/org/study"
         :publishing-directory "~/Documents/org/study/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("study" 
         :components ("study-org" "study-static")
         :author "bryant.yan@gmail.com"
         )	
	))

;; mobileorg configure
(setq org-directory "~/org_data")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(setq org-mobile-files 
      (list "gtd.org"
	    "pkm/pkm-skill.org"
	    "pkm/pkm.org"
	    "someday.org"
	    "weekly_review.org"
	    "projects.org"
	    "birthday.org"))
(setq org-mobile-inbox-for-pull "~/org_data/in-basket.org")
;;(setq org-mobile-inbox-for-pull "~/org/from-mobile.org")
(unless (file-exists-p org-mobile-inbox-for-pull)
  (shell-command (concat "touch " org-mobile-inbox-for-pull)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ruby-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/ruby-mode")
(require 'ruby-mode)
;;
;;;;This gives access to a function called run-ruby, which runs IRB in an Emacs buffer.
(require 'inf-ruby)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; rails-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/emacs/bak/20120913/Extensions/rails")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; evernote-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
(require 'evernote-mode)
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)


