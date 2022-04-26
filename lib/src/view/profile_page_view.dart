import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [buildCards()],
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
          const Divider(
            height: 3.0,
            thickness: 1.0,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [Books()],
          ),
        ],
      ),
    );
  }

  Widget buildCards() => Container(
        width: 111,
        height: 164,
        color: Colors.purple,
      );

  Widget Books() => Container(
        child: Column(children: [
          buildCards(),
          Icon(Icons.favorite, color: Color.fromARGB(255, 99, 85, 207)),
        ]),
      );
}
