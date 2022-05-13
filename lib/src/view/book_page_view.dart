import 'package:flutter/material.dart';
import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/controller/book_page_controller.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);
  static const routeName = '/book';

  @override
  State<BookPage> createState() => _BookPage();
}

RepositoryItens repository = RepositoryItens();

class _BookPage extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    final itens = ModalRoute.of(context)!.settings.arguments as CardProfileItem;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.4, 0.6, 1.0],
          colors: [
            Color.fromARGB(255, 99, 85, 207),
            Color.fromARGB(255, 117, 102, 212),
            Color.fromARGB(255, 123, 103, 255),
            Color.fromARGB(255, 99, 85, 207)
          ],
        ))),
        actions: [
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => {Navigator.pushNamed(context, '/profile')},
                icon: const Icon(Icons.person),
                tooltip: "Profile",
              )
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Center(
              child: Text(
            itens.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
          )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  width: 200,
                  height: 231,
                  child: Image.network(itens.urlImage)),
              Column(
                //criar funções para os butões
                children: [
                  IconButton(
                    onPressed: () {
                      saveBook(itens);
                      setState(() {});
                    },
                    icon: isSavedBook(itens)
                        ? const Icon(
                            Icons.save,
                            color: Colors.deepPurple,
                          )
                        : const Icon(
                            Icons.save,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (!isReadedBook(itens)) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ratingPopUp(itens);
                            },
                          );
                        }
                        doneBook(itens);
                        setState(() {});
                      },
                      icon: isReadedBook(itens)
                          ? const Icon(
                              Icons.done_all,
                              color: Colors.blue,
                            )
                          : const Icon(Icons.done)),
                  IconButton(
                      onPressed: () {
                        favoriteBook(itens);
                        setState(() {});
                      },
                      icon: isFavoriteBook(itens)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite)),
                ],
              )
            ],
          ),
          Center(
              child: Text(
            itens.autor,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          )),
          //esquema de mostragem de estrelas: precisa criar uma função para isso
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(
              Icons.star,
              color: Color.fromARGB(255, 99, 85, 207),
              size: 34,
            ),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
          ]),
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          Center(child: Text(itens.description)),
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),

          //Este list view esta recebendo itens do repositório, mas no futuro será do algoritmo de recomendação
          //de livros semelhantes ao livro clicado
          Container(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15.0),
              itemCount: repository.getItens().length,
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) =>
                  buildCards(item: repository.getItens()[index]),
            ),
          ),

          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }

//Este card build esta recebendo itens do repositório, mas no futuro será do algoritmo de recomendação
//de livros semelhantes ao livro clicado
  Widget buildCards({required CardProfileItem item}) => SizedBox(
        width: 111,
        child: Column(
          children: [
            Expanded(
              child: Material(
                child: Ink.image(
                  image: NetworkImage(item.urlImage),
                  fit: BoxFit.cover,
                  child: InkWell(
                    hoverColor: const Color.fromARGB(86, 96, 79, 126),
                    splashColor: const Color.fromARGB(86, 96, 79, 126),
                    onTap: () => {
                      Navigator.pushNamed(context, '/book', arguments: item)
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget ratingPopUp(CardProfileItem book) {
    double? iconsize = 36;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text('Como você avalia sua leitura?'),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ratingBook(book, 1);
                    setState(() {});
                  },
                  icon: starDesing(book, 1),
                  iconSize: iconsize,
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 2);
                    setState(() {});
                  },
                  icon: starDesing(book, 2),
                  iconSize: iconsize,
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 3);
                    setState(() {});
                  },
                  icon: starDesing(book, 3),
                  iconSize: iconsize,
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 4);
                    setState(() {});
                  },
                  icon: starDesing(book, 4),
                  iconSize: iconsize,
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 5);
                    setState(() {});
                  },
                  icon: starDesing(book, 5),
                  iconSize: iconsize,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget starDesing(CardProfileItem book, int starValue) {
    return activeStar(book, starValue)
        ? const Icon(
            Icons.star,
            color: Color.fromARGB(255, 100, 85, 207),
          )
        : const Icon(Icons.star_border);
  }
}
