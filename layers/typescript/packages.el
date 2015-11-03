(defvar typescript-packages
  '(
    typescript-mode
    tide
    ))

(defun typescript/init-typescript-mode ()
    (use-package typescript-mode))

(defun typescript/init-tide ()
  (use-package tide
    :init
    (progn
      (add-hook 'typescript-mode-hook
                (lambda ()
                  (tide-setup)
                  (flycheck-mode +1)
                  (setq flycheck-check-syntax-automatically '(save mode-enabled))
                  (eldoc-mode +1)
                  (company-mode-on)))
      (evil-set-initial-state 'tide-references-mode 'emacs)
      (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
      (add-hook 'web-mode-hook
                (lambda ()
                  (when (string-equal "tsx" (file-name-extension buffer-file-name))
                    (tide-setup)
                    (flycheck-mode +1)
                    (setq flycheck-check-syntax-automatically '(save mode-enabled))
                    (eldoc-mode +1)
                    (company-mode-on))))
      (evil-leader/set-key-for-mode 'typescript-mode
        "mgg" 'tide-jump-to-definition
        "mgb" 'tide-jump-back))))
