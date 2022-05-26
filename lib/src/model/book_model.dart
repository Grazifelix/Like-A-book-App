class Book {
  final String _urlImage;
  final String _bookId;
  final String _title;
  final String _rating;
  final String _description;
  final String _author;
  final String _clusterId;

  Book(this._urlImage, this._bookId, this._title, this._author,
      this._description, this._rating, this._clusterId);

  String get getUrlImage => _urlImage;
  String get getBookId => _bookId;
  String get getTitle => _title;
  String get getAuthor => _author;
  String get getRating => _rating;
  String get getDescription => _description;
  String get getClusterId => _clusterId;
}

List<Book> books = [];
