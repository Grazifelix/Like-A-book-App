import 'package:flutter/material.dart';
import 'package:likeabook_app/src/view/home_page_view.dart';
import 'package:likeabook_app/src/view/login_page_view.dart';
import 'package:likeabook_app/src/view/profile_page_view.dart';
import 'package:likeabook_app/src/view/register_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LikeABook',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 99, 85, 207)),
      ),
      initialRoute: '/',
      routes: {
        LoginHomePage.routeName: (context) => const LoginHomePage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        HomePage.routeName: (context) => const HomePage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
