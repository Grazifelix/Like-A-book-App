import 'package:flutter/material.dart';
import 'package:likeabook_app/src/itemsTestClass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

RepositoryItens repository = RepositoryItens();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.search_rounded),
          tooltip: "Searching",
        ),
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        itemCount: repository.getItens().length,
        separatorBuilder: (context, _) => const Divider(
          height: 3.0,
          thickness: 1.0,
        ),
        itemBuilder: (context, index) =>
            cardBook(item: repository.getItens()[index]),
      ),
    );
  }

  Widget cardBook({required CardProfileItem item}) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        height: 200,
        child: Row(children: [
          Material(
            child: Ink.image(
              image: NetworkImage(item.urlImage),
              fit: BoxFit.cover,
              width: 125,
              height: 181,
              child: InkWell(
                  hoverColor: const Color.fromARGB(86, 96, 79, 126),
                  splashColor: const Color.fromARGB(86, 96, 79, 126),
                  onTap: () => {
                        Navigator.pushNamed(
                          context,
                          '/book',
                          arguments: item,
                        )
                      }),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //há um problema de overflow do texto (texto ultrapassando limites da tela) para concertar depois
                Text(
                  item.title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 15),
                Text(
                  item.autor,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                //classifição dos livros: criar uma função de mostragem de estrelas

                Row(children: const [
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 99, 85, 207),
                    size: 34,
                  ),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 99, 85, 207), size: 34),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 99, 85, 207), size: 34),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 99, 85, 207), size: 34),
                  Icon(Icons.star,
                      color: Color.fromARGB(255, 99, 85, 207), size: 34),
                ])
              ],
            ),
          ),
        ]),
      );
}
