;; Custom shortcuts

(when is-mac
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(if window-system
    (progn
      (windmove-default-keybindings 'meta)
      (global-set-key [(alt left)]  'windmove-left)
      (global-set-key [(alt up)]    'windmove-up)
      (global-set-key [(alt right)] 'windmove-right)
      (global-set-key [(alt down)]  'windmove-down)))

(global-set-key [C-kanji] 'set-mark-command)
(global-set-key (kbd "C-/") 'comment-dwim)

(helm-mode 1)
(global-set-key [(meta x)] 'helm-M-x)
(global-set-key [(meta s)] 'helm-ag)

(global-set-key [(meta p)] 'backward-paragraph)
(global-set-key [(meta n)] 'forward-paragraph)

(global-set-key (kbd "C-M-h") 'query-replace-regexp)

(global-set-key (kbd "C-x C-x") 'neotree-toggle)
(global-set-key (kbd "C-x C-z") 'neotree-change-root)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-M-p") 'helm-projectile)
(global-set-key (kbd "C-M-f") 'helm-projectile-ag)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c C-c SPC") 'ace-jump-line-mode)
