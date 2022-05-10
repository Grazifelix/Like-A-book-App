import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/register_page_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = "/cadastro";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  //Input Name
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (name) => validateName(name!),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(128, 255, 255, 255))),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(128, 255, 255, 255))),
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(128, 255, 255, 255)),
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
                    validator: (email) => validateEmail(email!),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
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
                    validator: (password) => validatePassword(password!),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
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
                    validator: (password2) => confirmPassword(password2!),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(128, 255, 255, 255)),
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
                ],
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
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    var resultError = await registerInFirebase();
                    if (resultError == null) {
                      Navigator.popAndPushNamed(context, '/home',  arguments: getLocalUser());
                    } else {
                      setState(() => error = resultError);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error)));
                    }
                  }
                },
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
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Color.fromARGB(128, 255, 255, 255), fontSize: 18),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
