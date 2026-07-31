-- =============================================================
-- AstroCuriosity — Supabase Migration
-- Execute no SQL Editor: https://app.supabase.com → SQL Editor
-- =============================================================

-- 1. Criar tabela
CREATE TABLE IF NOT EXISTS celestial_objects (
  id             SERIAL PRIMARY KEY,
  titulo         TEXT NOT NULL,
  descricao      TEXT NOT NULL,
  tipo           TEXT NOT NULL,
  caracteristicas TEXT,
  link           TEXT,
  imagem         TEXT,
  tags           TEXT,
  created_at     TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Habilitar Row Level Security
ALTER TABLE celestial_objects ENABLE ROW LEVEL SECURITY;

-- 3. Permitir leitura pública (anon key)
CREATE POLICY "public_read" ON celestial_objects
  FOR SELECT TO anon USING (true);

-- 3.1 Permitir leitura também para usuários autenticados
CREATE POLICY "authenticated_read" ON celestial_objects
  FOR SELECT TO authenticated USING (true);

-- 4. Inserir dados
INSERT INTO celestial_objects (titulo, descricao, tipo, caracteristicas, link, imagem, tags) VALUES

-- BURACOS NEGROS
(
  'Sagittarius A*',
  'Sagitário A (Sgr A) é um buraco negro supermassivo localizado no centro da nossa galáxia, a Via Láctea. Ele é um dos objetos mais fascinantes e misteriosos do universo, capturando a atenção de astrônomos e entusiastas do espaço ao redor do mundo.',
  'Buraco Negro',
  'Possui a massa milhões de vezes maior que a massa do nosso Sol; Localizado no centro da Via Láctea; Possui baixa atividade, ou seja, não consome tanta matéria; Foi o segundo buraco negro a ser fotografado.',
  'https://www.nasa.gov/image-article/supermassive-black-hole-sagittarius/',
  '/images/sagittarius.jpg',
  'buraco negro supermassivo via láctea lactea'
),
(
  'M87',
  'O M87 é um dos buracos negros supermassivos mais famosos e estudados do universo. Localizado no centro da galáxia elíptica Messier 87, ele se tornou uma verdadeira celebridade após a primeira imagem de um buraco negro, capturada pelo Telescópio do Horizonte de Eventos (EHT), ter sido divulgada em 2019.',
  'Buraco Negro',
  'Possui a massa bilhões de vezes maior que a massa do nosso Sol; Conhecido por emitir jatos de matéria extremamente energéticos; Foi o primeiro buraco negro a ser fotografado.',
  'https://science.nasa.gov/resource/first-image-of-a-black-hole/',
  '/images/m87.jpg',
  'buraco negro supermassivo'
),
(
  'Phoenix A*',
  'O Phoenix A é um dos maiores buracos negros já descobertos no universo. Sua massa é absolutamente colossal, estimada em cerca de 100 bilhões de vezes a massa do nosso Sol. A sua existência desafia algumas teorias sobre a formação e evolução dos buracos negros.',
  'Buraco Negro',
  'Está localizado no centro de um aglomerado de galáxias, a mais de 5,8 bilhões de anos-luz da Terra; A sua massa o coloca em uma categoria à parte, muito acima dos buracos negros supermassivos comuns; A sua descoberta é relativamente recente e causou grande impacto na comunidade científica.',
  'https://en.wikipedia.org/wiki/Phoenix_Cluster#Supermassive_black_hole',
  '/images/phoenix_cluster.jpg',
  'buraco negro supermassivo'
),

-- GALÁXIAS
(
  'Galáxia de Andrômeda',
  'A Galáxia de Andrômeda é a galáxia mais próxima da Via Láctea, sendo visível a olho nu em noites escuras e sem lua. Ela é um dos objetos mais distantes que podem ser vistos a olho nu, a cerca de 2,5 milhões de anos-luz de distância.',
  'Galáxia Espiral',
  'Visível no céu noturno sob razoáveis condições de observação; Além da Via Láctea, é a galáxia mais estudada; Há a previsão de que ela irá colidir com a Via Láctea em cerca de 4 bilhões de anos.',
  'https://pt.wikipedia.org/wiki/Galáxia_de_Andrômeda',
  '/images/andromeda.jpg',
  'galáxia galaxia aglomerado andrômeda andromeda'
),
(
  'Nuvens de Magalhães',
  'As Nuvens de Magalhães são um par de galáxias anãs que orbitam a Via Láctea. São visíveis a olho nu no hemisfério sul e são um dos objetos mais estudados pelos astrônomos.',
  'Galáxias satélites anãs irregulares',
  'A Grande Nuvem de Magalhães está localizada a aproximadamente 160.000 anos-luz, e a Pequena Nuvem de Magalhães está localizada aproximadamente 200.000 anos-luz; Ambas são visíveis a olho nu e apenas no Hemisfério Sul.',
  'https://pt.wikipedia.org/wiki/Nuvens_de_Magalhães',
  '/images/nuvens_magalhaes.jpg',
  'galáxia galaxia aglomerado satelite satélite nuvens nuvem'
),
(
  'Via Láctea',
  'A Via Láctea é a galáxia espiral na qual se encontra o Sistema Solar, incluindo a Terra. Vista da Terra, aparece como uma faixa brilhante e difusa que se estende por todo o céu noturno. Essa faixa luminosa é composta por bilhões de estrelas, além de gás, poeira e outros objetos celestes.',
  'Galáxia Espiral',
  'Possui um diâmetro estimado em cerca de 100.000 anos-luz; Faz parte de um grupo local de galáxias e interage gravitacionalmente com suas vizinhas.',
  'https://pt.wikipedia.org/wiki/Via_Láctea',
  '/images/via_lactea.jpg',
  'galáxia galaxia aglomerado via láctea'
),
(
  'Galáxia do Sombreiro',
  'A Galáxia do Sombrero, também conhecida como M104 ou NGC 4594, é um dos objetos mais famosos e fotogênicos do céu noturno. Seu nome vem da sua aparência distinta, que se assemelha a um chapéu mexicano.',
  'Galáxia Espiral',
  'Localizada a cerca de 28 milhões de anos-luz da Terra; Apresenta um núcleo brilhante e um disco achatado de material escuro que a circunda; Seu núcleo central abriga um grande número de estrelas antigas e um buraco negro supermassivo; O disco da galáxia é rico em poeira cósmica; Possui um extenso halo estelar que se estende muito além do disco visível.',
  'https://www.nasa.gov/image-article/sombrero-galaxy/',
  '/images/sombrero_galaxy.jpg',
  'galáxia galaxia aglomerado sombreiro'
),

-- ESTRELAS
(
  'Sol',
  'O Sol é a estrela central do Sistema Solar e a fonte primária de energia para a vida na Terra.',
  'Estrela',
  'Estrela anã amarela; Idade estimada em 4,6 bilhões de anos; Composto principalmente de hidrogênio e hélio; Responsável pela emissão de luz e calor que sustentam a vida na Terra.',
  'https://solarsystem.nasa.gov/solar-system/sun/',
  '/images/sol.jpg',
  'estrela sol sistema solar'
),
(
  'Proxima Centauri',
  'Proxima Centauri é a estrela mais próxima do Sol, localizada no sistema Alpha Centauri.',
  'Estrela',
  'Anã vermelha; Menor e mais fria que o Sol; Possui pelo menos um planeta confirmado em sua órbita; Parte de um sistema estelar triplo.',
  'https://en.wikipedia.org/wiki/Proxima_Centauri',
  '/images/proxima_centauri.jpg',
  'estrela proxima centauri anã vermelha'
),
(
  'UY Scuti',
  'UY Scuti é uma das maiores estrelas conhecidas no universo.',
  'Estrela',
  'Hipergigante vermelha; Uma das maiores estrelas conhecidas; Localizada na constelação do Escudo; Variável em brilho e tamanho.',
  'https://en.wikipedia.org/wiki/UY_Scuti',
  '/images/uy_scuti.jpg',
  'estrela uy scuti hipergigante vermelha'
),
(
  'Rigel',
  'Rigel é uma das estrelas mais brilhantes do céu noturno e a estrela mais brilhante da constelação de Orion.',
  'Estrela',
  'Supergigante azul; Uma das estrelas mais luminosas da Via Láctea; Parte de um sistema estelar múltiplo; Está na fase final de sua vida.',
  'https://en.wikipedia.org/wiki/Rigel',
  '/images/rigel.jpg',
  'estrela rigel supergigante azul'
),
(
  'Betelgeuse',
  'Betelgeuse é uma supergigante vermelha brilhante e variável, localizada na constelação de Orion.',
  'Estrela',
  'Supergigante vermelha; Uma das maiores estrelas visíveis a olho nu; Está próxima do fim de sua vida e pode explodir como uma supernova a qualquer momento; Variável em brilho.',
  'https://en.wikipedia.org/wiki/Betelgeuse',
  '/images/betelgeuse.jpg',
  'estrela betelgeuse supergigante vermelha'
),

-- PLANETAS
(
  'Mercúrio',
  'O menor e mais próximo planeta do Sol.',
  'Planeta Rochoso',
  'Sem atmosfera; Grandes variações de temperatura; Superfície craterizada; Núcleo metálico massivo.',
  'https://pt.wikipedia.org/wiki/Mercúrio',
  '/images/mercurio.jpg',
  'mercurio planeta rochoso sistema solar'
),
(
  'Vênus',
  'O segundo planeta mais próximo do Sol e o mais quente do Sistema Solar.',
  'Planeta Rochoso',
  'Atmosfera densa de dióxido de carbono; Efeito estufa extremo; Superfície vulcânica; Rotação retrógrada.',
  'https://pt.wikipedia.org/wiki/Vénus',
  '/images/venus.jpg',
  'venus planeta rochoso sistema solar'
),
(
  'Terra',
  'O terceiro planeta a partir do Sol e o único com vida conhecida.',
  'Planeta Rochoso',
  'Atmosfera rica em oxigênio; Grande quantidade de água líquida; Placas tectônicas; Campo magnético.',
  'https://pt.wikipedia.org/wiki/Terra',
  '/images/terra.jpg',
  'terra planeta rochoso sistema solar vida'
),
(
  'Marte',
  'O quarto planeta a partir do Sol, conhecido como Planeta Vermelho.',
  'Planeta Rochoso',
  'Atmosfera fina de dióxido de carbono; Montanhas e vulcões; Evidências de água no passado; Objetivo de futuras missões tripuladas.',
  'https://pt.wikipedia.org/wiki/Marte',
  '/images/marte.jpg',
  'marte planeta rochoso sistema solar'
),
(
  'Júpiter',
  'O maior planeta do Sistema Solar.',
  'Gigante Gasoso',
  'Grande mancha vermelha; Forte campo magnético; Muitos satélites naturais; Composição principalmente de hidrogênio e hélio.',
  'https://pt.wikipedia.org/wiki/Júpiter',
  '/images/jupiter.jpg',
  'jupiter gigante gasoso sistema solar'
),
(
  'Saturno',
  'Conhecido por seus anéis proeminentes.',
  'Gigante Gasoso',
  'Anéis compostos de gelo e rocha; Vento forte; Muitos satélites naturais, incluindo Titã; Composição similar a Júpiter.',
  'https://pt.wikipedia.org/wiki/Saturno',
  '/images/saturno.jpg',
  'saturno gigante gasoso sistema solar aneis'
),
(
  'Urano',
  'O sétimo planeta a partir do Sol e o terceiro maior.',
  'Gigante de Gelo',
  'Rotação lateral; Atmosfera rica em metano; Muitos satélites naturais; Campo magnético inclinado.',
  'https://pt.wikipedia.org/wiki/Urano',
  '/images/urano.jpg',
  'urano gigante de gelo sistema solar'
),
(
  'Netuno',
  'O oitavo e mais distante planeta do Sol.',
  'Gigante de Gelo',
  'Vento mais rápido do Sistema Solar; Grande mancha escura; Muitos satélites naturais; Composição similar a Urano.',
  'https://pt.wikipedia.org/wiki/Netuno',
  '/images/netuno.jpg',
  'netuno gigante de gelo sistema solar'
),
(
  'Plutão',
  'Classificado como planeta anão em 2006.',
  'Planeta Anão',
  'Órbita excêntrica; Superfície gelada; Cinco luas conhecidas; Parte do Cinturão de Kuiper.',
  'https://pt.wikipedia.org/wiki/Plutão',
  '/images/plutao.jpg',
  'plutao planeta anão sistema solar'
),

-- COMETAS
(
  'Cometa Halley',
  'Um dos cometas mais famosos e observados da história.',
  'Cometa Periódico',
  'Período orbital de aproximadamente 76 anos; Visível a olho nu da Terra; Nomeado em homenagem a Edmund Halley; Seus retornos foram registrados por milhares de anos.',
  'https://pt.wikipedia.org/wiki/Cometa_Halley',
  '/images/cometa_halley.jpg',
  'cometa halley cometa periodico'
),
(
  'Cometa Hale-Bopp',
  'Um dos cometas mais brilhantes do século XX.',
  'Cometa de Longo Período',
  'Visível a olho nu por um período excepcionalmente longo; Descoberto por dois astrônomos amadores; Possui um núcleo grande e ativo; Seu retorno está previsto para milhares de anos no futuro.',
  'https://pt.wikipedia.org/wiki/Cometa_Hale-Bopp',
  '/images/cometa_hale_bopp.jpg',
  'cometa hale-bopp cometa de longo periodo'
),

-- LUAS
(
  'Lua',
  'O único satélite natural da Terra e o quinto maior satélite natural do Sistema Solar.',
  'Satélite Natural',
  'Influencia as marés terrestres; Superfície marcada por crateras; Sem atmosfera; Foi o primeiro corpo celeste além da Terra a ser visitado por humanos.',
  'https://pt.wikipedia.org/wiki/Lua',
  '/images/lua.jpg',
  'lua satelite natural terra'
),
(
  'Ganimedes',
  'A maior lua do Sistema Solar e do planeta Júpiter.',
  'Satélite Natural',
  'Maior que o planeta Mercúrio; Possui um oceano subterrâneo; Campo magnético próprio; Superfície com crateras e regiões mais jovens.',
  'https://pt.wikipedia.org/wiki/Ganimedes',
  '/images/ganimedes.jpg',
  'ganimedes satelite natural jupiter'
),
(
  'Io',
  'A lua mais interna dos satélites galileanos de Júpiter.',
  'Satélite Natural',
  'Mundo vulcânico ativo; Superfície coberta por enxofre; Aquecido pelas forças de maré de Júpiter; Não possui crateras de impacto visíveis.',
  'https://pt.wikipedia.org/wiki/Io_(lua)',
  '/images/io.jpg',
  'io satelite natural jupiter vulcanismo'
),
(
  'Callisto',
  'O segundo maior satélite natural de Júpiter e um dos mais antigos do Sistema Solar.',
  'Satélite Natural',
  'Superfície antiga e craterizada; Possui um oceano subterrâneo; Pouca atividade geológica; Um dos corpos mais antigos do Sistema Solar.',
  'https://pt.wikipedia.org/wiki/Callisto',
  '/images/callisto.jpg',
  'callisto satelite natural jupiter'
),
(
  'Titã',
  'A maior lua de Saturno e o único satélite natural do Sistema Solar com uma atmosfera densa.',
  'Satélite Natural',
  'Possui lagos e mares de metano e etano; Atmosfera rica em nitrogênio; Superfície com dunas e montanhas; Potencial para abrigar vida microbiana.',
  'https://pt.wikipedia.org/wiki/Titã_(lua)',
  '/images/titan.jpg',
  'titan satelite natural saturno atmosfera'
),
(
  'Phobos',
  'A maior das duas luas de Marte.',
  'Satélite Natural',
  'Formato irregular; Superfície coberta de crateras; Órbita muito próxima de Marte; Pode se chocar com Marte em alguns milhões de anos.',
  'https://pt.wikipedia.org/wiki/Fobos',
  '/images/phobos.jpg',
  'phobos satelite natural marte'
),
(
  'Deimos',
  'A menor e mais distante das duas luas de Marte.',
  'Satélite Natural',
  'Formato irregular; Superfície coberta de crateras; Órbita mais distante de Marte que Phobos; Pode ser um asteroide capturado.',
  'https://pt.wikipedia.org/wiki/Deimos',
  '/images/deimos.jpg',
  'deimos satelite natural marte'
),

-- NEBULOSAS
(
  'Nebulosa de Orion',
  'Uma das nebulosas mais brilhantes e estudadas, visível a olho nu em condições adequadas.',
  'Nebulosa de Emissão',
  'Região de formação estelar ativa; Localizada na constelação de Orion; Uma das nebulosas mais próximas da Terra; Contém estrelas jovens e quentes.',
  'https://pt.wikipedia.org/wiki/Nebulosa_de_%C3%93rion',
  '/images/nebulosa_orion.jpg',
  'nebulosa orion formação estelar'
),
(
  'Nebulosa do Anel',
  'Uma nebulosa planetária famosa por sua forma circular.',
  'Nebulosa Planetária',
  'Restos de uma estrela que está morrendo; Forma de anel brilhante em expansão; Localizada na constelação de Lira; Um dos objetos mais estudados do seu tipo.',
  'https://pt.wikipedia.org/wiki/Nebulosa_do_Anel',
  '/images/nebulosa_anel.jpg',
  'nebulosa planetária anel'
),
(
  'Nebulosa de Helix',
  'Uma das nebulosas planetárias mais próximas da Terra.',
  'Nebulosa Planetária',
  'Semelhante a um olho gigante; Estrutura complexa com filamentos e nós; Localizada na constelação de Aquário; Um dos objetos favoritos dos astrônomos amadores.',
  'https://pt.wikipedia.org/wiki/Nebulosa_de_H%C3%A9lix',
  '/images/nebulosa_helix.jpg',
  'nebulosa planetária helix'
),

-- TELESCÓPIOS
(
  'Telescópio Espacial Hubble',
  'O Telescópio Espacial Hubble é um observatório astronômico em órbita terrestre baixa. Lançado em 1990, o Hubble revolucionou a astronomia, fornecendo imagens detalhadas de objetos celestes distantes. Seu nome é uma homenagem ao astrônomo Edwin Hubble.',
  'Telescópio Espacial/Artificial',
  'Orbita a Terra a cerca de 550 km de altitude; Captura imagens em diversas faixas do espectro eletromagnético; Responsável por descobertas importantes sobre a expansão do universo, a idade das estrelas e a formação de galáxias; Já passou por diversas missões de manutenção e atualização.',
  'https://hubblesite.org/',
  '/images/hubble_telescope.jpg',
  'telescopio espacial hubble astronomia universo'
),
(
  'Telescópio Espacial James Webb',
  'O Telescópio Espacial James Webb é o sucessor científico do Hubble. Lançado em 2021, o Webb é o maior e mais poderoso telescópio espacial já construído. Ele foi projetado para ver mais longe no universo do que qualquer telescópio anterior.',
  'Telescópio Espacial/Artificial',
  'Opera em uma órbita estável a cerca de 1,5 milhão de quilômetros da Terra; Possui um espelho principal com 6,5 metros de diâmetro; Captura imagens em infravermelho, permitindo observar objetos celestes frios e distantes; Projetado para estudar a formação das primeiras galáxias, a atmosfera de exoplanetas e a origem do universo.',
  'https://webb.nasa.gov/',
  '/images/james_webb_telescope.jpg',
  'telescopio espacial james webb infravermelho universo'
);
