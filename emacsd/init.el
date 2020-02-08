; ==== this.ajk@gmail.com ====
; ==== .emacs.d/init.el ====


; ==== User defined config. ====
  ; ==== Add path to enviornment ====
      (defun eshell-mode-hook-func ()
        ( setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env))

        ( setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
        
        ( define-key eshell-mode-map (kbd "M-s") 'other-window-or-split)
      )
      
      (add-hook 'eshell-mode-hook 'eshell-mode-hook-func)
  ; --------------------------------- 

  ; ==== MELPA package support ====
      ;Enables basic packaging support
        (require 'package)
      ;

      ;Adds the Melpa archive to the list of available repositories
        (add-to-list 'package-archives
                  '("melpa" . "http://melpa.org/packages/") t
        )
      ;

      ;Initializes the package infrastructure
        (package-initialize)
      ;

      ;If there are no archived package contents, refresh them
        (when (not package-archive-contents)
        (package-refresh-contents))
      ;  
  ; --------------------------------

  ; ==== Standard el-get setup ====
    ; (See also: https://github.com/dimitri/el-get#basic-setup)
      (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

      (unless (require 'el-get nil 'noerror)
        (with-current-buffer
            (url-retrieve-synchronously
            "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
          (goto-char (point-max))
          (eval-print-last-sexp)
        )
      )
    ;
      (el-get 'sync)
  ;

  ; ==== Scans the list in myPackages ==== 
    ; ==== Installs packages ====
        (defvar myPackages
          '(better-defaults                 ;; Set up some better Emacs defaults
            material-theme                  ;; Theme
           )
        )      
    ; 
  ;
  
  ; ==== Basic Customization ====
     ;;(setq inhibit-startup-message t)    ;; Hide the startup message
      (load-theme 'material t)            ;; Load material theme
      (global-linum-mode t)               ;; Enable line numbers globally
    ;   
  ;

  ; ==== Theme config. ====
    ;;(add-to-list 'custom-theme-load-path "/Users/ajk/.emacs.d/themes")
    ;;(load-theme 'dracula t)  
  ;

  ; ==== Development setup ====
    ; ==== jedi auto-complete ====
      ;; (setq 'jedi:server-command 
          ;; '("/usr/local/bin/python" "/Users/ajk/.emacs.d/elpa/jedi-core-20191011.1750/jediepcserver.py"))
    ;          
    
    ; ==== Standard Jedi.el setting ====
          (add-hook 'python-mode-hook 'jedi:setup)
          (setq jedi:complete-on-dot t)
      ;
    ;
  ;  

; -------------------------------------------------



; ==== #Standard config. using Emacs standard gui interface  ==== 
  (custom-set-variables
      ;custom-set-variables was added by Custom.
      ;If you edit it by hand, you could mess it up, so be careful.
      ;Your init file should contain only one such instance.
      ;If there is more than one, they won't work right.
        '(display-line-numbers-type (quote relative))
        
        '(package-selected-packages
              (
                quote (elpy el-get jedi-direx jedi material-theme better-defaults)
              )
         )
          
       '(scroll-bar-mode nil)
       '(tool-bar-mode nil)
  )
      
  (custom-set-faces)
    ;custom-set-faces was added by Custom.
    ;If you edit it by hand, you could mess it up, so be careful.
    ;Your init file should contain only one such instance.
    ;If there is more than one, they won't work right. 

; ------------------------
