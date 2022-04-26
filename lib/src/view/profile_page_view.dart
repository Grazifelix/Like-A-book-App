import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class CardProfileItem {
  final String urlImage;
  bool favorite;

  CardProfileItem({required this.urlImage, required this.favorite});
}

class _ProfilePageState extends State<ProfilePage> {
  List<CardProfileItem> items = [
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91Sn67XUSHL.jpg',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        favorite: false),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/91Sn67XUSHL.jpg',
        favorite: true),
    CardProfileItem(
        urlImage:
            'https://images-na.ssl-images-amazon.com/images/I/51AblvcjrJL._SX342_SY445_QL70_ML2_.jpg',
        favorite: true),
  ];

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
                onPressed: () => {},
                icon: const Icon(Icons.exit_to_app_outlined),
                tooltip: "Logout",
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
            children: const [
              Text("Livros Lidos"),
              Text('2'),
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
          const SizedBox(
            height: 15,
          ),
          //booklist_one
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) => buildCards(item: items[index]),
            ),
          ),

          //Books to read
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Ler mais tarde"),
              Text('2'),
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
          const SizedBox(
            height: 15,
          ),
          //booklist_two
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, _) => const SizedBox(
                width: 12.0,
              ),
              itemBuilder: (context, index) => buildCards(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCards({required CardProfileItem item}) => SizedBox(
        width: 111,
        child: Column(children: [
          Expanded(
              child: Image.network(
            item.urlImage,
          )),
          const SizedBox(
            height: 5,
          ),
          favorite(item.favorite)
        ]),
      );

  Widget favorite(bool favorite) {
    return Icon(
      favorite ? Icons.favorite : null,
      color: favorite ? const Color.fromARGB(255, 99, 85, 207) : null,
    );
  }
}
