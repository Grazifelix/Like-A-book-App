import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:likeabook_app/src/model/user_model.dart';

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
  if (password.isEmpty) {
    return 'Insira uma senha';
  } else {
    localUser.setPassword = password;
    return null;
  }
}

Future<String?> signInFirebase() async {
  try {
    UserCredential result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: localUser.getEmail, password: localUser.getPassword);
    User user = result.user!;
    localUser.setUserId = user.uid;
    localUser.setName = user.displayName!;
    return null;
  } catch (error) {
    if (error.toString() ==
        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
      return 'senha incorreta';
    } else if (error.toString() ==
        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
      return 'Email não cadastrado';
    } else {
      return error.toString();
    }
  }
}
