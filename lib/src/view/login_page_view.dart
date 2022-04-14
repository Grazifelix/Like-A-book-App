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
    return Container(
      child: Column(
        children: [
          Image.asset('imagens/logo_imagem.jpeg'),
          Form(
              child: Column(
            children: [
              const Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Card(
                  child: TextFormField(
                validator: (value) => validarEmail(value!),
              )),
              const Text(
                'Senha',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Card(
                  child: TextFormField(
                validator: (value) => validarSenha(value!),
              )),
              Row(
                children: [
                  TextButton(onPressed: () => {}, child: const Text('Login')),
                  TextButton(
                      onPressed: () => {}, child: const Text('Cadastrar'))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
