import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/login_page_controller.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(54.0),
      color: const Color.fromARGB(255, 127, 116, 206),
      child: Column(
        children: <Widget>[
          Image.asset('imagens/logo_imagem.jpeg'),
          Form(
              child: Column(
            children: <Widget>[
              // const Text(
              //   'Email',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 18,
              //   ),
              // ),
              TextFormField(
                validator: (value) => validarEmail(value!),
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                cursorColor: Colors.blue,
                validator: (value) => validarSenha(value!),
                decoration: const InputDecoration(hintText: 'Senha'),
              ),

              //TextButton(onPressed: () => {}, child: const Text('Login')),
              //TextButton(onPressed: () => {}, child: const Text('Cadastrar'))
            ],
          )),
          Material(
              color: const Color.fromARGB(204, 255, 255, 255),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                onTap: () => print('Login'),
                child: Ink(
                  height: 54,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 116, 206),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )),
          Material(
              color: const Color.fromARGB(204, 255, 255, 255),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                onTap: () => print('Cadastrar'),
                child: Ink(
                  height: 54,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 116, 206),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
