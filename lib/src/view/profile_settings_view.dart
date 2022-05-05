import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
                icon: const Icon(Icons.home_outlined),
                tooltip: "home",
              )
            ],
          ),
        ],
      ),
      body: Container(),
    );
  }
}
