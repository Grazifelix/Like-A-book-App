import 'package:flutter/material.dart';
import 'package:likeabook_app/src/view/login_page_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LikeABook',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        LoginHomePage.routeName: (context) => const LoginHomePage(),
      },
    );
  }
}
