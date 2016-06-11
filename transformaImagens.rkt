#lang racket

;;trabalho IA, mnist

(require 2htdp/image)

(define *png-path* "/home/cecilia/Dropbox/8periodo/ia/nn/imagens/")
(define *mnist-path* "/home/cecilia/Dropbox/8periodo/ia/nn/mnist/")

(define (png->mnist file extensao)
  (let [(listaPixel (image->color-list (bitmap/file (string-append *png-path* file))))]
    (let [(label (car (regexp-match #rx"[0-9]" file)))]
      (cond [(= (length listaPixel) (* 28 28))
             (call-with-output-file (string-append *mnist-path* label "." extensao)
               #:exists 'replace
                 (lambda(p)
                   (for [(i (in-range 0 27))]
                     (for [(j (in-range 0 27))]
                       (let* [;(pixel (list-ref listaPixel (+ i (* 28 j))))
                              (pixel (list-ref listaPixel (+ (* 28 i) j)))
                              (corFundoBranco (color-red pixel));;escala de cinza, tds iguais
                              (corFundoPreto (- 255 corFundoBranco))]
                         (display (~a corFundoPreto ";") p)
                         ))
                     (let* [(pixel (list-ref listaPixel (+ (* 28 i) 27)))
                            (corFundoBranco (color-red pixel));;escala de cinza, tds iguais
                            (corFundoPreto (- 255 corFundoBranco))]
                       (display (~a corFundoPreto) p)
                       (displayln "" p)
                       )
                     )
                   ))]
            ))))

