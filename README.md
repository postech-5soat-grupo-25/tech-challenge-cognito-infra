# `cognito` | PosTech 5SOAT • Grupo 25

Este repositório contém a configuração necessária para o deploy de uma infraestrutura de autenticação e autorização utilizando o Amazon Cognito na AWS, automatizada através de Terraform. O objetivo é facilitar a criação e gerenciamento de pools de usuários e identidades, garantindo segurança e escalabilidade para a aplicação.

## Infraestrutura

A infraestrutura criada por este repositório inclui:

- Um User Pool do Cognito para gerenciar a autenticação de usuários.
- Um Identity Pool do Cognito para conceder acesso a recursos da AWS com base em identidades autenticadas e não autenticadas.
- Integração com provedores de identidade.

## Como Utilizar

### Configuração dos Secrets

Certifique-se de ter os seguintes secrets configurados a nível de organização:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

### Deploy Automático via GitHub Actions

O deploy da infraestrutura é automatizado através de **GitHub Actions**. O processo é acionado automaticamente quando um pull request é mergeado na branch `main`. Os passos incluem:

1. *Checkout do código:* O código mais recente é baixado para o runner do GitHub Actions.
2. *Setup do Terraform:* A versão especificada do Terraform é instalada.
3. *Inicialização do Terraform:* Prepara o Terraform para o deploy, configurando o backend e baixando os módulos necessários.
4. *Verificação do formato do código Terraform:* Garante que o código Terraform esteja formatado corretamente.
5. *Planejamento das mudanças:* Mostra quais recursos o Terraform pretende criar, atualizar ou destruir.
6. *Aplicação das mudanças:* Aplica as mudanças na infraestrutura. Este passo ocorre apenas quando o código é mergeado na branch `main`.

### Destruição da Infraestrutura

A destruição da infraestrutura pode ser iniciada manualmente através do GitHub Actions, utilizando o workflow `Terraform Destroy`. Este processo irá remover todos os recursos criados pelo Terraform.

## Estrutura do Projeto

- `main.tf`: Definição dos recursos da AWS para o Amazon Cognito.
- `provider.tf`: Configuração do provedor AWS para uso com Terraform.
- `.github/workflows/deploy.yml`: Workflow do GitHub Actions para o deploy da infraestrutura.
- `.github/workflows/destroy.yml`: Workflow do GitHub Actions para a destruição da infraestrutura.
