import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:likeabook_app/src/controller/login_page_controller.dart';

String? validateName(String name) {
  if (name.isEmpty) {
    return 'Não existe alterações';
  }
  return null;
}

String? validatePassword(String password) {
  if (localUser.getPassword != password) {
    return 'Senha inválida';
  }
  return null;
}

String getName() => localUser.getName;
String getEmail() => localUser.getEmail;

void updateName(String name) {
  FirebaseAuth.instance.currentUser!.updateDisplayName(name);
  localUser.setName = name;
}

String? validateEmail(String email) {
  bool isValid = EmailValidator.validate(email);
  if (!isValid) {
    return 'email inválido';
  }
  return null;
}

void updateEmail(String email) {
    FirebaseAuth.instance.currentUser!.updateEmail(email);
    localUser.setEmail = email;
}
