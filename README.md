# nfe-blockchain 
## Sistema de Armazenamento de Notas Fiscais Eletrônicas (nfe) usando Blockchain
Sistema para armazenamento de Notas Fiscais emitidas por pessoas físicas ou jurídicas para pessoas físicas ou jurídicas em formato de blockchain.

Este texto aborda sobre uma proposta de sistema para armazenamento de Notas Fiscais emitidas por pessoas físicas ou jurídicas para pessoas físicas ou jurídicas em formato de blockchain

# 1. Contexto da Organização: SERPRO
O Serpro é o principal provedor de soluções tecnológicas para o Estado brasileiro. Há mais de 50 anos, desenvolve sistemas estratégicos que suportam ações estruturantes do governo e que são reconhecidos na sociedade. A empresa oferece ao governo soluções, cada vez mais, inovadoras, ágeis e efetivas para atender ao Estado e ao cidadão com eficiência, tendo como missão "Conectar governo e sociedade por meio de soluções digitais".

A Receita Federal do Brasil exerce a gestão tributária e atualmente conta com soluções de TI desenvolvidas e administradas pelo Serpro.
Um dos serviços que são oferecidos pelo Serpro é o Imposto sobre a Renda da Pessoa Física e nasceu com a missão de informatizar a arrecadação no país.

# 2. Problema

