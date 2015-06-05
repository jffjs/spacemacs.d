(defvar rust-packages
  '(
    flycheck-rust
    rust-mode
    ))

(defun rust/init-rust-mode ()
  (use-package rust-mode
    :init
    (progn
      (setq racer-rust-src-path "/usr/local/src/rust/src/")
      (setq racer-cmd "/usr/local/src/racer/target/release/racer")
      (eval-after-load "rust-mode" '(require 'racer))
      (add-hook 'rust-mode-hook (lambda ()
                                  (flycheck-mode)))
      (evil-leader/set-key-for-mode 'rust-mode
        "." 'racer-find-definition))
    ))

(defun rust/init-flycheck-rust ()
  (use-package flycheck-rust
    :init
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
    ))
