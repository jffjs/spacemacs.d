(defvar rust-packages
  '(
    flycheck-rust
    rust-mode
    ))

(defun rust/init-rust-mode ()
  (use-package rust-mode
    :init
    (progn
      (eval-after-load 'flycheck
        '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
      (add-hook 'rust-mode-hook (lambda ()
                                  (flycheck-mode))))))
