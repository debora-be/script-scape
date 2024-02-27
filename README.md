# ScriptScape

Basicamente, retorna frases e registra os logs.

## Funcionalidades

- **Textinho**: Retorna aquela frase que você já viu em algum lugar, mas não lembra onde.
- **Logs**: Registra os logs de acesso.

## Tecnologias utilizadas

Este projeto utiliza:

- **Backend**: Elixir com Phoenix, e PostgreSQL para armazenamento de dados
- **Frontend**: React.js para a interface do usuário
- **Docker**: Para gerenciar os ambientes de desenvolvimento e produção

## Configuração do ambiente

### Pré-requisitos

- Docker e Docker Compose instalados

### Instruções de configuração

1. Clone o repositório:

```bash
git clone git@github.com:debora-be/script-scape.git
cd ScriptScape
```

2. Utilize o Docker Compose para construir e iniciar os serviços:

```bash
docker-compose up --build
```

Para interagir com a aplicação, abra o navegador e acesse `http://localhost:3000`
Pressione `F5` para atualizar a página com uma nova frase.

## Endpoints da API

### Backend
`http://localhost:4000`
- `GET /pexel-image`: retorna uma imagem aleatória
- `GET /techy`: retorna textinho
  
### Frontend
`http://localhost:3000`
- `/`: Página inicial que exibe a frase inspiradora e a imagem correspondente.

## Estrutura do projeto

- `script_scape_db`: serviço do PostgreSQL para armazenamento de dados
- `script_scape`: serviço do backend Elixir/Phoenix
- `script_scape_react`: serviço do frontend React

![image](https://i.ibb.co/fxVcB6R/Screenshot-from-2024-02-26-20-23-11.png)

Desenvolvido com ❤️ por debora be para a disciplina Docker do curso DevOps da [Ada Tech](https://ada.tech/sou-aluno/programas/b3-deva) 2024, professora Thayse F.
