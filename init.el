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
(setq package-check-signature nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
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
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "SRC" :family "Hack Nerd Font Mono")))))

(add-hook 'emacs-startup-hook 'treemacs)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(load-theme 'monokai t)

;; Load config.org for init.el configuration
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(async beacon ccls cmake-mode company-auctex company-box
		   company-prescient company-reftex csharp-mode dashboard
		   diminish dockerfile-mode evil-org flycheck geiser-mit ghub
		   go-mode helpful highlight-indent-guides htmlize
		   ido-vertical-mode jenkinsfile-mode json-mode lsp-pyright
		   lsp-treemacs lsp-ui multi-vterm nginx-mode page-break-lines
		   powershell projectile pyvenv ranger slime spaceline sqlite3
		   swiper switch-window systemd terraform-mode toc-org
		   treemacs-evil treemacs-icons-dired treemacs-magit treepy
		   undo-tree use-package web-mode which-key yaml-mode)))
