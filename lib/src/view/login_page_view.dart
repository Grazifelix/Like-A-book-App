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
      padding: const EdgeInsets.only(
          left: 54.0, top: 54.0, right: 54.0, bottom: 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => validateEmail(value!),
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
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => validatePassword(value!),
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
                onTap: () => sendtoFirebase(),
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
            height: 8,
          ),
          TextButton(
              child: const Text(
                "Cadastrar",
                style: TextStyle(
                    color: Color.fromARGB(128, 255, 255, 255), fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              }),
        ],
      ),
    ));
  }
}
