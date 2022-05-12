import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/profile_settings_controller.dart';
import 'package:likeabook_app/src/model/user_model.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _nameFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  bool check1 = false;
  bool check2 = false;

  @override
  Widget build(BuildContext context) {
    ProfileControl profileControl = ProfileControl(localUser);
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
                    context, '/home', (route) => false,
                    arguments: localUser),
                icon: const Icon(Icons.home_outlined),
                tooltip: "home",
              )
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Modo da recomendação',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w100),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 99, 85, 207),
                    shape: const CircleBorder(),
                    value: check1,
                    onChanged: (value) => setState(
                      () {
                        check1 = value!;
                        check2 = !value;
                      },
                    ),
                  ),
                  const Text(
                    'Modo Personalizado',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, bottom: 30),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 99, 85, 207),
                    shape: const CircleBorder(),
                    value: check2,
                    onChanged: (value) => setState(
                      () {
                        check2 = value!;
                        check1 = !value;
                      },
                    ),
                  ),
                  const Text(
                    'Modo Aleatório',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            const Text(
              'Alterar Meus Dados',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w100),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Alterar Nome',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        ),
                        content: Form(
                          key: _nameFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                initialValue: localUser.getName,
                                decoration:
                                    const InputDecoration(labelText: "Nome"),
                                validator: (value) =>
                                    profileControl.validateName(value!),
                                onSaved: (value) =>
                                    profileControl.updateName(value!),
                              ),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration:
                                    const InputDecoration(labelText: 'Senha'),
                                validator: (value) =>
                                    profileControl.validatePassword(value!),
                              ),
                            ],
                          ),
                        ),
                        actions: [buttonsDialog(_nameFormKey)],
                      );
                    },
                  );
                },
                child: const Text('Alterar Nome'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Alterar Email',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        ),
                        content: Form(
                          key: _emailFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                initialValue: localUser.getEmail,
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                                validator: (value) =>
                                    profileControl.validateEmail(value!),
                                onSaved: (value) =>
                                    profileControl.updateEmail(value!),
                              ),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration:
                                    const InputDecoration(labelText: 'Senha'),
                                validator: (value) =>
                                    profileControl.validatePassword(value!),
                              ),
                            ],
                          ),
                        ),
                        actions: [buttonsDialog(_emailFormKey)],
                      );
                    },
                  );
                },
                child: const Text('Alterar Email'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, bottom: 30),
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Alterar Senha',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        ),
                        content: Form(
                          key: _passwordFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    labelText: "Nova senha"),
                                validator: (value) =>
                                    profileControl.validateNewPassword(value!),
                                onSaved: (value) =>
                                    profileControl.updatePassword(value!),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    labelText: "Confirmar Nova senha"),
                                validator: (value) =>
                                    profileControl.confirmNewPassword(value!),
                              ),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    labelText: 'Senha antiga'),
                                validator: (value) =>
                                    profileControl.validatePassword(value!),
                              ),
                            ],
                          ),
                        ),
                        actions: [buttonsDialog(_passwordFormKey)],
                      );
                    },
                  );
                },
                child: const Text('Alterar Senha'),
              ),
            ),
            TextButton(
              onPressed: () {
                profileControl.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: const Text(
                'Sair',
                style: TextStyle(
                    color: Color.fromARGB(255, 99, 85, 207),
                    fontSize: 20,
                    fontWeight: FontWeight.w100),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonsDialog(GlobalKey<FormState> formKey) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
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
                    borderRadius: BorderRadius.all(Radius.circular(30))),
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
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
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
                    borderRadius: BorderRadius.all(Radius.circular(30))),
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
      ),
    );
  }
}
