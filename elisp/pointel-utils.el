(defun read-lines (file_path)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents file_path)
      (split-string (buffer-string) "\n" t)))

(defun eshell-new ()
  "Creates a new eshell buffer."
  (interactive)
  (eshell t))

(defun window-bigger ()
  "Make window bigger."
  (interactive)
  (enlarge-window 3))

(defun window-lesser ()
  "Make window lesser."
  (interactive)
  (enlarge-window -3))

(defun indent-buffer ()
  "Indent the contents of a buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))