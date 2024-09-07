function pesquisar() {
  // Obtém a seção HTML onde os resultados serão exibidos
  let section = document.getElementById("resultados-pesquisa");

  // Obtem o valor do campo de pesquisa
  let campoPesquisa = document.getElementById("campo-pesquisa").value

   // se campoPesquisa for uma string sem nada
  if (!campoPesquisa) {
    section.innerHTML = "<p style='color: white;'>Nada foi encontrado. Você precisa digitar o nome de um objeto celeste ou relacionado.</p>"
    return 
}

campoPesquisa = campoPesquisa.toLowerCase()

 // Inicializa uma string vazia para armazenar os resultados
let resultados = "";
let titulo = ""; 
let descricao = "";
let tags = "";
let caracteristicas = "";
let tipo = "";

  // Itera sobre cada dado da lista de dados
  for (let dado of dados) {
    titulo = dado.titulo.toLowerCase()
    descricao = dado.descricao.toLowerCase()
    tags = dado.tags.toLowerCase()
    caracteristicas = dado.caracteristicas.toLowerCase()
    tipo = dado.tipo.toLowerCase()

    //se titulo includes campoPesquisa
    if (titulo.includes(campoPesquisa) || descricao.includes(campoPesquisa) || tags.includes(campoPesquisa) || caracteristicas.includes(campoPesquisa) || tipo.includes(campoPesquisa)) {
    // Cria um novo elemento HTML para cada resultado
      resultados += `
        <div class="item-resultado">
          <img src=${dado.imagem} class="imagem">
            <div class="texto">
              <h2>
                <a href="${dado.link}" target="_blank">${dado.titulo}</a>
              </h2>
            <p class="tipo-meta"><b>Tipo:</b> ${dado.tipo}</p>
            <p class="descricao-meta">${dado.descricao}</p>
            <p class="caracteristicas-meta"><b>Características:</b> ${dado.caracteristicas}</p>
            <a href=${dado.link} target="_blank">Saiba mais</a>
          </div>
        </div>
      `;
    }
  }

  if (!resultados) {
    resultados = "<p style='color: white;'>Nada foi encontrado</p>"
}

  // Atribui os resultados gerados à seção HTML
  section.innerHTML = resultados;
}
