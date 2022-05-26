class LocalUser {
  String _userId = '';
  String _name = '';
  String _email = '';
  String _password = '';
  bool _isRandomMode = true;

  String get getEmail => _email;
  String get getPassword => _password;
  String get getName => _name;
  String get getUserId => _userId;
  bool get getUserMode => _isRandomMode;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
  set setName(String name) => _name = name;
  set setUserId(String uid) => _userId = uid;
  set setIsRandomMode(bool mode) => _isRandomMode = mode;

  void singOut() {
    _userId = '';
    _name = '';
    _email = '';
    _password = '';
  }
}

LocalUser localUser = LocalUser();
