(defun read-lines (file_path)
    "Return a list of lines of a file at filePath."
    (with-temp-buffer
      (insert-file-contents file_path)
      (split-string (buffer-string) "\n" t)))

(defun eshell-new ()
  "Creates a new eshell buffer."
  (interactive)
  (eshell t))

(defun window-ver-bigger ()
  "Make window bigger."
  (interactive)
  (enlarge-window 5))

(defun window-ver-lesser ()
  "Make window vertically lesser."
  (interactive)
  (enlarge-window -5))

(defun window-hor-bigger ()
  "Make window horizontally bigger."
  (interactive)
  (enlarge-window-horizontally 10))

(defun window-hor-lesser ()
  "Make window horizontally lesser."
  (interactive)
  (enlarge-window-horizontally -10))

(defun custom-tab-settings ()
  "Sets the custom tab settings."
  (setq indent-tabs-mode t)
  (setq tab-width 2)
  (setq indent-line-function 'insert-tab)
  (setq tab-stop-list (number-sequence 2 180 2)))  

(defun indent-buffer ()
  "Indent the contents of a buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
	(indent-region (point-min) (point-max) nil)
	(untabify (point-min) (point-max))))

(defun indent-shift-region (distance)
  "Indents the selected region by the distance ARG."
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      (setq deactivate-mark nil))))

(defun indent-shift-right ()
  "Indents the selected region by +2 characters."
  (interactive)
  (indent-shift-region 2))

(defun indent-shift-left ()
  "Indents the selected region by -2 characters."
  (interactive)
  (indent-shift-region -2))

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

(defun next-code-buffer ()
  "Switch to the next code buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (next-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not (equal bread-crumb (buffer-name))))
      (next-buffer))))

(defun previous-code-buffer ()
  "Switch to the previous code buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (previous-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
         (not (equal bread-crumb (buffer-name))))
      (previous-buffer))))

(defun dashboard-display ()
  "Switch to the dashboard buffer."
  (interactive)
  (switch-to-buffer "*dashboard*"))

(defun evil-forward-WORD-and-char ()
  "Jumps to the WORD ends plus a char."
  (interactive)
  (evil-forward-WORD-end)
  (evil-forward-char))

(defun evil-forward-word-and-char ()
  "Jumps to the word ends plus a char."
  (interactive)
  (evil-forward-word-end)
  (evil-forward-char))
