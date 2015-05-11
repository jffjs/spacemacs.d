;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/spacemacs.d/contrib/")
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '(clojure company-mode git html javascript js-extra nim restclient ruby rust)
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
)

;; Settings
;; --------

(setq-default
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'solarized-light
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non nil pressing 'jk' in insert state, ido or helm will activate the
 ;; evil leader.
 dotspacemacs-feature-toggle-leader-on-jk nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
)

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  ;; (global-aggressive-indent-mode 1)
  (menu-bar-mode +1)
  (set-default-font "Inconsolata-16")
  (set-default 'truncate-lines t)
  (setq-default indent-tabs-mode nil)
  (setq tab-width 2)
  (setq powerline-default-separator nil)
  (add-hook 'emacs-lisp-mode-hook 'evil-lisp-state)

  (evil-leader/set-key-for-mode 'org-mode
    "mt" 'org-show-todo-tree
    "ma" 'org-agenda
    "mA" 'org-archive-subtree
    "mo" 'org-open-at-point
    "mC" 'evil-org-recompute-clocks)

  (evil-leader/set-key
    "]" 'indent-region)

  (add-hook 'markdown-mode-hook 'turn-on-auto-fill)

  ;; turn off scss compilation
  (setq scss-compile-at-save nil)
  (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
  )

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(css-indent-offset 2)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-indent-switch-body t)
 '(magit-use-overlays nil)
 '(ring-bell-function (quote ignore) t)
 '(rust-indent-method-chain nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
