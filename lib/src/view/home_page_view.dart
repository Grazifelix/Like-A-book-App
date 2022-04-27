import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        itemCount: 6,
        separatorBuilder: (context, _) => const Divider(
          height: 3.0,
          thickness: 1.0,
        ),
        itemBuilder: (context, index) => CardBook(),
      ),
    );
  }

  Widget CardBook() => Container(
        height: 181,
      );
}
