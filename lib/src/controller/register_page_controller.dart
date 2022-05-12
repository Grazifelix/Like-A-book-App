import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:likeabook_app/src/model/user_model.dart';

String? validateName(String name) {
  if (name.isEmpty) {
    return 'insira seu nome';
  } else {
    localUser.setName = name;
    return null;
  }
}

String? validateEmail(String email) {
  bool isValid = EmailValidator.validate(email);
  if (!isValid) {
    return 'email inválido';
  } else {
    localUser.setEmail = email;
    return null;
  }
}

String? validatePassword(String password) {
  var reg = RegExp(r'(?=.*\d)(?=.*[a-z])[\w]', caseSensitive: false);
  if (password.isEmpty) {
    return 'insira uma senha';
  } else if (password.length < 6 || password.length > 20) {
    return 'A senha deve ter entre 6 a 20 caracteres';
  } else if (!reg.hasMatch(password)) {
    return 'A senha deve conter letras e números';
  } else {
    localUser.setPassword = password;
    return null;
  }
}

String? confirmPassword(String password2) {
  if (localUser.getPassword != password2) {
    return 'As senhas precisam ser iguais';
  } else {
    return null;
  }
}

Future<String?> registerInFirebase() async {
  try {
    UserCredential result =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: localUser.getEmail,
      password: localUser.getPassword,
    );
    User user = result.user!;
    localUser.setUserId = user.uid;
    user.updateDisplayName(localUser.getName);
    return null;
  } catch (error) {
    if (error.toString() ==
        '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      return 'Email já cadastrado';
    } else {
      return error.toString();
    }
  }
}

LocalUser getLocalUser() => localUser;
