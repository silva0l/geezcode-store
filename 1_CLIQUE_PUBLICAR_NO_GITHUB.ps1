$ErrorActionPreference = "Stop"

Write-Host "=========================================================="
Write-Host "  PUBLICAÇÃO 1 CLIQUE - DN GAMER STORE"
Write-Host "=========================================================="
Write-Host ""
Write-Host "Este assistente publica o projeto no seu GitHub com segurança."
Write-Host "Você fará login somente na janela oficial do GitHub/navegador."
Write-Host "Não digite nem compartilhe senha, token ou codigo 2FA em chats."
Write-Host ""

$repoName = Read-Host "Nome do repositorio [dn-gamer-store]"
if ([string]::IsNullOrWhiteSpace($repoName)) { $repoName = "dn-gamer-store" }

function Ensure-Command($cmd, $wingetId, $manualUrl) {
  if (Get-Command $cmd -ErrorAction SilentlyContinue) { return }
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "$cmd não encontrado. Instale manualmente: $manualUrl"
  }
  Write-Host "$cmd não encontrado. Instalando pelo winget..."
  winget install --id $wingetId -e --source winget --accept-package-agreements --accept-source-agreements
}

Ensure-Command "git" "Git.Git" "https://git-scm.com/download/win"
Ensure-Command "gh" "GitHub.cli" "https://cli.github.com/"

$env:Path += ";C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI"

Write-Host "Verificando login no GitHub..."
try {
  gh auth status *> $null
} catch {
  Write-Host "Abrindo login seguro do GitHub. Escolha GitHub.com e Login with a web browser."
  gh auth login -w
}

$ghUser = gh api user --jq ".login"
if ([string]::IsNullOrWhiteSpace($ghUser)) { throw "Não foi possível identificar seu usuário GitHub." }

Write-Host "Usuário GitHub: $ghUser"
Write-Host "Repositório: $repoName"

if (-not (Test-Path ".git")) { git init }

$gitUserName = git config --get user.name
if ([string]::IsNullOrWhiteSpace($gitUserName)) { git config user.name $ghUser }

$gitUserEmail = git config --get user.email
if ([string]::IsNullOrWhiteSpace($gitUserEmail)) { git config user.email "$ghUser@users.noreply.github.com" }

git branch -M main
git add .
try { git commit -m "Projeto front-end e-commerce gamer" *> $null } catch { Write-Host "Nenhuma alteração nova para commit ou commit já existente. Continuando..." }

Write-Host "Criando repositório público e enviando arquivos..."
$repoExists = $true
try { gh repo view "$ghUser/$repoName" *> $null } catch { $repoExists = $false }

if (-not $repoExists) {
  gh repo create "$ghUser/$repoName" --public --source=. --remote=origin --push
} else {
  try { git remote remove origin *> $null } catch {}
  git remote add origin "https://github.com/$ghUser/$repoName.git"
  git push -u origin main
}

Write-Host "Ativando GitHub Pages pela branch main e pasta raiz..."
try {
  gh api -X POST "repos/$ghUser/$repoName/pages" -f build_type=legacy -F "source[branch]=main" -F "source[path]=/" *> $null
} catch {
  try { gh api -X PUT "repos/$ghUser/$repoName/pages" -f build_type=legacy -F "source[branch]=main" -F "source[path]=/" *> $null } catch {}
}

Write-Host ""
Write-Host "=========================================================="
Write-Host "  PRONTO!"
Write-Host "=========================================================="
Write-Host "Repositório: https://github.com/$ghUser/$repoName"
Write-Host "Site GitHub Pages: https://$ghUser.github.io/$repoName/"
Write-Host "Observação: o GitHub Pages pode levar alguns minutos para aparecer."
Write-Host "Copie o link acima e cole no AVA quando abrir normalmente."
Write-Host "=========================================================="
Read-Host "Pressione Enter para sair"
