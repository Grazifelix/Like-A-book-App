import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool check1 = false;
  bool check2 = false;

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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false),
                icon: const Icon(Icons.home_outlined),
                tooltip: "home",
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Modo da recomendação'),
          const Divider(),
          Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: check1,
                onChanged: (value) => setState(
                  () {
                    check1 = value!;
                    check2 = !value;
                  },
                ),
              ),
              const Text('Modo Aleatorio'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                shape: const CircleBorder(),
                value: check2,
                onChanged: (value) => setState(
                  () {
                    check2 = value!;
                    check1 = !value;
                  },
                ),
              ),
              const Text('Modo Aleatorio'),
            ],
          ),
          const Text('Alterar Meus Dados'),
          const Divider(),
          TextButton(
            onPressed: () => {},
            child: const Text('Alterar Nome'),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text('Alterar Email'),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text('Alterar Senha'),
          ),
          TextButton(
            onPressed: () => {
              Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false),
            },
            child: const Text(
              'Sair',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
