class CardProfileItem {
	final String urlImage;
	final String title;
	final String autor;
	final int rating;
	final String description;
	bool favorite;

	CardProfileItem({
		required this.urlImage,
		required this.title,
		required this.autor,
		required this.description,
		required this.rating,
		required this.favorite
	});
}

class RepositoryItens {
	RepositoryItens() {
	getItens();
	}

	List<CardProfileItem> items = [
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

	List getItens() {
	return items;
	}

	int getRating({required CardProfileItem item}) {
	return item.rating;
	}
}
