#

## Tecnologias

Neste projeto foi utilizando a [AWS](https://aws.amazon.com/pt/) para hospedar o serviço e para provisionar os recursos necessários foi utilizado a ferramenta [Terraform](https://www.terraform.io/). Por fim, para criar o **CI/CD** foi utilizado o [GitHub Actions](https://github.com/features/actions)

## Configurando

Para executar esse projeto, é necessário algumas ações antes.

Primeiro é necessário uma conta na **AWS** e um usuário com as chaves **ACCESS_KEY** e **SECRET_KEY** geradas e com as permissões adequadas.

Com as chaves do usuário criadas, deve-se agora criar no **GitHub** duas **Secrets** com os nomes de **ACCESS_KEY** e **SECRET_KEY** para armazenar as chaves com segurança.

Será necessário também criar um **bucket** no serviço **S3** que servirá para armazenar o arquivo de estado do terraform, e depois de criado configurar adequadamente o arquivo **backend.tf** e informar o nome do bucket criado na propriedade **bucket** e a região onde foi criado na propriedade **region**

Para finalizar é necessário preencher as informações no arquivo **vars.tfvars**

## Funcionamento

Com as configurações feitas, qualquer **PUSH** que for feito neste repositório, o **CI/CD** irá executar automanticamente, executando dois **JOBS**. O primeiro é o job de **BUILD** o qual irá utilizar um container com o node 10 instalado para fazer o build da aplicação (modules/app) e em seguida criar um .zip contendo a aplicação junto com suas dependências. 

O segundo job é o de **DEPLOY** que irá executar o terraform criando assim um lambda utilizando o .zip criado no job anterior, e também um Api Gateway para expor esse lambda criado. Neste Job existe um **step** chamado **Show Output** o qual irá fornecer uma url para ser acessada (Ex: https://faao1d1rdf.execute-api.us-east-2.amazonaws.com/main), ao finalizar o **CI/CD** podemos acessar essa URL adicionando **/search/q?=CIDADE** (Ex: https://faao1d1rdf.execute-api.us-east-2.amazonaws.com/main/search?q=Manaus)

## Melhorias

Utilizando o terraform, criar um DNS para acessar essa aplicação

