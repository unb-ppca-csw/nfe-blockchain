# reconhechain
Implementação utilizando blockchain do sistema "Reconhecer" do TCU.

## Introdução
O TCU possui o programa ["reconhecer"](http://www.tcu.gov.br/Consultas/Juris/Docs/judoc/PORTN/20120706/PRT2012-146.doc) que funciona como um programa de pontos no qual servidores são recompensados pelo desenvolvimento de atividades que gerem valor para o Órgão.

Por exemplo, a participação em um projeto inovador rende uma quantidade x de pontos, uma avaliação de desempenho positiva gera uma quantidade y de pontos, e assim por diante.

Os servidores possuidores dos pontos podem ofertá-los em troca de benefícios como possibilidade de falta ao trabalho, reembolso para curso de idiomas, etc.

O objetivo deste trabalho é ser um primeiro esboço da utilização do [multichain](http://www.multichain.com/), uma implementação de blockchain na gestão dos pontos do programa reconhecer do TCU.

## Requisitos
- [Git](https://git-scm.com/)

- [Docker](https://www.docker.com/)

- Conexão com a Internet


## Instalação

#### Passo 1: Clonar o projeto a partir do GitHub e acessar a pasta correspondente:
- `git clone https://github.com/wweellddeerr/reconhechain.git`
- `cd reconhechain`

#### Passo 2: Criar uma rede interna docker chamada 'blockchain' para simular os múltiplos nós da rede
- `docker network create --subnet=172.20.0.0/16 blockchain`

#### Passo 3: Construir a imagem docker do nó que será [proprietário dos tokens](http://www.multichain.com/download/MultiChain-White-Paper.pdf) (pontos) do blockchain
- `docker build -t reconhechain .`

#### Passo 4: Construir a imagem docker de um segundo nó para ser utilizado em uma transação de transferência de pontos:
- `docker build -t segundo_no -f segundo_no .`

## Execução

#### Passo 1: Executar o container do nó proprietário a partir da imagem criada:
- `docker run --network=blockchain --ip=172.20.0.5 -it reconhechain`

#### Passo 2: **Em uma nova sessão de terminal** executar o blockchain do segundo nó, para ter os dois nós executando concomitantemente:
- `docker run --network=blockchain --ip=172.20.0.6 -it segundo_no`

## ** No primeiro container (proprietário): **

#### Passo 3: Criar o blockchain:
- `rchain-criar` 

#### Passo 4: Verificar saldo de pontos zerado:
- `rchain-saldo`

#### Passo 5: Adicionar 1000 pontos (este nó pode pois é o owner do blockchain)
- `rchain-add-pontos 1000`

#### Passo 6: Verificar saldo de pontos atualizado:
- `rchain-saldo`

## ** No segundo container: **

#### Passo 7: Conectar ao blockchain:
- `rchain-conectar`

#### Passo 8: Verificar saldo de pontos zerado:
- `rchain-saldo`

#### Passo 9: Obter endereco da wallet para receber pontos (copie o resultado da execução do comando):
- `rchain-meu-endereco`

## ** No primeiro container **
#### Passo 10: Transferir 500 pontos para o segundo nó:
- `rchain-transferir 500 **coloque_aqui_o_endereco_do_segundo_no**`

#### Passo 11: Consultar saldo atualizado:
- `rchain-saldo`

#### Passo 12: Ver detalhes das transações realizadas (criação de pontos, transferência de pontos)
- `rchain-detalhar-transacoes`

## ** No segundo container **
#### Passo 13: Consultar saldo atualizado
- `rchain-saldo`


# FIM
