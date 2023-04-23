;; Make emacs startup faster
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)
 
(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
 
(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))
 
(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
    gc-cons-percentage 0.1))
 
(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;; Initialize melpa repo
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
        '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Global package-ensure behavior
(require 'use-package-ensure)
  (setq use-package-always-ensure t)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "SRC" :family "Hack Nerd Font Mono")))))

;; Load Witchmacs theme
(load-theme 'Witchmacs t)

;; Load config.org for init.el configuration
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(systemd dockerfile-mode web-mode ranger toc-org geiser-mit terraform-mode ghub treemacs-magit magit company-reftex company-auctex auctex yaml-mode json-mode go-mode helpful slime lsp-pyright cmake-mode ccls sqlite3 company-prescient company-box company lsp-treemacs lsp-ui lsp-mode flycheck yasnippet projectile ido-vertical-mode treemacs-icons-dired treemacs-evil treemacs undo-tree page-break-lines async switch-window beacon swiper which-key dashboard spaceline diminish auto-package-update vterm evil-org htmlize use-package))
 '(warning-suppress-types '((comp))))
