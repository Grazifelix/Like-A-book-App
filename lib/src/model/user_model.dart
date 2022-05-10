class LocalUser {
  String _userId = '';
  String _name = '';
  String _email = '';
  String _password = '';

  String get getEmail => _email;
  String get getPassword => _password;
  String get getName => _name;
  String get getUserId => _userId;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
  set setName(String name) => _name = name;
  set setUserId(String uid) => _userId = uid;

  void singOut() {
    _userId = '';
    _name = '';
    _email = '';
    _password = '';
  }
}
