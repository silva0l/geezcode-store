Write-Host "==============================================="
Write-Host "Publicação automática do projeto DN Gamer Store"
Write-Host "==============================================="
Write-Host ""
Write-Host "Este script usa Git e GitHub CLI. Faça login apenas pelo navegador/terminal oficial."
Write-Host "NUNCA cole senha ou token em chats."
Write-Host ""

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "ERRO: Git não encontrado. Instale em: https://git-scm.com/download/win"
  exit 1
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  Write-Host "ERRO: GitHub CLI não encontrado. Instale em: https://cli.github.com/"
  exit 1
}

$repoName = Read-Host "Digite o nome do repositório no GitHub [dn-gamer-store]"
if ([string]::IsNullOrWhiteSpace($repoName)) { $repoName = "dn-gamer-store" }

gh auth status *> $null
if ($LASTEXITCODE -ne 0) {
  Write-Host "Você ainda não está logado no GitHub CLI. Será iniciado um login seguro."
  gh auth login
}

if (-not (Test-Path ".git")) {
  git init
}

git branch -M main
git add .
git commit -m "Projeto front-end e-commerce gamer" 2>$null

Write-Host "Criando repositório público e enviando arquivos..."
gh repo create $repoName --public --source=. --remote=origin --push
if ($LASTEXITCODE -ne 0) {
  Write-Host "Talvez o repositório já exista. Tentando enviar para o remote origin..."
  git push -u origin main
}

Write-Host "Ativando GitHub Pages pela branch main..."
gh pages deploy . --branch main --repo $repoName 2>$null

Write-Host ""
Write-Host "Finalizado. Confira seu repositório no GitHub."
Write-Host "Se o GitHub Pages não ativar automaticamente, ative em Settings > Pages > Deploy from branch > main > /root."
