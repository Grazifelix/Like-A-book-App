import 'package:flutter/material.dart';
import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

RepositoryItens repository = RepositoryItens();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    initUserCollection();
    super.initState();
  }

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
        itemCount: repository.getHome().length,
        separatorBuilder: (context, _) => const Divider(
          height: 3.0,
          thickness: 1.0,
        ),
        itemBuilder: (context, index) =>
            cardBook(item: repository.getHome()[index]),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    item.autor,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  stars(item.rating),
                ],
              ),
            ),
          ),
        ]),
      );

  Widget stars(int rating) {
    switch (rating) {
      case 1:
        return const Icon(
          Icons.star,
          color: Color.fromARGB(255, 99, 85, 207),
          size: 34,
        );
      case 2:
        return Row(children: const [
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 99, 85, 207),
            size: 34,
          ),
          Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34)
        ]);
      case 3:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: const [
            Icon(
              Icons.star,
              color: Color.fromARGB(255, 99, 85, 207),
              size: 34,
            ),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34)
          ]),
        );
      case 4:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: const [
            Icon(
              Icons.star,
              color: Color.fromARGB(255, 99, 85, 207),
              size: 34,
            ),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34)
          ]),
        );
      case 5:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: const [
            Icon(
              Icons.star,
              color: Color.fromARGB(255, 99, 85, 207),
              size: 34,
            ),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34),
            Icon(Icons.star, color: Color.fromARGB(255, 99, 85, 207), size: 34)
          ]),
        );
    }
    throw '';
  }
}
