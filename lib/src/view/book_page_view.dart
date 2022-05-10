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
    final argumentsList = ModalRoute.of(context)!.settings.arguments as List;
    CardProfileItem itens = argumentsList[0];
    var localUser = argumentsList[1];
    BookPageController bookPageController = BookPageController(localUser);
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
                  IconButton(onPressed: () => {
                    if(bookPageController.isReadingbook(itens)){
                      bookPageController.saveBook(itens, true)
                    }else{
                      bookPageController.criarDoc(itens, readAfter: true)
                    }
                    
                  }, icon: Icon(Icons.save)),
                  IconButton(onPressed: () => {
                    if(bookPageController.isReadingbook(itens)){
                      bookPageController.doneBook(itens, true)
                    }else{
                      bookPageController.criarDoc(itens, readed: true)
                    }
                  }, icon: Icon(Icons.done)),
                  IconButton(onPressed: () => {
                    if(bookPageController.isReadingbook(itens)){
                      bookPageController.updateFavorites(itens, true)
                    }else{
                      bookPageController.criarDoc(itens, isFavorite: true)
                    }
                  }, icon: Icon(Icons.favorite)),
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
        child: Column(children: [
          Expanded(
            child: Material(
              child: Ink.image(
                image: NetworkImage(item.urlImage),
                fit: BoxFit.cover,
                child: InkWell(
                  hoverColor: const Color.fromARGB(86, 96, 79, 126),
                  splashColor: const Color.fromARGB(86, 96, 79, 126),
                  onTap: () =>
                      {Navigator.pushNamed(context, '/book', arguments: item)},
                ),
              ),
            ),
          ),
        ]),
      );
}
