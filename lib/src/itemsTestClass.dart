class CardProfileItem {
  final String urlImage;
  final String title;
  final String autor;
  final int rating;
  final String description;
  bool favorite;

  CardProfileItem(
      {required this.urlImage,
      required this.title,
      required this.autor,
      required this.description,
      required this.rating,
      required this.favorite});
}

class RepositoryItens {

  List<CardProfileItem> items = [
    CardProfileItem(
        urlImage:
            'https://m.media-amazon.com/images/P/B01LZYT8Z8.01._SCLZZZZZZZ_SX500_.jpg',
        title: 'Enquanto houver champanhe, há esperança',
        autor: 'Joaquim Ferreira dos Santos',
        rating: 4,
        description:
            "No fundo, Zózimo foi um verdadeiro anarquista, um Groucho Marx, que observava com elegante desdém o grand monde que circulava em sua coluna Ele sabia aproveitar o que esse mundo tinha de gostoso, no sentido do tato e do paladar, mas não o reverenciava, não era seu escravo, não era um devotoRicardo Boechat Por quase trinta anos, entre 1969 e 1997, a sociedade brasileira foi desnudada pela escrita espirituosa do jornalista Zózimo Barrozo do Amaral em sua coluna diária no Jornal do Brasil e depois em O Globo Muito além dos registros sociais, ele oferecia um noticiário que flertava com a economia, a política e o esporte (sua paixão), em um estilo elegante e sem qualquer cerimôniaFez muitos amigos, ganhou uns poucos desafetos e chegou a ser preso duas vezes durante o regime militar Joaquim Ferreira dos Santos reconstitui toda a trajetória do colunista, desde sua infância, no bairro carioca do Jardim Botânico, passando por seu começo de carreira quase acidental no jornalismo, até conquistar uma coluna assinada no Jornal do Brasil, aos vinte e sete anos Ao seguir a trilha aberta por pioneiros como Álvaro Americano, Jacinto de Thormes e Ibrahim Sued, ele fez escolaEnquanto se tornava a mais respeitada grife do colunismo no país, Zózimo registrava nas páginas dos jornais as imensas mudanças ocorridas na elite carioca As festas saíram dos salões dos grã-finos e instalaram-se em casas noturnas como o Regines e o Hippopotamus A animação movida pelo champã ganhou aditivos como a cocaínaAo mesmo tempo que retratava o agito social, Zózimo enfrentava os próprios demônios Viveu amores, momentos de turbulência familiar e sérias questões de saúde Mas até o final foi um homem apaixonado pela vida, como ele gostava de dizer: Enquanto houver champanhe, há esperança",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://m.media-amazon.com/images/P/B01L2VQMWK.01._SCLZZZZZZZ_SX500_.jpg',
        title: 'Fãs do impossível',
        autor: 'Kate Scelsa',
        rating: 3,
        description:
            "Fãs do impossível conta a história de três amigos, Mira, Sebby e Jeremy, em meio aos complexos conflitos da adolescência Mesmo sentindo-se despedaçados, sem motivos para serem amados e tentando não sucumbir à solidão, os três lutam pela vida, cada um à sua maneiraMira está começando em uma escola nova, depois de passar um tempo no hospital Ela se sente insegura no novo ambiente e acha que não vai conseguir ficar longe de seu melhor amigo, Sebby, um garoto brincalhão que leva a vida com boas doses de mentira e bom humor, até que seu lado mais destrutivo vem à tona Jeremy está retornando à antiga escola, depois de um tempo afastado por causa de um incidente traumático que arruinou seu ano letivo Tímido e quieto, ele deseja se aproximar de Mira e Sebby Juntos, contra todas as expectativas, eles vão viver o impossível",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://m.media-amazon.com/images/P/B01GVYSA5A.01._SCLZZZZZZZ_SX500_.jpg',
        title: 'O demônio na Cidade Branca',
        autor: 'Erik Larson',
        rating: 4,
        description:
            "Assassinato, magia e loucura na feira que transformou os Estados UnidosNo final do século XIX os Estados Unidos eram uma nação jovem e orgulhosa, ávida por afirmar seu lugar entre as maiores potências mundiais Nesse contexto, a Feira de Chicago de 1893 teve papel fundamental: com o objetivo de apresentar a maior e mais impressionante exposição de inovações científicas e tecnológicas já idealizada, coube ao arquiteto Daniel Burnham, famoso por projetar alguns dos edifícios mais conhecidos do mundo, a difícil tarefa de transformar uma área desolada em um lugar de magnífica beleza: a Cidade Branca Reunindo as mais importantes mentes da época, Burnham enfrentou o mau clima, tragédias e o tempo escasso para construir a enorme estrutura da feiraA poucas quadras dali, outro homem igualmente determinado, H H Holmes, estava às voltas com mais uma obra grandiosa, um prédio estranho e complexo Nomeado Hotel da Feira Mundial, o lugar era na verdade um palácio de tortura, para o qual Holmes atraiu dezenas, talvez centenas de pessoas Autor de crimes inimagináveis, ele ficou conhecido como possivelmente o primeiro serial killer da história americanaSeparados, os feitos de Burnham e Holmes são fascinantes por si só Examinadas juntas, porém, suas histórias se tornam ainda mais impressionantes e oferecem uma poderosa metáfora das forças opostas que fizeram do século XX ao mesmo tempo um período de avanços monumentais e de crueldades imensuráveis Combinando uma pesquisa meticulosa com a narrativa envolvente que lhe é característica, Erik Larson escreveu um suspense arrebatador, que se torna ainda mais assustador por retratar acontecimentos reais",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/61uVn15zUlL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        title: 'O Navio dos Mortos',
        autor: 'Rick Riordan',
        rating: 5,
        description:
            "Nos dois primeiros livros da série, Magnus Chase, o herói boa-pinta que é a cara do astro de rock Kurt Cobain, ex-morador de rua e atual guerreiro imortal de Odin, precisou sair em algumas jornadas árduas e desafiar monstros, gigantes e deuses nórdicos para impedir que os nove mundos fossem destruídos no Ragnarök, o fim do mundo viking Em O navio dos mortos, Loki está livre da sua prisão e preparando Naglfar, o navio dos mortos, para invadir Asgard e lutar ao lado de um exército de gigantes e zumbis na batalha final contra os deuses Desta vez, Magnus, Sam, Alex, Blitzen, Hearthstone e seus amigos do Hotel Valhala vão precisar cruzar os oceanos de Midgard, Jötunheim e Niflheim em uma corrida desesperada para alcançar Naglfar antes de o navio zarpar no solstício de verão, enfrentando no caminho deuses do mar raivosos e hipsters, gigantes irritados e dragões malignos cuspidores de fogo Para derrotar Loki, o grupo precisa recuperar o hidromel de Kvásir, uma bebida mágica que dá a quem bebe o dom da poesia, e vencer o deus em uma competição de insultos",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51hiKQoxkIL._SX332_BO1,204,203,200_.jpg',
        title: 'Os 27 Crushes de Molly',
        autor: 'Becky Albertalli',
        rating: 4,
        description:
            "Molly já viveu muitas paixões, mas só dentro de sua cabeça E foi assim que, aos dezessete anos, a menina acumulou vinte e seis crushes Embora sua irmã gêmea, Cassie, viva dizendo que ela precisa ser mais corajosa, Molly não consegue suportar a possibilidade de levar um fora Então age com muito cuidado Como ela diz, garotas gordas sempre têm que ser cautelosasTudo muda quando Cassie começa a namorar Mina, e Molly pela primeira vez tem que lidar com uma solidão implacável e sentimentos muito conflitantes Por sorte, um dos melhores amigos de Mina é um garoto hipster, fofo e lindo, o vigésimo sétimo crush perfeito e talvez até um futuro namorado Se Molly finalmente se arriscar e se envolver com ele, pode dar seu primeiro beijo e ainda se reaproximar da irmãSó tem um problema, que atende pelo nome de Reid Wertheim, o garoto com quem Molly trabalha Ele é meio esquisito Ele gosta de Tolkien Ele vai a feiras medievais Ele usa tênis brancos ridículos Molly jamais, em hipótese alguma, se apaixonaria por ele Certo?Em Os 27 Crushes de Molly, a perspicácia, a delicadeza e o senso de humor de Becky Albertalli nos conquistam mais uma vez, em uma história sobre amizade, amadurecimento e, claro, aquele friozinho na barriga que só um crush pode provocar",
        favorite: false),
    CardProfileItem(
        urlImage: 'https://m.media-amazon.com/images/I/41QO7nMpuBL.jpg',
        title: 'Uma chance de lutar',
        autor: 'Elizabeth Warren',
        rating: 4,
        description:
            'Um dos nomes mais importantes na corrida presidencial dos Estados Unidos em 2020, Elizabeth Warren conta sua trajetória de mulher de classe média à política influenteA senadora Elizabeth Warren é um retrato perfeito da realização do sonho americano: filha de um zelador e uma telefonista, venceu as dificuldades financeiras e o lugar-comum da época, de que o principal objetivo de toda mulher era conseguir um bom casamento Tornou-se professora em Harvard, atuou como consultora do Congresso americano e assistente do presidente Barack Obama na implantação de uma agência nacional de proteção financeira do consumidor e, aos 62 anos, elegeu-se senadora pelo estado de MassachusettsEspecializada na Lei de Falências americana, Elizabeth projetou-se nos cenários acadêmico e político ao comprovar, com uma série inédita de estudos e levantamento de dados financeiros, que, diferentemente do que se pregava, a falência não é resultado exclusivo de más escolhas dos endividados, mas também dos abusos cometidos pelas instituições financeiras Dessa constatação em diante, sua carreira tornou-se uma batalha constante em favor da proteção das famílias em situação de endividamento  uma vez resguardadas das arbitrariedades bancárias, todas as pessoas podem ter uma chance de lutar, assim com ela teve um diaNeste livro escrito de forma veemente e desafiadora, Warren mostra por que escolheu lutar com todas as forças pela classe média  e por que se tornou uma heroína para todos aqueles que acreditam que o governo americano pode e deve fazer melhor pelas famílias trabalhadoras',
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/41FckoSJaoL._SX258_BO1,204,203,200_QL70_ML2_.jpg',
        title: 'As Outras Pessoas',
        autor: 'C.J. Tudor',
        rating: 4,
        description:
            "Uma menina pálida em um quarto branco Mãe e filha em fuga, numa corrida desenfreada e sem destino Uma garçonete de beira de estrada aprisionada na monotonia dos seus dias E um pai que perde esposa e filha de maneira brutal e sem explicação As histórias que se entrelaçam em As outras pessoas são peças de mais um quebra-cabeça sombrio e cheio de mistérios criado pela escritora C J TudorGabe é o pai desesperado que, consumido por uma esperança doentia, conduz a trama do livro enquanto guia seu carro pelas estradas em busca da filha Ela, assim como a mãe, foi dada como morta num crime não solucionado Mas ele tem certeza de que não foi bem assim Apesar de todas as provas que o contrariam, o homem que fez da angústia sua melhor amiga jura ter visto a filha viva em um carro desconhecido, parado à sua frente num engarrafamento logo antes de voltar para casa na noite em que perdeu sua família Três anos depois, Gabe não tem rumo Continua dirigindo obsessivamente pelas rodovias, tentando encontrar um caminho que o leve à solução do mistério Mas é longe da estrada, nos cantos mais obscuros e doentios da internet que ele acaba encontrando as pistas que tanto procura Quem navega pela deep web sabe dos riscos, mas ele não se importa Quem não tem nada na vida não tem nada a perderAssim como uma encruzilhada depois da curva, as várias histórias dessa trama se sobrepõem quando menos se espera e de forma surpreendente Porque mesmo uma garçonete desencantada e entediada pode guardar informações que ninguém imagina As figuras mais isoladas e enigmáticas podem um dia se converter em grandes aliados Os personagens à margem da sua vida podem ser mais relevantes do que parecem E os limites que separam o bem e o mal podem ser apenas pontos de vista diferentesEnquanto isso, uma nota de piano soa no quarto branco de uma menina pálida",
        favorite: false),
    CardProfileItem(
        urlImage: 'https://m.media-amazon.com/images/I/51cixOWLAlL._SY346_.jpg',
        title: 'Um Lugar Para Mim',
        autor: 'Melissa de la Cruz',
        rating: 4,
        description:
            "Jasmine de los Santos sempre fez o que era esperado dela Bonita e popular, ela estudou muito, deixou seus pais imigrantes filipinos orgulhosos e está pronta para colher os frutos do seu esforço na forma de uma bolsa integral para a faculdadeE então tudo se desfaz Um convite acadêmico força seus pais a revelarem a verdade: seus vistos expiraram há anos Toda a sua família está no país ilegalmente Isso significa que não terá bolsa nenhuma, talvez nem faculdade nenhuma e a ameaça muito real da deportaçãoPela primeira vez, Jasmine se rebela, experimentando todos os prazeres adolescentes para os quais ela nunca teve tempo no passado Logo quando está tentando entender esse novo mundo, ele é virado de ponta-cabeça por Royce Blakely, o filho chamoso de um congressista de alto escalão Jasmine já não tem mais ideia de onde, nem sequer se se encaixa no sonho americano Tudo o que sabe é que não vai desistir Porque quando as regras pelas quais você vivia não se aplicam mais, a única coisa a fazer é inventar suas próprias regras",
        favorite: false),
    CardProfileItem(
        urlImage: 'https://m.media-amazon.com/images/I/41yDY0SAP9L.jpg',
        title: '17941,As Mulheres do Castelo',
        autor: 'Jessica Shattuck',
        rating: 4,
        description:
            "Ao eclodir a Segunda Guerra Mundial, Marianne von Schneesingen retorna para o grande castelo, agora em ruínas, no qual ela era a anfitriã de bailes para a alta sociedade alemã Viúva de um opositor ao regime nazista, Marianne prometeu que seria a protetora de todas as mulheres cujos maridos morreram para lutar contra Hitler, tornando sua missão abrigá-las nesta imensa fortaleza Primeiro, ela salva Benita, a viúva de seu amigo de infância, da escravidão sexual imposta pelo exército russo, e Ania, uma mulher que vivia nos terríveis campos de trabalhos forçados para prisioneiros políticos Em vão, Marianne tenta construir uma nova família para si mesma a partir dos destroços do movimento de resistência de seu marido, certa de que seu passado em comum as manterá unidas para sempre Mas ela logo descobre que seu mundo é muito mais complicado do que imaginava Enquanto Benita começa uma relação clandestina com um ex-soldado nazista, Ania luta para esconder seu passado do julgamento de Marianne As três mulheres devem encarar o fato de que todas receberam três vidas uma antes da guerra outra, durante e finalmente sua vida após a guerra, na qual elas devem carregar cada um seu próprio fardo",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/41AYz8K6trL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        title: 'O Príncipe da Neblina',
        autor: 'Zafón',
        rating: 4,
        description:
            "Um diabólico príncipe que tem a capacidade de conceder e realizar qualquer desejo a um preço muito elevado O novo lar dos Carver, numa remota aldeia da costa sul inglesa, está rodeado de mistério Respira-se e sente-se a presença do espírito de Jacob, o filho dos antigos donos, que morreu afogadoAs estranhas circunstâncias dessa morte só se começam a perceber à medida que os jovens Max, a irmã Alicia e o amigo Roland vão descobrindo factos muito perturbadores sobre uma misteriosa personagem de seu nome o Príncipe da Neblina",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/513GMPGK6AS._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        title: 'Wink Poppy Midnight',
        autor: 'April Genevieve Tucholke',
        rating: 3,
        description:
            " Um thriller que traz narradores nada confiáveis que vão fazer você duvidar até da sua própria moral Indicado pela YALSA e pela TeenVogue como um dos melhores livros de ficção jovem-adulta de 2016 Wink é a nova vizinha esquisita e misteriosa, com seus cachos ruivos rebeldes, suas sardas e suas roupas estranhas Poppy é a rainha do ensino médio, com seu cabelo loiro perfeito, sua beleza estonteante e sua grande habilidade para a manipulação e crueldade Midnight é o menino doce e inseguro que se vê entre as duas Wink sabe contar muitas histórias de cor Ela está ciente de que todas elas precisam de um herói para derrotar o vilão Poppy não acredita em histórias Ela acredita acima de tudo, em si mesma e acha que pode conquistar e derrotar qualquer coisa Midnight até acredita em histórias, mas ele está certo de que nunca vai ser protagonista de nenhuma, mesmo que Wink pense o contrário Ele não é bom em nada Poppy é a rainha da escola Wink é a menina excluída que parece viver em um mundo particular e fantasioso Midnight é o garoto preso entre elas que se vê obrigado a lidar com as consequências de um trote sombrio Mas o que realmente aconteceu? Alguém sabe a verdade Alguém está mentindo",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51+GR0xBMWL._SX331_BO1,204,203,200_.jpg',
        title: '4845,Os Segredos da Mente Milionária',
        autor: 'T. Harv Eker',
        rating: 4,
        description:
            "Administração e Negócios > Finanças e Mercado de CapitaisSe as suas finanças andam na corda bamba, talvez esteja na hora de você refletir sobre o que T Harv Eker chama de o seu modelo de dinheiro - um conjunto de crenças que cada um de nós alimenta desde a infância e que molda o nosso destino financeiro, quase sempre nos levando para uma situação difícilNeste livro, Eker mostra como substituir uma mentalidade destrutiva - que você talvez nem perceba que tem - pelos arquivos de riqueza, 17 modos de pensar e agir que distinguem os ricos das demais pessoas Alguns desses princípios fundamentais são:Ou você controla o seu dinheiro ou ele controlará vocêO hábito de administrar as finanças é mais importante do que a quantidade de dinheiro que você temA sua motivação para enriquecer é crucial: se ela possui uma raiz negativa, como o medo, a raiva ou a necessidade de provar algo a si mesmo, o dinheiro nunca lhe trará felicidadeO segredo do sucesso não é tentar evitar os problemas nem se livrar deles, mas crescer pessoalmente para se tornar maior do que qualquer adversidadeOs gastos excessivos têm pouco a ver com o que você está comprando e tudo a ver com a falta de satisfação na sua vidaO autor também ensina um método eficiente de administrar o dinheiro Você aprenderá a estabelecer sua remuneração pelos resultados que apresenta e não pelas horas que trabalha Além disso, saberá como aumentar o seu patrimônio líquido - a verdadeira medida da riquezaA ideia é fazer o seu dinheiro trabalhar para você tanto quanto você trabalha para ele Para isso, é necessário poupar e investir em vez de gastar Enriquecer não diz respeito somente a ficar rico em termos financeiros, diz Eker É mais do que isso: trata-se da pessoa que você se torna para alcançar esse objetivo",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/41L1Kofn-UL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
        title: 'A Bola de Neve',
        autor: 'Alice Schroeder',
        rating: 5,
        description:
            "Este é o livro definitivo sobre a vida de um dos homens mais respeitados e fascinantes do mundo: Warren Buffett O lendário investidor pela primeira vez autorizou alguém a produzir sua biografia, concedendo a Alice Schroeder acesso irrestrito a seus familiares, amigos e parceiros  e, é claro, a ele mesmo A autora mergulhou a fundo na vida do empresário, desvendando sua personalidade, suas lutas, seus triunfos e seus momentos de sabedoria e de insensatez O resultado é a história de um dos maiores personagens de nosso tempo, uma figura complexa e interessante que se tornou uma lenda viva pela fortuna que construiu e, sobretudo, pelas idéias, causas e valores que defendeu Esta biografia revela o homem por trás do mito e mostra como sua obstinação e seu talento foram sendo lapidados desde garoto  aos 6 anos, ele procurava lucrar vendendo chicletes, aos 7 pediu de presente um livro sobre o mercado de ações, aos 10 fez sua primeira visita à bolsa de valores e, aos 11, seu primeiro investimento Apresentando a trajetória de Buffett desde sua infância, nos anos que se seguiram à Grande Depressão, até os dias de hoje, A bola de neve conta surpreendentes episódios da vida do empresário que, com sua conduta ética e disciplinada, tratou investidores como sócios e sempre pregou a honestidade como investidor, conselheiro e palestrante Ao longo de 60 anos, Buffett fez fortuna identificando valor onde ninguém via e aproveitando-se dos momentos de crise enquanto a maior parte dos investidores recuava Dono de um profundo conhecimento e instinto empresarial, além de uma notável capacidade de fazer amigos, sua vida é uma verdadeira aula de negócios, cheia de histórias saborosas e de ensinamentos valiosos Como qualquer ser humano, Warren Buffett é uma mistura de força e fragilidade Por mais notável que seja sua conta bancária, seu legado não é simplesmente a posição que ocupa no ranking das maiores fortunas, mas os princípios e ideais que enriqueceram a vida de tantas pessoas ao redor do mundo",
        favorite: false),
    CardProfileItem(
        urlImage: 'https://m.media-amazon.com/images/I/41Ym5OTIFTL.jpg',
        title: 'Muitas vidas, muitos mestres',
        autor: 'Brian L. Weiss',
        rating: 4,
        description:
            "Com mais de um milhão de livros vendidos no Brasil, Muitas Vidas, Muitos Mestres se tornou um marco ao contar uma história real que mais parece ficção: um médico de renome que coloca sua carreira em jogo ao se ver diante de evidências de reencarnaçãoPsiquiatra e pesquisador consagrado, o Dr Brian Weiss viu suas crenças e sua carreira virarem pelo avesso ao tratar de Catherine, uma paciente com fobias e ataques de ansiedade Durante uma sessão de hipnose, ela falou de traumas sofridos em vidas passadas que pareciam ser a origem se seus problemasCético, o Dr Weiss não acreditou no que estava presenciando até que Catherine começou a narrar fatos da vida dele que ela jamais poderia conhecer e a transmitir mensagens de espíritos altamente desenvolvidos - os Mestres - sobre a vida e a morteTransformado por essa experiência, ele surpreendeu a comunidade científica ao publicar este livro demonstrando o potencial curativo da terapia de vidas passadas, tornando-se a referência mundial nesse tipo de tratamentoPara muitos, a maior contribuição de Muitas Vidas, Muitos Mestres foi apresentar os princípios da reencarnação a milhões de pessoas que, por falta de oportunidade ou por preconceito, nunca teriam acesso a esta rica e transformadora filosofia espiritualEmocionante e inspirador, este livro já ajudou pessoas de todo o mundo a superar a dor de suas perdas e a adquirir uma nova compreensão da vida e da morte",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/418ae+gTRbL._SY344_BO1,204,203,200_.jpg',
        title: 'pais Brilhantes, Professores Fascinantes',
        autor: 'Augusto Cury',
        rating: 4,
        description:
            "Os pais e os professores lutam pelo mesmo sonho: tornar seus filhos e alunos felizes, saudáveis e sábios Mas jamais estiveram tão perdidos na árdua tarefa de educarApresentarei aqui ferramentas para promover a formação de pensadores, educar a emoção, expandir os horizontes da inteligência e produzir qualidade de vida",
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        title: 'Corte de Espinho e Rosas',
        autor: 'Sarah J. Maas',
        rating: 5,
        description:
            'Feyre, filha de um casal de mercadores humanos e falidos, se torna caçadora para sustentar a família. Dura como as flechas que carrega, letal como sua pontaria, ela abandona as fantasias de garota e as troca pela árdua vida nas florestas ao redor de sua aldeia.',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91Sn67XUSHL.jpg',
        title: 'Corte de Névoa e Furia',
        autor: 'Sarah J. Maas',
        rating: 4,
        description:
            'Feyre Archeron morreu Sob a Montanha. Nas garras de Amarantha, a jovem humana que ansiava por amor e proteção deixou de existir. Das cinzas de seu velho eu, Feyre Quebredora da Maldição foi Feita – com os poderes de sete Grão-Feéricos... e uma vontade tão férrea quanto o metal temido por eles.',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/81ibfYk4qmL.jpg',
        title: 'Harry Potter e a Pedra Filosofal',
        autor: 'J.K Rowling',
        rating: 2,
        description:
            'Harry Potter é um jovem comum de 11 anos até que recebe uma carta para estudar na Escola de Magia e Bruxaria de Hogwarts, onde ele descobre ser, na verdade, um bruxo. Nela, o garoto conquista a amizade de Hagrid, além de Hermione e Ron. No entanto, ele descobre ter um grande inimigo, o terrível Voldemort.',
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91T-vC38laL.jpg',
        title: 'A bussola de ouro',
        autor: 'Philip Pullman',
        rating: 4,
        description:
            'Na paisagem árida do Norte, onde tenta encontrar Roger, Lyra enfrenta uma terrível conspiração que faz uso de crianças-cobaias em sinistras experiências. Entre ursos usando armadura e bruxas que sobrevoam as sombrias geleiras, Lyra terá que fazer alianças inesperadas se quiser salvar o amigo de seu trágico destino',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/519j4iD9idL._SX346_BO1,204,203,200_.jpg',
        title: 'Hibísco Roxo',
        autor: 'Chimamanda Ngozi Adichie',
        rating: 5,
        description:
            'Protagonista e narradora de Hibisco roxo, a adolescente Kambili mostra como a religiosidade extremamente "branca" e católica de seu pai, Eugene, famoso industrial nigeriano, inferniza e destrói lentamente a vida de toda a família. O pavor de Eugene às tradições primitivas do povo nigeriano é tamanho que ele chega a rejeitar o pai, contador de histórias encantador, e a irmã, professora universitária esclarecida, temendo o inferno. Mas, apesar de sua clara violência e opressão, Eugene é benfeitor dos pobres e, estranhamente, apoia o jornal mais progressista do país. Durante uma temporada na casa de sua tia, Kambili acaba se apaixonando por um padre que é obrigado a deixar a Nigéria, por falta de segurança e de perspectiva de futuro. Enquanto narra as aventuras e desventuras de Kambili e de sua família, o romance também apresenta um retrato contundente e original da Nigéria atual, mostrando os remanescentes invasivos da colonização tanto no próprio país, como, certamente, também no resto do continente.',
        favorite: true),
  ];

  List getRegister() {
    return items.sublist(0,10);
  }

  List getHome() {
    return items.sublist(10);
  }

  int getRating({required CardProfileItem item}) {
    return item.rating;
  }
}
