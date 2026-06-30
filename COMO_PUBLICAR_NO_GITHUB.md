# Como publicar o projeto no GitHub e enviar no AVA

## Opção 1 — Pelo site do GitHub

1. Entre em https://github.com
2. Clique em **New repository**.
3. Coloque o nome: `dn-gamer-store`.
4. Selecione **Public**.
5. Clique em **Create repository**.
6. Clique em **uploading an existing file**.
7. Arraste todos os arquivos e pastas do projeto para o GitHub.
8. Clique em **Commit changes**.
9. Vá em **Settings > Pages**.
10. Em **Branch**, selecione `main` e `/root`.
11. Clique em **Save**.
12. Copie o link publicado e cole no AVA.

## Opção 2 — Pelo terminal

Dentro da pasta do projeto, use:

```bash
git init
git add .
git commit -m "Projeto front-end DN Gamer Store"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/dn-gamer-store.git
git push -u origin main
```

Depois, ative o GitHub Pages em **Settings > Pages**.

## Link para colar no AVA

Depois de publicado, o link geralmente fica parecido com:

```text
https://SEU-USUARIO.github.io/dn-gamer-store/
```

---

## Opção automática com script

Este projeto também inclui:

- `PUBLICAR_GITHUB_AUTOMATICO.bat` para Windows com clique duplo.
- `PUBLICAR_GITHUB_AUTOMATICO.ps1` para PowerShell.
- `PROMPT_PARA_CODEX.md` caso queira usar o Codex para revisar o projeto no seu computador.

### Antes de rodar o script

Instale:

1. Git: https://git-scm.com/download/win
2. GitHub CLI: https://cli.github.com/

Depois, abra a pasta do projeto, clique no script `.bat` ou execute o `.ps1` pelo PowerShell.
O login será feito pelo próprio GitHub CLI, de forma segura.
