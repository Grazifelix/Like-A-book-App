import 'package:flutter/material.dart';
import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/controller/book_page_controller.dart';
import 'package:likeabook_app/src/model/book_model.dart';

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
    final itens = ModalRoute.of(context)!.settings.arguments as Book;
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
            itens.getTitle,
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
                  child: Image.network(itens.getUrlImage)),
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
                        doneBook(itens);
                        setState(() {});
                        if (isReadedBook(itens)) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ratingPopUp(itens);
                            },
                          );
                        }
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
            itens.getAuthor,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          )),
          //esquema de mostragem de estrelas: precisa criar uma função para isso
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            starDesing(itens, 1, false),
            starDesing(itens, 2, false),
            starDesing(itens, 3, false),
            starDesing(itens, 4, false),
            starDesing(itens, 5, false),
          ]),
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(child: Text(itens.getDescription)),
          const SizedBox(height: 30),
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
              itemCount: repository.getHome().length,
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) =>
                  buildCards(item: repository.getHome()[index]),
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
                      Navigator.popAndPushNamed(context, '/book',
                          arguments: item)
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget ratingPopUp(Book book) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text(
            'Como você avalia sua leitura?',
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 25),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ratingBook(book, 1);
                    setState(() {});
                  },
                  icon: starDesing(book, 1, true),
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 2);
                    setState(() {});
                  },
                  icon: starDesing(book, 2, true),
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 3);
                    setState(() {});
                  },
                  icon: starDesing(book, 3, true),
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 4);
                    setState(() {});
                  },
                  icon: starDesing(book, 4, true),
                ),
                IconButton(
                  onPressed: () {
                    ratingBook(book, 5);
                    setState(() {});
                  },
                  icon: starDesing(book, 5, true),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ok',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color.fromARGB(255, 99, 85, 207), fontSize: 20),
                ))
          ],
        );
      },
    );
  }

  Widget starDesing(Book book, int starValue, bool userRating) {
    return activeStar(book, starValue, userRating)
        ? const Icon(
            Icons.star,
            color: Color.fromARGB(255, 100, 85, 207),
            size: 36,
          )
        : const Icon(
            Icons.star_border,
            size: 36,
          );
  }
}
