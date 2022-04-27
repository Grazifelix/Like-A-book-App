import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

String? validateEmail(String email) {
  bool isValid = EmailValidator.validate(email);
  if (!isValid) {
    return 'email inválido';
  }
  return null;
}

String? validatePassword(String password) {
  var reg = RegExp(r'(?=.*\d)(?=.*[a-z])[\w]', caseSensitive: false);
  if (password.length < 6 || password.length > 20) {
    return 'Tamanho de senha inválido';
  } else if (!reg.hasMatch(password)) {
    return 'A senha deve conter letras e números';
  }
  return null;
}

void sendtoFirebase() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test@gmail.com', password: 'pasord');
    print('login');
  } catch (e) {
    print(e);
  }
}
