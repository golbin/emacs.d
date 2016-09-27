(require 'package)

(setq package-archives '(("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(defvar my-packages
  '(
    helm
    helm-ag
    helm-projectile
    neotree
    company
    yasnippet
    ace-jump-mode
    markdown-mode
    magit
    restclient
    exec-path-from-shell
    sublime-themes
    go-mode
    company-go
    php-mode
    js2-mode
    ))

(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-packages)
  (require p))

(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

(setq make-backup-files nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(electric-pair-mode 1)

;; Themes
(require 'sublime-themes)
(load-theme 'brin t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco")))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq initial-frame-alist '((width . 100) (height . 50)))
(setq default-frame-alist '((width . 100) (height . 50)))

(setq-default neo-smart-open t)
(setq neo-theme 'ascii)
(setq neo-window-width 25)
;; (setq neo-vc-integration '(face char))

;; Projectile
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

(defun helm-projectile-ag ()
  (interactive)
  (helm-ag (projectile-project-root)))

(setq projectile-switch-project-action 'neotree-projectile-action)

;; For macOS
(setq is-mac (equal system-type 'darwin))

;; Setup environment variables from the user's shell.
(when is-mac
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; Load custom shortcuts
(load (expand-file-name "shortcuts.el" user-emacs-directory))

;; Load custom settings from user directory
(defun load-elisp-dir (elisp-dir)
  (dolist (file (directory-files elisp-dir t "\\w+"))
    (when (file-regular-p file)
      (load file))))

(load-elisp-dir (expand-file-name "langs" user-emacs-directory))
(load-elisp-dir (expand-file-name "utils" user-emacs-directory))