Todo ano os cidadãos brasileiros ou residentes no país que estão fora dos critérios de isenção (http://irpf2017.org/imposto-de-renda-2017-quem-deve-declarar/) devem fazer a declaração anual de Imposto de Renda de Pessoa Física. Apesar de já existir uma iniciativa que facilita o trabalho do contribuinte (declaração pré-preenchida: descrito na seção 3), atualmente ainda é uma atividade cansativa e sujeita a erros que muitas vezes requer do contribuinte o armazenamento e organização dos recibos de serviços que podem incidir em desconto no Imposto de Renda, como gastos com saúde e educação, dentre outros. 

# 3. Soluções já experimentadas

Atualmente a Receita Federal já gera a declaração pré-preenchida contendo os dados que já recebe de alguns órgãos, como os dados relacionados aos proventos recebidos pelo declarante: dados fornecidos pelas empresas diretamente à Receita Federal. No entanto, muitos dados que o contribuinte costuma declarar ficam fora desse sistema e tornam-se do interesse do contribuinte declará-los: principalmente os que incidem em desconto no Imposto de Renda, como recibos de pagamentos por prestação de serviços com saúde: médico e dentista, bem como serviços de instrução: cursos técnicos, idioma, escola ou faculdade do titular ou dependentes.

# 4. Proposta de uso de blockchain para a resolução do problema

Devido as características da tecnologia de blockchain, essa tecnologia será muito muito útil para a implementação do controle de trocas de emissão de notas fiscais, permitindo que seus usuários usufruam dos seguintes atributos:
- disponibilidade - por estar disposto de forma distribuída na rede permitindo uma descentralização dos registros
- distribuição do banco de dados - na arquitetura tradicional centralizada, os bancos de dados necessitam concentrar um grande número de informações a fim de conseguir um nível aceitável de confiança nas transações. Desta forma, a implementação do blockchain permite reduzir o tamanho do banco de dados necessário para controlar e garantir a confiança dos usuários.
- segurança - com o modelo de banco de dados distribuído e com o uso de criptografia de chaves públicas para garantir a segurança das transações, é possível garantir um nível de segurança adequado.

A proposta é armazenar os dados de trocas de recibos entre pessoas (físicas ou jurídicas) em uma base de dados distribuída baseada em blockchain. Um dos nós da rede pode estar sob gestão do SERPRO (não restrito ao órgão), considerando que podem estar distribuídos entre vários nós, desde a secretaria de receita dos Estados, bem como entidades privadas que atuam no provimento de soluções de emissão de recibos, entre outros serviços relacionados.

# 5. Possíveis impactos de adoção da tecnologia proposta

A proposta pode trazer como consequência os seguintes impactos positivos:
- Ao integrar os dados providos pela solução, poderá prover maior facilidade para o contribuínte no momento de gerar a declaração de imposto de renda, tendo em vista que o sistema da Receita Federal (produzido pelo SERPRO) poderá prover a declaração pré-preenchida já com a consolidação dos dados dos receibos registrados presentes na rede blockchain.
- Armazém digital de recibos que permite às pessoas acessarem com mais facilidade os recibos que porventura possam comprovar o pagamento de determinado produto ou serviço, tanto para fins de auditoria tributária/fiscal, como para fins de comprovação judicial

A seguir uma lista de aspectos negativos previstos da proposta que precisam ser tratados:
- Uma vez que as informações de transferências de valores financeiros ficam registrados na blockchain, é necessário criar mecanismos que mascarem as informações do emitente e do receptor, permitindo que apenas quem emitiu e quem recebeu os recibos possam ter acesso a essas informações, tendo em vista que os dados da nota fiscal armazenadas no formato json são registradas.
- Uma solução é encriptar as informações de forma que apenas o emitente, o receptor e a receita federal possam desencriptar estas informações. A proposta apresentada no link abaixo aparenta ser uma solução razoável para este problema:
http://www.multichain.com/developers/stream-confidentiality/

# 6. Prova de Conceito utilizando solução Multichain

* A solução de implementação do blockchain é o multichain
http://www.multichain.com

* Todos os scripts da solução estão presents na pasta [/docker/bin(docker/bin).

# 6.1 Instalação do Multichain
Manual de instalação em ambiente Linux:

Para execução desse projeto foi criado uma máquina virtual Docker já configurada para executar as instruções de exemplo, mas a seguir está o passo-a-passo de como instalar a solução multichain em cada nó de interação.

> Como super usuário ou usuário sudo execute os seguintes comandos:
```
#wget http://www.multichain.com/download/multichain-1.0-beta-2.tar.gz
#tar -xvzf multichain-1.0-beta-2.tar.gz
#cd multichain-1.0-beta-2
#cp multichaind multichain-cli multichain-util /usr/local/bin
```
>Obs.: Caso for utilizar as máquinas docker este passo torna-se desnecessário.

# 6.2 Preparação do ambiente com container Docker para executar o Blockchain

- **Passo 1**: Clonar o projeto a partir do GitHub e acessar a pasta correspondente:
```
git clone https://github.com/unb-ppca-construcao-de-software-2017/nfe-blockchain.git
cd nfe-blockchain
```

>OBS.: As operações a seguir devem ser executadas como root ou com **sudo**.

- **Passo 2**: Criar uma rede interna docker chamada 'nfechainnetwork' para simular os múltiplos nós da rede
> Vá até a pasta docker [/docker](docker) e execute os seguintes comandos:
```
#docker network create --subnet=192.168.0.0/16 nfechainnetwork
```
>para facilitar vá até a pasta [/docker](docker) e execute o script **create_docker_network.sh**

- **Passo 3**: Passo 3: Construir a imagem docker
> Vá até a pasta [/docker](docker) e execute os seguintes comandos:
```
#docker build -t nfechain_node1 .
#docker build -t nfechain_node2 .
#docker build -t nfechain_node3 .
```
> para facilitar vá até a pasta [/docker](docker) e execute o script **build_docker_image.sh**

> OBS.: Os dados presentes possuem credenciais de autenticação e identificadores definidos que serão usadas nos exemplos de aplicação. Recomenda-se em casos reais de aplicação a modificação desses parâmetros!

O serviço levantado irá habilitar duas portas de comunicação:
- **5554** - porta de comunicação entre nós da blockchain
- **5555** - porta de comunicação do protocolo RPC

# 6.3 Execução

- **Passo 1**: Executar o container do nó proprietário a partir da imagem criada:
>Este container será referenciado como **nó 1**
```
#docker run --network=nfechainnetwork --name no1 --ip=192.168.0.7 -it --rm nfechain_node1
```
>para facilitar vá até a pasta [/docker](docker) e execute o script **start_no1.sh**

- **Passo 2**: Em nova sessão de terminal execute o container dos outros nós:
>Este container será referenciado como **nó 2**
```
#docker run --network=nfechainnetwork --name no2 --ip=192.168.0.8 -it --rm nfechain_node2
```
>para facilitar vá até a pasta [/docker](docker) e execute o script **start_no2.sh**

Pronto! agora teremos os dois nós conectados, prontos para interagir.

> ** No primeiro nó [nó 1] (proprietário): **

- **Passo 3**: Criar o blockchain:
```
#nfechain-criar
```
>resultado:
```
MultiChain utilities build 1.0 beta 2 protocol 10008

Blockchain parameter set was successfully generated.
You can edit it in /root/.multichain/nfe/params.dat before running multichaind for the first time.

To generate blockchain please run "multichaind nfe -daemon".

MultiChain Core Daemon build 1.0 beta 2 protocol 10008

MultiChain server starting
Looking for genesis block...
Genesis block found

Other nodes can connect to this node using:
multichaind nfe@192.168.0.7:5555

Node started
Nó blockchain: 'nfe' criado com sucesso!
```

- **Passo 4**:  Listar as notas fiscais recebidas por determinado cpf/cnpj:
```
#nfechain-listar-notas-recebidas 12345678901 
```
>resultado:
```
{"method":"liststreamitems","params":["fav12345678901",true],"id":1,"chain_name":"nfe"}

error code: -708
error message:
Stream with this name not found: fav12345678901
```
>Observe que não será listado nenhuma nota associada ao cpf exemplo porque nenhuma nota foi gerada.

>** No segundo container [nó 2]: **

- **Passo 5**: Conectar ao blockchain:
```
#nfechain-conectar
```
>resultado:
```
MultiChain Core Daemon build 1.0 beta 2 protocol 10008

MultiChain server starting
Retrieving blockchain parameters from the seed node 192.168.0.7:5555 ...
Other nodes can connect to this node using:
multichaind nfe@192.168.0.8:5555

Node started
```

- **Passo 6**: Verificar a lista de notas emitidas zeradas:
```
#nfechain-listar-notas-emitidas <cpf/cnpj emitente>
```
>**Exemplo**:
>Verificar notas emitidas pelo seguinte emitente: 98765432101
```
#nfechain-listar-notas-emitidas 98765432101
```
>resultado:
```
error code: -708
error message:
Stream with this name not found: emt98765432101
```
>Observe que também não será listado nenhuma nota associada ao cpf exemplo porque nenhma nota ainda foi gerada.

** No primeiro container [nó 1]: **

- **Passo 7**: Emitir uma nota fiscal de 100 reais para o segundo nó [nó 2] seguindo o seguinte modelo:
```
#nfechain-emitir-nota <cpf/cnpj emitente> <cpf/cnpj favorecido> <valor> <descricao>
```

>**Exemplo**:
>Informações da Nota: emitente: 98765432101 favorecido: 12345678901 valor: 150 descrição: serviço de consulta medica
```
#nfechain-emitir-nota 98765432101 12345678901 150 "servico de consulta medica"
```
>Resultado:
```
cc8aac7fb852eca1c8fca8bcfc3a9841816b213eff69f89d84451f105bbc5d5f
```
>Obs: a ação de emitir nota só pode ser realizada no nó 1, pois as transações são realizadas com a chave address do wallet deste host que é o único habilitado  a realizar as transações sobre os streams gerados.

- **Passo 8**: Consultar notas fiscais emitidas:
```
#nfechain-listar-notas-emitidas <cpf/cnpj emitente>
```
>**Exemplo**:
>Consultar notas emitidas pelo cpf 98765432101
```
#nfechain-listar-notas-emitidas 9876543210
```
>Resultado:
```
'{emitente:'98765432101', favorecido:'12345678901', valor:150, descricao:'servico de consulta medica'}'
```
> Esta informação no formato json é persistida no campo **data** de cada stream no formato hexadecimal.

O trecho abaixo mostra o stream sem a conversão
```
$!!!!!!!!!!!!!!!!!
```

** No segundo container [nó 2] **

- **Passo 9**: Consultar notas fiscais recebidas acessando pelo outro nó:
```
#nfechain-listar-notas-recebidas <cpf/cnpj favorecido>
```
>**Exemplo**:
>Consultar notas emitidas pelo cpf 12345678901
```
#nfechain-listar-notas-recebidas 12345678901
```
>Resultado:
```
'{emitente:'98765432101', favorecido:'12345678901', valor:150, descricao:'servico de consulta medica'}'
```

# 7. Modo de funcionamento

As notas fiscais são armazenadas em streams identificadas pelo CPF/CNPJ do usuário e cujo prefixo indicam se são streams de notas emitidas pela pessoa ou se são de notas recebidas pelas pessoas. 

Ex:
O comando **nfechain-emitir-nota 98765432101 12345678901 150 "servico de consulta medica"** gera os seguintes streams
* emt98765432101
* fav12345678901

> O primeiro stream armazena as notas fiscais emitidas pelo usuário 98765432101
> O segundo stream armazena as notas fiscais recebidas pelo usuário 12345678901

Desta forma, para consultar as notas, a depender do papael do usuário nesta transação, basta consultar os blocos armazenados nestas streams.

Como sugestão de evolução futura, temos o ofuscamento da identidade das streams das pessoas, de forma que o identificador utilizado pelo sistema para gerar o nome das streams e com isto recuperar as informações corretas para cada usuário não deve ser possível que a identidade dos participantes seja deduzida apenas ao olhar pelo identificador das strams. Para que isto ocorra é necessário o emprego de outras estruturas de dados para armazenar a associação entre a identidade real do usuário e o identificador associado aos streams.

# 8. Conclusões

Pode-se verificar que com esta pequena implementação de blockchain que a biblioteca multichain permite criar um sistema de compartilhamento de Notas Fiscais formando uma rede blockchain, permitindo uma série de vantagens no uso desta tecnologia que a princípio pode ser utilizado pelo SERPRO e outros órgãos de governo que lidam com dados fiscais, tanto para fiscalização aduaneira e tributária, como também para fornecer acesso facilitado às informações sobre as notas fiscais emitidas ou recebidas pelos cidadãos no Brasil, onde atualmenet apesar de haver uma informatização do sistema, estas informações não estão acessíveis a todo o público a quem interessa. 

Desta forma, estas informações poderiam ser acessadas sempre que desejado. Em um contexto de uso prático desta tecnologia é necessário tornar os dados ofuscados e proteger o payload do detalhamento dos registros das notas fiscais, por uma questão de sigilo das transações e até mesmo segurança das próprias pessoas que podem ter o seu padrão de gastos expostos para todos na rede. Idealmente somente o emitente, o emissor e os órgãos públicos e outras entidades deveriam poder acessar estas informações.
Portanto, o propósito deste trabalho era apenas apresentar um passo inicial de uma implementação da solução e futuramente, caso seja aplicável, necessitará receber uma série de melhorias nos aspectos de segurança para que possa ser usada de forma abrangente.

# 9. Licença

O código e todo conteúdo presente neste projeto estão cobertos pela licença **GNU General Public License v3.0**, presente no arquivo [LICENSE](LICENSE).
