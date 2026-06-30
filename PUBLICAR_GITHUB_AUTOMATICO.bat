@echo off
chcp 65001 >nul
setlocal

echo ===============================================
echo Publicação automática do projeto DN Gamer Store
echo ===============================================
echo.

echo Este script usa Git e GitHub CLI.
echo Se pedir login, faça pelo navegador da sua própria conta.
echo NUNCA cole senha ou token em chats.
echo.

where git >nul 2>nul
if errorlevel 1 (
  echo ERRO: Git não encontrado. Instale em: https://git-scm.com/download/win
  pause
  exit /b 1
)

where gh >nul 2>nul
if errorlevel 1 (
  echo ERRO: GitHub CLI não encontrado. Instale em: https://cli.github.com/
  pause
  exit /b 1
)

set /p REPO_NAME=Digite o nome do repositório no GitHub [dn-gamer-store]: 
if "%REPO_NAME%"=="" set REPO_NAME=dn-gamer-store

gh auth status >nul 2>nul
if errorlevel 1 (
  echo.
  echo Você ainda não está logado no GitHub CLI.
  echo Abrirá um fluxo de login seguro.
  gh auth login
)

if not exist ".git" (
  git init
)

git branch -M main
git add .
git commit -m "Projeto front-end e-commerce gamer" 2>nul

echo.
echo Criando repositório público e enviando arquivos...
gh repo create "%REPO_NAME%" --public --source=. --remote=origin --push
if errorlevel 1 (
  echo.
  echo Talvez o repositório já exista. Tentando enviar para o remote origin...
  git push -u origin main
)

echo.
echo Ativando GitHub Pages pela branch main...
gh pages deploy . --branch main --repo "%REPO_NAME%" 2>nul

echo.
echo ===============================================
echo Finalizado.
echo Confira seu repositório no GitHub.
echo Se o GitHub Pages não ativar automaticamente, ative em:
echo Settings ^> Pages ^> Deploy from branch ^> main ^> /root

echo ===============================================
pause
