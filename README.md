Mnist - Lush
------------

Esse projeto é o trabalho da disciplina de Inteligência Artificial (IA), o objetivo é classificar dígitos manuscritos [0-9]. Mnist é um conjunto de imagens manuscritas e seus respectivos labels. Os conjuntos base de treinamente e testes, devem ser baixados no site "THE MNIST DATABASE of handwritten digits", http://yann.lecun.com/exdb/mnist/. Faça o download dos 4 arquivos, os dois primeiros serão usados para treinar a rede e os dois últimos serão usados em testes. Siga as instruções do site para descompactá-los.
  
Todos as entradas serão imagens 28x28 pixels.

Requisitos
---------

  - [1] Lush, disponível em: http://lush.sourceforge.net/. Lush is an object-oriented programming language designed for researchers, experimenters, and engineers interested in large-scale numerical and graphic applications.
  
  - [2] Racket Language, disponível em: http://racket-lang.org/. Racket is a full-spectrum programming language. It goes beyond Lisp and Scheme with dialects that support objects, types, laziness, and more. 
  
Transformação de imagens
------------------------

Programa em Racket Language. Programa auxiliar para transformar uma imagem .png de um único canal, em um padrão que será quebrado no programa principal. Alterar os diretórios base, as variáveis *png-path* e *mnist-path* no programa transformaImagens.rkt.
  
  $ racket 
  Welcome to Racket v6.2.1.
  > (load "transformaImagens.rkt")
  > (enter! "transformaImagens.rkt")
  
Crie uma imagem .png, por exemplo, no GIMP (GNU Image Manipulation Program), desenhando um número de 0 a 9. Nomeie o arquivo com <digito-desenhado>.png. Lembrando sempre que esse arquivo deve ter 28x28 pixels. Considere o arquivo 0.png, disponível na pasta imagens.
  
  > ;(png->mnist "<digito>.png" "<extenção-mnist>")
  > (png->mnist "0.png" "ccs")
  
O arquivo "0.ccs" foi criado na mnist, ele tem um padrão proprio para ser quebrado no programa principal.
  
Programa principal
------------------
  
Programa em Lush. Implementação da rede neural, ou melhor 'Convolutional Neural Networks' (ConvNets), rede adaptada para processar imagens, usa o método Backpropagation (http://www.icmc.usp.br/~andre/research/neural/MLP.htm), para realizar o treinamento supervisionado, com "gradient-based training". O software usa a biblioteca "gblearn", disponível por padrão nas atuais versões do Lush.
    
Alterar os caminhos, *mnist-path* e *arq-path*, arquivo "mnistCecilia.lsh".
    
Treinando a rede com 60000.

  ? (load "mnistCecilia.lsh")
  ? ;(defvar <nome-rede> (mnist-main <qtdd-imagens-treinar>))
  ? (defvar rede (mnist-main 60000))
  Rede treinada com 60000 imagens.
  
  = rede
    
  realtime = = 1097.647s aproximadamente 19 min
  
Testando a rede treinada. Foram implementados 3 tipos de testes.

* Porcentagem de acertos

Dada uma quantidade de imagens de entrada, em quantas a rede acertou o digito desenhado.

   ? ;(<nome-rede> <qtdd-imagens-teste>)
   ? (rede 100)
     Testando a rede para 100 imagens.
     [60000]  size=100  energy=0.0514  correct=100.00%  errors=0.00%  rejects=0.00%
     = ()
   ? (rede 1000)
     Testando a rede para 1000 imagens.
     [60000]  size=1000  energy=0.0784  correct=99.00%  errors=1.00%  rejects=0.00%
     = ()
 
* Imagem do banco de teste

Verificar a resposta da rede para uma imagem específica no banco de teste.
   
   ? ;(<nome-rede> <qtdd-imagens-teste> <imagem-desejada>)
   ? (rede 100 23)
     Testando o elemento 23 do arquivo t10k-images.
    "Imagem:"
    <visualização do número>
    Esperado = 5   |   Obtido = 5 
    = ()

* Imagem criada localmente

Testar uma imagem criada localmente, traduzida usando o programa "transformaImagem.rkt".
    
   ? ;(<nome-rede> <qtdd-imagens-teste> <digito>.<extensão>)
   ? (rede 100 "0.ccs")
     (("7.ccs" 19) ("9.vlq" 18) ("5.ccs" 17) ("0.vlq" 16) ("6.vlq" 15) ("3.vlq" 14) ("8.ccs" 13) ("5.vlq" 12) ("9.ccs" 11) ("3.ccs" 10) ("1.vlq" 9) ("7.vlq" 8) ("2.ccs" 7) ("6.ccs" 6) ("0.ccs" 5) ("8.vlq" 4) ("4.vlq" 3) ("4.ccs" 2) ("1.ccs" 1))
     Testando o elemento 0.ccs do arquivo t10k-images.
    "Imagem:"
    <visualização número>
    Esperado = 0   |   Obtido = 0 
    = ()
