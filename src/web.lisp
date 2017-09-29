(in-package :cl-user)
(defpackage futsukayoi.web
  (:use :cl
        :caveman2
        :futsukayoi.config
        :futsukayoi.view
        :futsukayoi.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :futsukayoi.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

(defroute ("/futsukayoi" :method :POST) (&key |is-futsukayoi|)
  (save-futsukayoi-result (or |is-futsukayoi| 0))
  (render #P"index.html"))

(defroute ("/drink" :method :POST) (&key |drink-name|)
  (save-drinking-result |drink-name|)
  (render #P"index.html"))
;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))

(defun save-futsukayoi-result (is-futsukayoi)
  (let ((timestamp (local-time:timestamp- (local-time:now) 1 :day)))
    (with-connection (db)
      (execute (insert-into :futsukayoi (set= :dead is-futsukayoi :dt timestamp)
                 (on-duplicate-key-update :dead is-futsukayoi))))))

(defun save-drinking-result (drink)
  (let ((timestamp (local-time:now)))
    (with-connection (db)
      (execute (insert-into :drinking (set= :drink drink :dt timestamp))))))
