import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';

String? validarEmail(String value) {
  return null;
}

String? validarSenha(String value) {
  return null;
}

void sendtoFirebase() async {
  print('login');
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: 'test@gmail.com', password: 'password');
}
