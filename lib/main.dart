import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:likeabook_app/src/pageTest.dart';
import 'package:likeabook_app/src/view/book_page_view.dart';
import 'package:likeabook_app/src/view/home_page_view.dart';
import 'package:likeabook_app/src/view/initial_preferences_view.dart';
import 'package:likeabook_app/src/view/login_page_view.dart';
import 'package:likeabook_app/src/view/profile_page_view.dart';
import 'package:likeabook_app/src/view/register_page_view.dart';
import 'package:likeabook_app/src/view/profile_settings_view.dart';
//Configurações do Firebase do seu projeto
import 'firebase_config.dart';

void main() async {
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: FirebaseConfig().apiKey,
      appId: FirebaseConfig().appId,
      messagingSenderId: FirebaseConfig().messagingSenderId,
      projectId: FirebaseConfig().projectId,
      authDomain: FirebaseConfig().authDomain,
      storageBucket: FirebaseConfig().storageBucket,
    ),
  );
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
      initialRoute: LoginHomePage.routeName,
      routes: {
        LoginHomePage.routeName: (context) => const LoginHomePage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        HomePage.routeName: (context) => const HomePage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        BookPage.routeName: (context) => const BookPage(),
        ProfileSettingsPage.routeName: (context) => const ProfileSettingsPage(),
        InitialPreferences.routeName: (contex) => const InitialPreferences(),
        testPage.routeName: (contex) => const testPage(),
      },
    );
  }
}
