class LocalUser {
  int userId = 0;
  String _name = '';
  String _email = '';
  String _password = '';

  String get getEmail => _email;
  String get getPassword => _password;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
  set setName(String name) => _name = name;
}
