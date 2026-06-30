# Prompt completo para o Codex publicar o projeto automaticamente

Cole este prompt no Codex com a pasta `dn-gamer-store` aberta.

```text
Você está dentro da pasta do projeto `dn-gamer-store`. Quero que você finalize e publique automaticamente este projeto no GitHub Pages.

Contexto da atividade:
- Curso Front-End.
- Atividade avaliativa individual com peso 55%.
- Deve desenvolver página index e página login para um e-commerce de eletrônicos gamer.
- Requisitos mínimos: menu, banner, destaque, novidades, galeria e rodapé.
- Tecnologias obrigatórias: HTML5, CSS3, Bootstrap, media query/responsividade, JavaScript e jQuery.
- Deve ter interatividade em botões, formulários, carousel e mensagens para o usuário.
- O código deve ser semântico, organizado e com sintaxe adequada.
- O projeto precisa ficar público no GitHub e com GitHub Pages ativado para eu colar o link no AVA.

O que você deve fazer:
1. Verifique todos os arquivos do projeto:
   - index.html
   - login.html
   - assets/css/style.css
   - assets/js/script.js
   - assets/img/*
   - README.md
   - scripts .bat e .ps1 de publicação.
2. Corrija qualquer erro encontrado em HTML, CSS ou JavaScript.
3. Confirme se o projeto atende a todos os critérios da atividade.
4. Mantenha o visual profissional gamer, moderno, responsivo e organizado.
5. Teste abrindo o `index.html` ou usando um servidor local simples, se necessário.
6. Use o GitHub CLI (`gh`) e Git para publicar:
   - Se Git ou GitHub CLI não estiverem instalados, oriente a instalação ou use o script já existente.
   - Nunca peça minha senha no chat.
   - Faça o login apenas pelo fluxo oficial `gh auth login -w`, abrindo o navegador oficial do GitHub.
   - Crie um repositório público chamado `dn-gamer-store`, se ainda não existir.
   - Faça commit e push para a branch `main`.
   - Ative o GitHub Pages usando a branch `main` e a pasta raiz `/`.
7. Ao final, me entregue:
   - Link do repositório GitHub.
   - Link do GitHub Pages.
   - Texto pronto para colar no AVA.

Comandos preferenciais se estiver no Windows:
- Primeiro tente executar: `./1_CLIQUE_PUBLICAR_NO_GITHUB.ps1`
- Se houver bloqueio de execução do PowerShell, use: `cmd /c 1_CLIQUE_PUBLICAR_NO_GITHUB.bat`
- Se preferir fazer manualmente, use os comandos equivalentes com `git` e `gh`.

Texto final que preciso receber:
"Projeto publicado com sucesso.
Repositório: <link>
Site: <link>
Texto para o AVA: Segue o link do projeto desenvolvido para a atividade de Front-End: <link-do-site>. O projeto contém as páginas index e login de um e-commerce gamer, com HTML5, CSS3, Bootstrap, responsividade, JavaScript, JQuery, formulário, carousel, galeria, menu, banner, destaques, novidades e rodapé."
```
