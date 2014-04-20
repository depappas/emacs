;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tell emacs where is your personal elisp lib dir
;; this is default dir for extra packages
;; Help: since I use too many languages
;; 1. Print a variable value: C-x v
;; 2. Eval an s-expr: place the cursor after the closing paren and C-x C-e
;; 
;;  
;; http://www.emacswiki.org/emacs/LoadPath
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "loading paths")
(add-to-list 'load-path "~/.emacs.d/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To recursively add the sub-directories of the current 
;; directory to the end of the ‘load-path’ do this:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Run the emacs/emacs_setup.pl script to setup the thrid party git repos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((default-directory "~/repos/third_party_emacs_git_repos/"))
  (normal-top-level-add-subdirs-to-load-path))

;; (message "loading paths" load-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load my custom keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'mykeys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load my package management setup for Linux Mint
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package_setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc/Defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq lpr-switches (quote ("-dnosuchprinter")))

(setq default-major-mode (quote text-mode))

(setq text-mode-hook (quote (lambda nil (auto-fill-mode 1))))

(setq fill-column 72)

;; how to replace a word in multiple files
;; dired-do-query-replace-regexp
;;   Command: Do `query-replace-regexp' of FROM with TO, on all marked files.

;;tags-query-replace
;;  Command: `Query-replace-regexp' FROM with TO through all files listed in tags table.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://wikemacs.org/index.php/Package.el
;;
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/
;;
;; The magic starts with the command M-x package-list-packages. 
;;
;; 
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/kiwanami/emacs-epc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'epc)
(require 'jedi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jedi setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Jedi
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook
(lambda ()
(jedi:setup)
))

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:server-command (list "python3" jedi:server-script))
;; (jedi-mode 1)
;; 
;; (add-hook 'python-mode-hook 'jedi:setup)
;; ;;(add-hook 'python-mode-hook 'jedi:ac-setup)
;; (setq jedi:setup-keys t)
;; (setq jedi:server-args
;;       '("--log-level" "DEBUG"
;;         "--log-traceback"))
;; (setq jedi:complete-on-dot t)
;; (autoload 'jedi:setup "jedi" nil t)
;; 
;; 
;; 
;; (defun my-python-hook ()
;;   (interactive)
;;   (define-key python-mode-map (kbd "RET") 'newline-and-indent))
;; (add-hook 'python-mode-hook 'my-python-hook)
;; 
;; (setq jedi:setup-keys t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes
;;
;; Afterwards - business as usual, just load one of the theme variants \
;; with M-x load-theme.
;;
;; https://github.com/bbatsov/zenburn-emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)
(require 'zenburn)
(zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ido vertical mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck syntax checking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart parens mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(show-smartparens-global-mode +1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Slime Common Lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To use SLIME, you need to have a Common Lisp installed with which
;; you wish to interact.  At the moment, 'openmcl', 'sbcl', and
;; 'clisp' all work.  As a convenience, port variants for SLIME exist
;; which require the installation of these Lisps.
;; 
;;  Then put the following in your ~/.emacs:

;; (setq load-path (cons "/opt/local/share/emacs/site-lisp/slime" load-path))
;; (require 'slime-autoloads)
;; (setq slime-lisp-implementations
;;      `((sbcl ("/opt/local/bin/sbcl"))
;;        (clisp ("/opt/local/bin/clisp"))))
;; (add-hook 'lisp-mode-hook
;;            (lambda ()
;;              (cond ((not (featurep 'slime))
;;                     (require 'slime) 
;;                     (normal-mode)))))
;; 
;; (eval-after-load "slime"
;;    '(slime-setup '(slime-fancy slime-banner)))

;; Populate the initialization list in SLIME-LISP-IMPLEMENTATIONS
;; with the correct paths to the Common Lisp exectuables you wish to use.
;; 
;; Then, 'M-x slime' from Emacs should connect you to the first
;; CL implementation in the list. 'C-- M-x slime' will present
;; an interactive chooser for additional implementations in the list.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load the elisp files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))
 
(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load the elisp files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( append-path "~/emacs")

;; (add-to-list 'load-path (expand-file-name "~/emacs/site/jde/lisp"))

;; (add-to-list 'load-path (expand-file-name "/opt/emacs/emacs/emacs/lisp"))

;;( add-to-list 'load-path (expand-file-name "/opt/emacs/emacs/emacs/lisp/emacs-lisp"))

;; (if (file-exists-p "/opt/emacs/emacs/emacs/lisp/emacs-lisp/cl-seq.el")
;;    (load-file "/opt/emacs/emacs/emacs/lisp/emacs-lisp/cl-seq.el"))

;; (require 'cl-seq)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Look first in the directory ~/emacs for elisp files
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; ;(fmakunbound 'c-mode)
;; ;(makunbound 'c-mode-map)
;; ;(fmakunbound 'c++-mode)
;; ;(makunbound 'c++-mode-map)
;; ;(makunbound 'c-style-alist)
;; 
;; (autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
;; (autoload 'c-mode    "cc-mode" "C Editing Mode" t)
;; 
;; (setq auto-mode-alist
;; 	  (append '(("\\.C$"  . c++-mode)
;;                     ("\\.cc$" . c++-mode)
;;                     ("\\.c$"  . c++-mode)
;;                     ("\\.h$"  . c++-mode)
;;                     ("\\.pl$"  . perl-mode)
;;                     ) auto-mode-alist))
;; 

(setq-default c-basic-offset 2 tab-width 2 indent-tabs-mode nil)

(add-hook 'c-mode-common-hook '(lambda () (c-set-offset 'arglist-intro '+) (c-set-offset 'arglist-close 0)))

(add-hook 'python-mode-hook '(lambda () (c-set-offset 'arglist-intro '+) (c-set-offset 'arglist-close 0)))

;; (setq-default tab-width 2)
;; (setq-default indent-tabs-mode nil)
;; 
;; 
;; (line-number-mode 1)
;; (display-time)
;; 
;; 
;; 
;; (defun my-jde-mode-hook ()
;;   (setq c-basic-offset 2))
;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)
;;  
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Load verilog mode only when needed
;; ;; (autoload 'verilog-mode "verilog-mode" "Verilog mode" t ) 
;; ;; (autoload 'verilog-mode "/home/dpappas/emacs/verilog-mode" "Verilog mode" t ) 
;; ;; (load-file "/home/dpappas/emacs/verilog-mode.el" ) 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; ;(load-file "~/emacs/csv-mode.el" ) 
;; (load-file "~/emacs/stringtemplate.el" ) 
;; ;;(load-file "~/emacs/modes.el" ) 
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Any files that end in .v should be in verilog mode
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; (setq auto-mode-alist
;; 	  (append '(("\\.v$"    . verilog-mode)
;;                     ("\\.vpp$"  . verilog-mode)
;;                     ("\\.vt$"   . verilog-mode)
;;                     ("\\.vh$"   . verilog-mode)
;;                     ("\\.vf$"   . verilog-mode)
;;                     ("\\.gv$"   . verilog-mode)
;;                     ("\\.vlib$" . verilog-mode)
;;                     ("\\.bvrl$" . verilog-mode)
;;                     ("\\.mc$"   . verilog-mode)
;;                     ("\\.scr$"  . verilog-mode)
;;                     ("\\.con$"  . verilog-mode)
;;                     ("akefile.inc$"   . makefile-mode)
;;                     ) auto-mode-alist))
;; 
;; (setq verilog-indent-level             3
;;       verilog-indent-level-module      0
;;       verilog-indent-level-declaration 0
;;       verilog-indent-level-behavioral  3
;;       verilog-case-indent              2
;;       verilog-auto-newline             nil
;;       verilog-auto-indent-on-newline   t
;;       verilog-tab-always-indent        t
;;       verilog-auto-endcomments         t
;;       verilog-minimum-comment-distance 40
;;       verilog-indent-begin-after-if    nil
;;       verilog-auto-lineup              '(all))
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Any files in verilog mode should have their keywords colorized
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; (add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))
;; 
;; ;;;;;;;;;;;;;;;;;
;; ; add more hooks here
;; ;;;;;;;;;;;;;;;;;
;; 
;; (put 'save-buffers-kill-emacs 'disabled nil)
;; 
;; 
;; ;;;;;;;;;;;;;;;;;
;; ; auto completion
;; ;;;;;;;;;;;;;;;;;
;; 
;;(require 'dabbrev)
;;(setq dabbrev-always-check-other-buffers t)
;;(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
 
;;(global-set-key "\C-i" 'my-tab)
 
;; (defun my-tab (&optional pre-arg)
;;   "If preceeding character is part of a word then dabbrev-expand,
;; else if right of non whitespace on line then tab-to-tab-stop or
;; indent-relative, else if last command was a tab or return then dedent
;; one step, else indent 'correctly'"
;;   (interactive "*P")
;;   (cond ((= (char-syntax (preceding-char)) ?w)
;;          (let ((case-fold-search t)) (dabbrev-expand pre-arg)))
;;         ((> (current-column) (current-indentation))
;;          (indent-relative))
;;         (t (indent-according-to-mode)))
;;   (setq this-command 'my-tab))
 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Language hooks
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; (add-hook 'html-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-i"     'my-tab)))
;; (add-hook 'sgml-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-i"     'my-tab)))
;; (add-hook 'perl-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-i"     'my-tab)))
;; (add-hook 'text-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-i"     'my-tab)))
;; (add-hook 'java-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-i"     'my-tab)))
;; 


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; add more hooks here
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(put 'downcase-region 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(show-paren-mode t)
 '(transient-mark-mode t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To ensure Java recognition in Emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 (setq auto-mode-alist
         (cons '("\\.java$" . java-mode) 
    auto-mode-alist))
   
   (setq interpreter-mode-alist
        (cons '("java" . java-mode)
    interpreter-mode-alist))

(defun my-c-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; Make Emacs load JDE
;
;;(setq load-path nil)
;; Make Emacs "see" the elisp packages installed
;;(setq load-path
;;      (append (list (expand-file-name "~/emacs/jde/lisp")
;;		    (expand-file-name "~/emacs/semantic")
;;		    (expand-file-name "~/emacs/speedbar")
;;		    (expand-file-name "~/emacs/elib")
;;		    "~/emacs/eieio")
;;		    load-path))
;; Make Emacs load JDE
;;(require 'jde)

;; Getting autocompletion of java methods of an object
;;(global-set-key "\M--" 'jde-complete-at-point) 

;; Getting a list of available java methods of an object
;;(global-set-key "\M-_" 'jde-complete-at-point-menu) 

;;(require 'floatbg)
;;(floatbg-mode t)

(setq auto-mode-alist
      (append '(("\\.st$"  . html-mode)
		) auto-mode-alist))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; Load the ctags file
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (file-exists-p "~/emacs/vtags.el")
    (load-file "~/emacs/vtags.el"))
(put 'upcase-region 'disabled nil)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; Load the scala files
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fix me ;; (add-to-list 'load-path "~/.emacs.d/site-lisp/scala-emacs")
;; Fix me ;; (require 'scala-mode-auto)
;; Fix me ;; 
;; Fix me ;; (add-hook 'scala-mode-hook
;; Fix me ;;             '(lambda ()
;; Fix me ;; 	       (scala-mode-feature-electric-mode)
;; Fix me ;;                ))
;; Fix me ;; 
;; Fix me ;; ;; load ensime for scala
;; Fix me ;; 
;; Fix me ;; (require 'scala-mode)
;; Fix me ;; (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;; Fix me ;; (add-to-list 'load-path "~/.emacs.d/site-lisp/ensime/elisp/")
;; Fix me ;; (require 'ensime)
;; Fix me ;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; Fix me ;; 
;; Fix me ;; ;; enable ensime
;; Fix me ;; 
;; Fix me ;; ;; (push "/media/data/tools/scala/scala/bin/" exec-path)
;; Fix me ;; ;; (push "/media/data/tools/sbt/" exec-path)
;; Fix me ;; 
;; Fix me ;; (push "/Applications/typesafe-stack/bin" exec-path)
;; Fix me ;; (push "/opt/homebrew/bin/sbt" exec-path)
;; Fix me ;; 
;; Fix me ;; ;; Erlang-mode
;; Fix me ;; (require 'erlang-start)
;; Fix me ;; (add-to-hook 'erlang-mode-hook
;; Fix me ;;              (lambda ()
;; Fix me ;;             ;; when starting an Erlang shell in Emacs, the node name
;; Fix me ;;             ;; by default should be "emacs"
;; Fix me ;;             (setq inferior-erlang-machine-options '("-sname" "emacs"))
;; Fix me ;;             ;; add Erlang functions to an imenu menu
;; Fix me ;;             (imenu-add-to-menubar "imenu")))
;; Fix me ;; 
;; Fix me ;; 


(require 'auto-complete)  
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB setup
;; http://stackoverflow.com/questions/9998202/first-steps-after-activating-ecb-first-time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; fix me ;;  (require 'semantic/analyze)
;; fix me ;;  (provide 'semantic-analyze)
;; fix me ;;  (provide 'semantic-ctxt)
;; fix me ;;  (provide 'semanticdb)
;; fix me ;;  (provide 'semanticdb-find)
;; fix me ;;  (provide 'semanticdb-mode)
;; fix me ;;  (provide 'semantic-load)
;; fix me ;;  (semantic-mode 1)
;; fix me ;;   
;; (require 'ecb)
;; (require 'ecb-autoloads)
;; 
;; (setq ecb-auto-activate 1) 
;; ;; fix me ;; (ecb-winman-winring-enable-support)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python Django
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x j") 'python-django-open-project)


(require 'transpar)
(global-set-key (kbd "C-c C-x") 'transpose-paragraph-as-table)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(if (file-exists-p "~/.emacs_custom")
    (load-file "~/.emacs_custom"))

 (global-font-lock-mode t)
