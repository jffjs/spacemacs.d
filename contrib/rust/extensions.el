;; Pre extensions are loaded *before* the packages
(defvar rust-pre-extensions
  '(
    ))

;; Post extensions are loaded *after* the packages
(defvar rust-post-extensions
  '(
    racer
    ))

(defun rust/init-racer ()
  (use-package racer
    :init
    (progn
      (setq racer-rust-src-path "/usr/local/src/rust/src/")
      (setq racer-cmd "/usr/local/src/racer/target/release/racer"))))
