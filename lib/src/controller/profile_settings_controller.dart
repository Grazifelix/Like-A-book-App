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

String getName() {
  return localUser.getName;
}

void updateName(String name) {
  FirebaseAuth.instance.currentUser!.updateDisplayName(name);
  localUser.setName = name;
}
