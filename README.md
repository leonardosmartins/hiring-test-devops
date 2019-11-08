# Hiring Test - DevOps

No diretório [app](./app) temos uma aplicação em NodeJS que responde
o clima atual de uma cidade, através da rota `/search?q=CIDADE`, rodando por padrão na porta 8000.

O teste consiste em fornecer uma solução completa para rodar essa aplicação, com foco em IaC, escalabilidade e CI / CD. Alta performance é imprescindível!

- A aplicação deverá rodar em um container docker, utilizando o
[Dockerfile](./app/Dockerfile) já existente.
- A infraestrutura deverá ser criada com alguma ferramenta de IaC (Terraform, Cloudformation, Ansible, Pulumi, CDK, ...).
- Fornecer ou detalhar soluções para monitoramento e gerenciamento de logs.
- Continuous Deploy é essencial! Github Actions, GitLab CI, TravisCI, CircleCI, Jenkins. Fornecer uma solução de fácil utilização para atualização da infraestrutura e da aplicação.
- Realizar as correções necessárias no projeto atual.
- Soluções serverless serão bem vindas.

Para realizar o teste, deve-se fazer um fork deste repositório, realizar as alteraçoes necessárias e enviar o link do seu fork para [jacqueline.mello@avecbrasil.com.br](mailto:jacqueline.mello@avecbrasil.com.br).
