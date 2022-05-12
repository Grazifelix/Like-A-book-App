import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:likeabook_app/src/model/user_model.dart';

class ProfileControl {
  String newPassword = '';
  LocalUser localUser;
  ProfileControl(this.localUser);

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

  String? validateNewPassword(String password) {
    var reg = RegExp(r'(?=.*\d)(?=.*[a-z])[\w]', caseSensitive: false);
    if (password.isEmpty) {
      return 'insira uma senha';
    } else if (password.length < 6 || password.length > 20) {
      return 'A senha deve ter entre 6 a 20 caracteres';
    } else if (!reg.hasMatch(password)) {
      return 'A senha deve conter letras e números';
    }
    newPassword = password;
    return null;
  }

  String? confirmNewPassword(String password) {
    if (password != newPassword) {
      return 'As senhas devem ser iguais';
    }
    return null;
  }

  void updatePassword(String password) {
    FirebaseAuth.instance.currentUser!.updatePassword(password);
    localUser.setPassword = password;
  }

  void logout() async{
    await FirebaseAuth.instance.signOut();
    localUser.singOut();
  }
}
