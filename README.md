# nfe-blockchain 
## Sistema de Armazenamento de Notas Fiscais usando Blockchain
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

Devido ao blockchain ser imutável, irrefutável e auditável, essa tecnologia será muito muito útil para a implementação do controle de trocas de emissão de notas fiscais, permitindo os seguintes atributos:
- disponibilidade - por estar disposto de forma distribuída na rede permitindo uma descentralização dos registros
- 

A proposta é armazenar os dados de trocas de recibos entre pessoas (físicas ou jurídicas) em uma base de dados distribuída baseada em blockchain. Um dos nós da rede pode estar sob gestão do SERPRO (não restrito ao órgão), considerando que podem estar distribuídos entre vários nós, desde a secretaria de receita dos Estados, bem como entidades privadas que atuam no provimento de soluções de emissão de recibos, entre outros serviços relacionados.

# 5. Possíveis impactos de adoção da tecnologia proposta

A proposta pode trazer como consequência os seguintes impactos positivos:
- Ao integrar os dados providos pela solução, poderá prover maior facilidade para o contribuínte no momento de gerar a declaração de imposto de renda, tendo em vista que o sistema da Receita Federal (produzido pelo SERPRO) poderá prover a declaração pré-preenchida já com a consolidação dos dados dos receibos registrados presentes na rede blockchain.
- Armazém digital de recibos que permite às pessoas acessarem com mais facilidade os recibos que porventura possam comprovar o pagamento de determinado produto ou serviço, tanto para fins de auditoria tributária/fiscal, como para fins de comprovação judicial

Aspectos negativos da proposta que precisam ser tratados:
- Uma vez que as informações de transferências de valores financeiros ficam registrados na blockchain, é necessário criar mecanismos que mascarem as informações do emitente e do receptor, permitindo que apenas quem emitiu e quem recebeu os recibos possam ter acesso a essas informações.

# 6. Prova de Conceito utilizando solução Multichain

A solução de implementação do blockchain é o multichain
http://www.multichain.com

A solução de integração à API é a biblioteca MultiChainJavaAPI
https://github.com/SimplyUb/MultiChainJavaAPI

A solução presente na pasta do projeto [src/cliente-nfe-blockchain](src/cliente-nfe-blockchain) contém o código para execução do projeto.

A pasta [releases](/releases) contém os arquivos .jar com a última versão compilada do projeta, pronta para executar.

# 6.1 Instalação do Multichain
Manual de instalação em ambiente Linux:

> Como super usuário ou usuário sudo execute os seguintes comandos:
```
#wget http://www.multichain.com/download/multichain-1.0-beta-2.tar.gz
#tar -xvzf multichain-1.0-beta-2.tar.gz
#cd multichain-1.0-beta-2
#cp multichaind multichain-cli multichain-util /usr/local/bin
```

# 6.2 Inicialização do serviço Blockchain

- **Passo 1**: criação do nó principal
```
$multichain-util create nfeblockchain
```

- **Passo 2**: configuração do ambiente
> OBS.: Os dados presentes possuem credenciais de autenticação e identificadores definidos que serão usadas nos exemplos de aplicação. Recomenda-se em casos reais de aplicação a modificação desses parâmetros!

```
$cp <proje>/conf/... ./multichain/nfeblockchain/
```

- **Passo 3**: levantar processo
```
$multichaind nfeblockchain -daemon
```

- **OBS.:** Caso for necessário parar o serviço, execute o comando:
```
$multichain-cli nfeblockchain stop
```

O serviço levantado irá habilitar duas portas de comunicação:
- **6805** - porta de comunicação entre nós da blockchain
- **6804** - porta de comunicação do protocolo RPC

```
$ multichain-cli nfeblockchain grant <CHAVE_DO_CLIENTE> connect,send,receive
```

# 6.4 Comandos


# 7. Licença

O código e todo conteúdo presente neste progeto estão cobertos pela licença **GNU General Public License v3.0**, presente no arquivo [LICENSE](LICENSE).
