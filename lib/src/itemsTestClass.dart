class CardProfileItem {
  final String urlImage;
  final String title;
  final String autor;
  final String description;
  bool favorite;

  CardProfileItem(
      {required this.urlImage,
      required this.title,
      required this.autor,
      required this.description,
      required this.favorite});
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
        description: 'Descrição',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91Sn67XUSHL.jpg',
        title: 'Corte de Névoa e Furia',
        autor: 'Sarah J. Maas',
        description: 'Descrição',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        title: 'Corte de Espinho e Rosas',
        autor: 'Sarah J. Maas',
        description: 'Descrição',
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91Sn67XUSHL.jpg',
        title: 'Corte de Névoa e Furia',
        autor: 'Sarah J. Maas',
        description: 'Descrição',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        title: 'Corte de Espinho e Rosas',
        autor: 'Sarah J. Maas',
        description: 'Descrição',
        favorite: true),
  ];

  List getItens() {
    return items;
  }
}
