# <img src="https://www.softexpert.com/wp-content/themes/Zephyr-child/icon-softexpert-site.png" alt="SoftExpert Logo">  Software Expert - Mercado

Este é um repositório de instalação do sistema de gerenciamento de mercado desenvolvido com PHP, VueJS, PostgreSQL e Docker, no qual permite o cadastro de produtos, tipos de produtos, valores percentuais de imposto, registro de vendas e cálculos de impostos sobre os produtos adquiridos.

O projeto baseou-se no desenvolvimento de uma aplicação backend e outra frontend separadas via docker. A aplicação backend possui endpoints referentes aos serviços de cadastro do mercado e o projeto frontend possui as telas condizentes com o serviço requisitado.

#### Repositório aplicação backend: https://github.com/jonas-elias/mercado-software-expert.git
#### Repositório aplicação frontend: https://github.com/jonas-elias/mercado-software-expert-frontend.git

## Requisitos 📋  

Antes de começar a usar este sistema, certifique-se de que seu ambiente atende aos seguintes requisitos:

- Docker v.4.17 ou >

## Instalação 🚀 

1. Clone este repositório para o seu ambiente de desenvolvimento e entre na pasta do projeto.

   ```bash
   git clone https://github.com/jonas-elias/build-mercado-software-expert.git && cd build-mercado-software-expert

2. Execute o comando docker abaixo:
   ```bash
   docker-compose up -d

3. Após o container executar o build corretamente, é possível acessar a aplicação backend, frontend e o sgbd (através do dbaver, por exemplo). Segue  abaixo alguns acessos:

#### Documentação Swagger
http://localhost:8000/api/docs

#### Mercado Software Expert
http://localhost/ (acesso via porta 80 nginx)

#### PostgreSQL connection
jdbc:postgresql://localhost:5432/postgres

## Dúvidas 🤔
Caso exista alguma dúvida sobre como instalar, utilizar ou gerenciar o projeto, entre em contato com o email: jonasdasilvaelias@gmail.com ou acesse os repositórios da aplicação backend e frontend para entendimento específico do domínio.
Um grande abraço!
