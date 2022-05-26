import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/profile_page_controller.dart';
import 'package:likeabook_app/src/model/book_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    loadLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings),
                tooltip: "Configurações",
              )
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          //Books already read
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Livros Lidos"),
              Text('${countReadedBooks()}'),
              /*this will be a number count of the user read books*/
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          //divider
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          //booklist_one
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15.0),
              itemCount: countReadedBooks(),
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) =>
                  buildCards(item: getReadedBooks(index), isDone: true),
            ),
          ),

          //Books to read
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ler mais tarde"),
              Text('${countSavedBooks()}'),
              /*this will be a number count of the user read books*/
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          //divider2
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          //booklist_two
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 15.0),
              itemCount: countSavedBooks(),
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) =>
                  buildCards(item: getSavedBooks(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCards({required Book item, bool isDone = false}) => SizedBox(
        width: 111,
        child: Column(children: [
          Expanded(
            child: Material(
              child: Ink.image(
                image: NetworkImage(item.getUrlImage),
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
          const SizedBox(
            height: 5,
          ),
          favorite(isFavorite(item), isDone)
        ]),
      );

  Widget favorite(bool favorite, bool isDone) {
    return Icon(
      favorite && isDone ? Icons.favorite : null,
      color: favorite ? const Color.fromARGB(255, 99, 85, 207) : null,
    );
  }
}
