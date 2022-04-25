import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/login_page_controller.dart';

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
        actions: [
          Container(
              //padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
            children: <Widget>[
              IconButton(
                  onPressed: () => {}, icon: const Icon(Icons.search_rounded)),
              SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset('assets/images/logo.png')),
            ],
          )),
        ],
      ),
      body: Container(),
    );
  }
}
