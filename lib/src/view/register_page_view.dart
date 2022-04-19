import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/login_page_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = "/cadastro";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        padding: const EdgeInsets.only(
            left: 54.0, top: 54.0, right: 54.0, bottom: 0.0),
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
            //Input Name
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(128, 255, 255, 255))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(128, 255, 255, 255))),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                  labelText: "Nome",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(128, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            const SizedBox(
              height: 20,
            ),
            //Input Email
            TextFormField(
              validator: (value) => validarEmail(value!),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                labelText: "Email",
                labelStyle: TextStyle(
                    color: Color.fromARGB(128, 255, 255, 255),
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Input Senha
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              validator: (value) => validarSenha(value!),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                labelText: "Senha",
                labelStyle: TextStyle(
                    color: Color.fromARGB(128, 255, 255, 255),
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
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(128, 255, 255, 255)),
                ),
                floatingLabelStyle:
                    TextStyle(color: Color.fromARGB(128, 255, 255, 255)),
                labelText: "Confirmar Senha",
                labelStyle: TextStyle(
                    color: Color.fromARGB(128, 255, 255, 255),
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
      ),
    );
  }
}