# Projeto Serverless

## Tecnologias

Neste projeto foi utilizado a [AWS](https://aws.amazon.com/pt/) como *cloud* para hospedar o serviço e para provisionar os recursos necessários foi utilizado a ferramenta [Terraform](https://www.terraform.io/). Por fim, para criar o *CI/CD* foi utilizado o [GitHub Actions](https://github.com/features/actions)

## Configurando

Este projeto necessita de algumas configurações .

* Primeiro é necessário uma conta na **AWS** e um usuário com as chaves **ACCESS_KEY** e **SECRET_KEY** geradas e com as permissões adequadas.

* Com as chaves do usuário criadas, deve-se agora criar no *GitHub*, na tela de configurações, duas *secrets* com os nomes de **ACCESS_KEY** e **SECRET_KEY** para armazenar as chaves geradas com segurança.

* Será necessário também criar um *bucket* no serviço **S3** que servirá para armazenar o arquivo de estado do terraform. Depois de criado o *bucket* deve-se configurar adequadamente o arquivo **backend.tf** informarmando o nome do *bucket* criado na propriedade **bucket** e a região onde foi criado na propriedade **region**

* Para finalizar é necessário preencher as informações no arquivo **vars.tfvars**

## Funcionamento

Com as configurações feitas, qualquer **Push** que for feito neste repositório, o *CI/CD* irá executar automanticamente, executando dois *jobs*. O primeiro é o *job* de **Build** o qual irá utilizar um container com o Node já instalado para fazer o *build* da aplicação e em seguida criar um *.zip* contendo a aplicação junto com suas dependências. 

O segundo *job* é o de **Deploy** que irá executar o terraform criando assim um **Lambda** utilizando o *.zip* criado no *job* anterior, e também um **Api Gateway** para expor esse lambda criado. Neste *job* existe um *step* chamado **Show Output** o qual irá fornecer uma URL para ser acessada (*Ex: https://faao1d1rdf.execute-api.us-east-2.amazonaws.com/main*), ao finalizar o *CI/CD* podemos acessar essa URL adicionando **/search/q?=CIDADE** (*Ex: https://faao1d1rdf.execute-api.us-east-2.amazonaws.com/main/search?q=Manaus*)

## Monitoramento e Logs

Para esse cenário, temos habilitado o **CloudWatch** da AWS, onde nele conseguimos ver algumas métricas da nossa aplicação (Lambda) e também podemos acessar os *logs* gerados.

## Melhorias Futuras

Utilizando o terraform, criar um DNS para acessar essa aplicação

