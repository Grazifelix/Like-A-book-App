import 'dart:html';

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
      width: double.maxFinite,
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
      )),
      padding: const EdgeInsets.all(54.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset('imagens/logo_imagem.jpeg'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => validarEmail(value!),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              floatingLabelStyle:
                  TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
              labelText: "Email",
              labelStyle: TextStyle(
                  //color: Color.fromARGB(128, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => validarSenha(value!),
            decoration: const InputDecoration(
              floatingLabelStyle:
                  TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
              labelText: "Senha",
              labelStyle: TextStyle(
                  //color: Color.fromARGB(128, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Material(
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
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.0,
                            0.45,
                            0.9
                          ],
                          colors: [
                            Color.fromARGB(146, 255, 255, 255),
                            Color.fromARGB(45, 127, 116, 206),
                            Color.fromARGB(100, 137, 137, 137),
                          ]),
                      //color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 116, 206),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 18,
          ),
          Material(
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
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.0,
                            0.45,
                            0.9
                          ],
                          colors: [
                            Color.fromARGB(146, 255, 255, 255),
                            Color.fromARGB(45, 127, 116, 206),
                            Color.fromARGB(100, 137, 137, 137),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 127, 116, 206),
                        fontSize: 20,
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