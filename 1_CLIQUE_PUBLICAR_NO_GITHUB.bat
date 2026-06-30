@echo off
chcp 65001 >nul
setlocal EnableExtensions EnableDelayedExpansion

title Publicar DN Gamer Store no GitHub

echo ==========================================================
echo   PUBLICAÇÃO 1 CLIQUE - DN GAMER STORE
echo ==========================================================
echo.
echo Este assistente publica o projeto no seu GitHub com segurança.
echo Você fará login somente na janela oficial do GitHub/navegador.
echo Não digite nem compartilhe senha, token ou codigo 2FA em chats.
echo.

set "REPO_NAME=dn-gamer-store"
set /p INPUT_REPO=Nome do repositorio [dn-gamer-store]: 
if not "%INPUT_REPO%"=="" set "REPO_NAME=%INPUT_REPO%"

echo.
echo Verificando Git e GitHub CLI...

where git >nul 2>nul
if errorlevel 1 (
  echo Git não encontrado.
  where winget >nul 2>nul
  if errorlevel 1 (
    echo ERRO: winget não encontrado. Instale o Git manualmente em https://git-scm.com/download/win
    pause
    exit /b 1
  )
  echo Instalando Git pelo winget...
  winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
)

where gh >nul 2>nul
if errorlevel 1 (
  echo GitHub CLI não encontrado.
  where winget >nul 2>nul
  if errorlevel 1 (
    echo ERRO: winget não encontrado. Instale o GitHub CLI manualmente em https://cli.github.com/
    pause
    exit /b 1
  )
  echo Instalando GitHub CLI pelo winget...
  winget install --id GitHub.cli -e --source winget --accept-package-agreements --accept-source-agreements
)

rem Atualiza PATH comum após instalação pelo winget
set "PATH=%PATH%;C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI"

where git >nul 2>nul
if errorlevel 1 (
  echo ERRO: Git ainda não foi encontrado. Feche esta janela, abra novamente e tente outra vez.
  pause
  exit /b 1
)

where gh >nul 2>nul
if errorlevel 1 (
  echo ERRO: GitHub CLI ainda não foi encontrado. Feche esta janela, abra novamente e tente outra vez.
  pause
  exit /b 1
)

echo.
echo Verificando login no GitHub...
gh auth status >nul 2>nul
if errorlevel 1 (
  echo Abrindo login seguro do GitHub. Escolha GitHub.com e Login with a web browser.
  gh auth login -w
  if errorlevel 1 (
    echo ERRO: Login não concluído.
    pause
    exit /b 1
  )
)

for /f "usebackq tokens=*" %%i in (`gh api user --jq ".login"`) do set "GH_USER=%%i"
if "%GH_USER%"=="" (
  echo ERRO: Não foi possível identificar seu usuario GitHub.
  pause
  exit /b 1
)

echo.
echo Usuario GitHub: %GH_USER%
echo Repositorio: %REPO_NAME%
echo.

if not exist ".git" (
  git init
)

git config user.name >nul 2>nul
if errorlevel 1 git config user.name "%GH_USER%"

git config user.email >nul 2>nul
if errorlevel 1 git config user.email "%GH_USER%@users.noreply.github.com"

git branch -M main

git add .
git commit -m "Projeto front-end e-commerce gamer" >nul 2>nul
if errorlevel 1 (
  echo Nenhuma alteração nova para commit ou commit já existente. Continuando...
)

echo Criando repositorio publico e enviando arquivos...
gh repo view "%GH_USER%/%REPO_NAME%" >nul 2>nul
if errorlevel 1 (
  gh repo create "%GH_USER%/%REPO_NAME%" --public --source=. --remote=origin --push
  if errorlevel 1 (
    echo ERRO: Não foi possível criar/enviar o repositorio.
    pause
    exit /b 1
  )
) else (
  git remote remove origin >nul 2>nul
  git remote add origin "https://github.com/%GH_USER%/%REPO_NAME%.git"
  git push -u origin main
  if errorlevel 1 (
    echo ERRO: Não foi possível enviar os arquivos para o repositorio existente.
    pause
    exit /b 1
  )
)

echo.
echo Ativando GitHub Pages pela branch main e pasta raiz...
gh api -X POST "repos/%GH_USER%/%REPO_NAME%/pages" -f build_type=legacy -F "source[branch]=main" -F "source[path]=/" >nul 2>nul
if errorlevel 1 (
  gh api -X PUT "repos/%GH_USER%/%REPO_NAME%/pages" -f build_type=legacy -F "source[branch]=main" -F "source[path]=/" >nul 2>nul
)

echo.
echo ==========================================================
echo   PRONTO!
echo ==========================================================
echo Repositorio:
echo https://github.com/%GH_USER%/%REPO_NAME%
echo.
echo Site GitHub Pages:
echo https://%GH_USER%.github.io/%REPO_NAME%/
echo.
echo Observacao: o GitHub Pages pode levar alguns minutos para aparecer.
echo Copie o link acima e cole no AVA quando abrir normalmente.
echo ==========================================================
echo.
pause
