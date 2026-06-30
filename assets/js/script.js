class Carrinho {
  constructor() {
    this.itens = JSON.parse(localStorage.getItem("geezCarrinho")) || [];
  }

  adicionar(produto) {
    this.itens.push(produto);
    this.salvar();
  }

  total() {
    return this.itens.length;
  }

  salvar() {
    localStorage.setItem("geezCarrinho", JSON.stringify(this.itens));
  }
}

const carrinho = new Carrinho();
const cupons = ["GEEZ10", "CODE15", "RGB20", "SETUP25"];

function atualizarAno() {
  const ano = new Date().getFullYear();
  $("#anoAtual").text(ano);
}

function atualizarCarrinho() {
  $("#contadorCarrinho").text(carrinho.total());
}

function mostrarToast(mensagem) {
  const toastElemento = document.getElementById("toastFeedback");

  if (!toastElemento) return;

  document.getElementById("toastMensagem").textContent = mensagem;
  const toast = new bootstrap.Toast(toastElemento);
  toast.show();
}

function validarEmail(email) {
  const regra = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regra.test(email);
}

function aplicarTemaSalvo() {
  const temaSalvo = localStorage.getItem("geezTema");

  if (temaSalvo === "claro") {
    document.body.classList.add("light-theme");
    $("#btnTema i").removeClass("bi-moon-stars").addClass("bi-sun");
  }
}

function configurarTema() {
  $("#btnTema").on("click", function () {
    $("body").toggleClass("light-theme");
    const temaClaro = $("body").hasClass("light-theme");

    localStorage.setItem("geezTema", temaClaro ? "claro" : "escuro");
    $("#btnTema i").toggleClass("bi-moon-stars bi-sun");
  });
}

function configurarBuscaProdutos() {
  $("#campoBusca").on("input", function () {
    const busca = $(this).val().toLowerCase().trim();
    let encontrados = 0;

    $(".produto").each(function () {
      const nomeProduto = $(this).data("nome").toLowerCase();
      const encontrou = nomeProduto.includes(busca);

      if (encontrou) {
        encontrados += 1;
      }

      $(this).toggle(encontrou);
    });

    $("#mensagemBusca").toggleClass("d-none", encontrados > 0);
  });
}

function configurarCarrinho() {
  $(".btnComprar").on("click", function () {
    const produto = $(this).data("produto");
    carrinho.adicionar(produto);
    atualizarCarrinho();
    mostrarToast(`${produto} foi adicionado ao carrinho!`);
  });
}

function configurarCupom() {
  $("#btnCupom").on("click", function () {
    const indice = Math.floor(Math.random() * cupons.length);
    const cupomEscolhido = cupons[indice];
    $("#resultadoCupom").text(`Seu cupom especial: ${cupomEscolhido} — use na finalização da compra.`);
  });
}

function configurarNewsletter() {
  $("#formNewsletter").on("submit", function (event) {
    event.preventDefault();

    const nome = $("#nomeNewsletter").val().trim();
    const email = $("#emailNewsletter").val().trim();
    const preferencia = $("#preferencia").val();
    const mensagem = $("#mensagemNewsletter");

    if (nome.length < 3) {
      mensagem.removeClass("message-success").addClass("message-error").text("Digite um nome com pelo menos 3 caracteres.");
      return;
    }

    if (!validarEmail(email)) {
      mensagem.removeClass("message-success").addClass("message-error").text("Digite um e-mail válido.");
      return;
    }

    if (preferencia === "") {
      mensagem.removeClass("message-success").addClass("message-error").text("Selecione seu interesse principal.");
      return;
    }

    const cadastro = { nome, email, preferencia };
    localStorage.setItem("geezNewsletter", JSON.stringify(cadastro));

    mensagem.removeClass("message-error").addClass("message-success").text(`Cadastro realizado com sucesso, ${nome}!`);
    this.reset();
  });
}

function configurarLogin() {
  $("#btnMostrarSenha").on("click", function () {
    const campoSenha = $("#senhaLogin");
    const tipoAtual = campoSenha.attr("type");
    const novoTipo = tipoAtual === "password" ? "text" : "password";

    campoSenha.attr("type", novoTipo);
    $(this).find("i").toggleClass("bi-eye bi-eye-slash");
  });

  $("#formLogin").on("submit", function (event) {
    event.preventDefault();

    const email = $("#emailLogin").val().trim();
    const senha = $("#senhaLogin").val().trim();
    const lembrar = $("#lembrarLogin").is(":checked");
    const mensagem = $("#mensagemLogin");

    if (!validarEmail(email)) {
      mensagem.removeClass("message-success").addClass("message-error").text("Informe um e-mail válido.");
      return;
    }

    if (senha.length < 6) {
      mensagem.removeClass("message-success").addClass("message-error").text("A senha deve ter pelo menos 6 caracteres.");
      return;
    }

    if (lembrar) {
      localStorage.setItem("geezUsuario", email);
    } else {
      localStorage.removeItem("geezUsuario");
    }

    mensagem.removeClass("message-error").addClass("message-success").text("Login validado com sucesso! Bem-vindo à GeezCode Store.");
  });

  const usuarioSalvo = localStorage.getItem("geezUsuario");
  if (usuarioSalvo) {
    $("#emailLogin").val(usuarioSalvo);
    $("#lembrarLogin").prop("checked", true);
  }
}

function configurarGaleria() {
  const modalGaleria = document.getElementById("modalGaleria");

  if (!modalGaleria) return;

  modalGaleria.addEventListener("show.bs.modal", function (event) {
    const botao = event.relatedTarget;
    const imagem = botao.getAttribute("data-img");
    const titulo = botao.getAttribute("data-title");

    document.getElementById("imagemModal").setAttribute("src", imagem);
    document.getElementById("tituloModalGaleria").textContent = titulo;
  });
}

function configurarBotaoTopo() {
  const botaoTopo = $("#btnTopo");

  $(window).on("scroll", function () {
    const posicao = $(this).scrollTop();
    botaoTopo.css("display", posicao > 450 ? "inline-flex" : "none");
  });

  botaoTopo.on("click", function () {
    $("html, body").animate({ scrollTop: 0 }, 500);
  });
}

function configurarScrollSuave() {
  $("a[href^='#']").on("click", function (event) {
    const destino = $(this.getAttribute("href"));

    if (destino.length) {
      event.preventDefault();
      $("html, body").animate({ scrollTop: destino.offset().top - 75 }, 650);
    }
  });
}

function configurarAnimacoes() {
  const elementos = document.querySelectorAll(".reveal");

  const observador = new IntersectionObserver((entradas) => {
    entradas.forEach((entrada) => {
      if (entrada.isIntersecting) {
        entrada.target.classList.add("active");
      }
    });
  }, { threshold: 0.12 });

  for (const elemento of elementos) {
    observador.observe(elemento);
  }
}

$(document).ready(function () {
  atualizarAno();
  aplicarTemaSalvo();
  configurarTema();
  atualizarCarrinho();
  configurarBuscaProdutos();
  configurarCarrinho();
  configurarCupom();
  configurarNewsletter();
  configurarLogin();
  configurarGaleria();
  configurarBotaoTopo();
  configurarScrollSuave();
  configurarAnimacoes();
});
