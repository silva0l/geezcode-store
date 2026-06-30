# GeezCode Store

Projeto desenvolvido por **Jose Frederico da Costa Silva** para uma atividade avaliativa de Front-End.

A GeezCode Store é uma interface de e-commerce gamer criada com foco em apresentação visual, responsividade e interatividade. O projeto simula uma loja de eletrônicos e periféricos para jogadores, com página inicial, página de login, vitrine de produtos, galeria, formulário e recursos dinâmicos com JavaScript e jQuery.

## Acesso ao projeto

Site publicado no GitHub Pages:

https://silva0l.github.io/geezcode-store/

Repositório no GitHub:

https://github.com/silva0l/geezcode-store

## Objetivo

O objetivo do projeto foi construir uma experiência completa de Front-End para um e-commerce gamer, aplicando HTML5 semântico, CSS3, Bootstrap, responsividade, JavaScript e jQuery.

A proposta foi desenvolver uma página visualmente moderna, com navegação clara, seções organizadas e interações que simulam funcionalidades comuns em lojas virtuais, como busca de produtos, carrinho, cupom, formulário de contato/newsletter e área de login.

## Páginas desenvolvidas

### Página inicial

Arquivo: `index.html`

A página inicial apresenta a marca GeezCode Store e concentra as principais áreas do e-commerce:

- Menu responsivo com links para as seções da página.
- Banner principal com carousel de ofertas.
- Cards de benefícios da loja.
- Seção de produtos em destaque.
- Campo de busca para filtrar produtos.
- Botões de adicionar produtos ao carrinho.
- Contador de itens no carrinho.
- Seção de novidades com tabela comparativa de kits.
- Botão para exibir cupom promocional.
- Galeria de setups com modal de visualização.
- Formulário de newsletter com validação.
- Rodapé com links úteis.

### Página de login

Arquivo: `login.html`

A página de login simula a área do cliente da loja:

- Formulário com campo de e-mail e senha.
- Validação de e-mail.
- Validação de senha com mínimo de 6 caracteres.
- Botão para mostrar ou ocultar senha.
- Opção de lembrar acesso.
- Mensagem de retorno ao usuário.
- Link de retorno para a página inicial.
- Layout responsivo e coerente com a identidade visual da loja.

## Tecnologias utilizadas

- HTML5
- CSS3
- Bootstrap 5.3.3
- Bootstrap Icons
- JavaScript
- jQuery 3.7.1
- LocalStorage
- GitHub Pages

## Requisitos da atividade atendidos

| Requisito | Implementação |
| --- | --- |
| Página index/home | `index.html` |
| Página de login | `login.html` |
| Menu | Navbar responsiva com Bootstrap |
| Banner | Hero com carousel |
| Destaques | Cards de produtos em destaque |
| Novidades | Seção Pro Series e tabela de kits |
| Galeria | Galeria com modal Bootstrap |
| Rodapé | Rodapé presente nas duas páginas |
| HTML5 semântico | Uso de `header`, `nav`, `main`, `section`, `article`, `footer` |
| CSS3 | Arquivo `assets/css/style.css` com variáveis, efeitos, cards e layout |
| Bootstrap | Grid, navbar, carousel, modal, tabela, botões e formulário |
| Responsividade | Grid Bootstrap e media queries próprias |
| JavaScript | Arquivo `assets/js/script.js` |
| jQuery | Eventos, animações, busca, formulários e manipulação de DOM |
| Interatividade | Carrinho, tema, busca, cupom, formulário, login, modal e botão voltar ao topo |
| Publicação pública | GitHub Pages |

## Funcionalidades implementadas

### Navegação

O menu principal possui links para as seções da página inicial e para a página de login. Em telas menores, o menu é recolhido automaticamente pelo componente navbar do Bootstrap.

### Carousel

O banner principal usa o carousel do Bootstrap para exibir diferentes chamadas da loja, como promoções de periféricos, upgrades de hardware e acessórios para setup.

### Produtos e carrinho

A vitrine apresenta quatro produtos principais:

- Teclado Mecânico RGB
- Mouse Gamer 12.000 DPI
- Headset Surround 7.1
- Monitor Gamer 165Hz

Cada produto possui imagem, descrição, avaliação, preço e botão para adicionar ao carrinho. O contador é atualizado dinamicamente e salvo no navegador com LocalStorage.

### Busca de produtos

O campo de busca permite filtrar os cards de produtos em tempo real. Quando nenhum item corresponde ao termo digitado, uma mensagem informa o usuário.

### Cupom promocional

Na seção de novidades, o botão de cupom seleciona uma das opções cadastradas no JavaScript e exibe a mensagem promocional ao usuário.

### Formulário de newsletter

O formulário de newsletter valida:

- Nome com pelo menos 3 caracteres.
- E-mail em formato válido.
- Seleção de interesse principal.

Após a validação, os dados são salvos no LocalStorage e uma mensagem de sucesso é exibida.

### Login

O formulário de login valida e-mail e senha, permite mostrar/ocultar senha e salva o e-mail do usuário no LocalStorage quando a opção "Lembrar acesso" está marcada.

### Tema claro e escuro

O botão de tema alterna entre o modo escuro e o modo claro. A preferência também é salva no LocalStorage.

### Galeria

A galeria usa modal Bootstrap para ampliar as imagens de setups gamer e atualizar dinamicamente o título exibido no modal.

### Botão voltar ao topo

O botão aparece após a rolagem da página e retorna suavemente ao início.

## Responsividade

O layout foi planejado para funcionar em desktop, tablet e celular. A responsividade foi construída com:

- Grid do Bootstrap.
- Navbar recolhível.
- Cards adaptáveis.
- Imagens fluidas.
- Media queries para ajustes em telas menores.
- Controle de overflow horizontal.

## Acessibilidade e boas práticas

O projeto inclui alguns cuidados de acessibilidade e organização:

- Estrutura semântica com tags HTML5.
- Textos alternativos nas imagens.
- Labels nos formulários.
- `aria-label` em botões e links importantes.
- Link de pular para o conteúdo principal.
- Mensagens com `aria-live` para retorno ao usuário.
- Separação entre HTML, CSS e JavaScript.

## Estrutura de pastas

```text
geezcode-store/
├── index.html
├── login.html
├── README.md
└── assets/
    ├── css/
    │   └── style.css
    ├── img/
    │   ├── banner-acessorios.svg
    │   ├── banner-hardware.svg
    │   ├── banner-setup.svg
    │   ├── favicon.svg
    │   ├── galeria-1.svg
    │   ├── galeria-2.svg
    │   ├── galeria-3.svg
    │   ├── produto-headset.svg
    │   ├── produto-monitor.svg
    │   ├── produto-mouse.svg
    │   └── produto-teclado.svg
    └── js/
        └── script.js
```

## Como executar localmente

1. Baixe ou clone o repositório.
2. Abra o arquivo `index.html` no navegador.
3. Para acessar a página de login, clique no botão Login do menu ou abra `login.html`.

Como o projeto é estático, não é necessário instalar dependências para executar.

## Autor

**Jose Frederico da Costa Silva**

Projeto desenvolvido como atividade avaliativa de Front-End, com foco em estrutura, responsividade, organização de código e interatividade no navegador.
