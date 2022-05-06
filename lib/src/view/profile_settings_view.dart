import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/profile_settings_controller.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _nameFormKey = GlobalKey<FormState>();
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Alterar Nome'),
                    content: Form(
                      key: _nameFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: getName(),
                            decoration:
                                const InputDecoration(labelText: "Nome"),
                            validator: (value) => validateName(value!),
                            onSaved: (value) => updateName(value!),
                          ),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration:
                                const InputDecoration(labelText: 'Senha'),
                            validator: (value) => validatePassword(value!),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Row(
                        children: [
                          Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              onTap: () => Navigator.pop(context),
                              child: Ink(
                                height: 40,
                                width: 80,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.0,
                                          0.4,
                                          0.6,
                                          1.0
                                        ],
                                        colors: [
                                          Color.fromARGB(255, 99, 85, 207),
                                          Color.fromARGB(255, 117, 102, 212),
                                          Color.fromARGB(255, 123, 103, 255),
                                          Color.fromARGB(255, 99, 85, 207)
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: const Center(
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 60),
                          Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: InkWell(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                              onTap: () {
                                if (_nameFormKey.currentState!.validate()) {
                                  _nameFormKey.currentState!.save();
                                  Navigator.pop(context);
                                }
                              },
                              child: Ink(
                                height: 40,
                                width: 180,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.0,
                                          0.4,
                                          0.6,
                                          1.0
                                        ],
                                        colors: [
                                          Color.fromARGB(255, 99, 85, 207),
                                          Color.fromARGB(255, 117, 102, 212),
                                          Color.fromARGB(255, 123, 103, 255),
                                          Color.fromARGB(255, 99, 85, 207)
                                        ]),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: const Center(
                                  child: Text(
                                    'Confirmar Alterações',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
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
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
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
