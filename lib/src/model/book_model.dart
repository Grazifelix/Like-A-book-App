class Book {
  String _urlImage = '';
  String _bookId = '';
  String _title = '';
  String _rating = '';
  String _description = '';
  String _author = '';

  Book(this._urlImage, this._bookId, this._title, this._author,
      this._description, this._rating);

  String get getUrlImage => _urlImage;
  String get getBookId => _bookId;
  String get getTitle => _title;
  String get getAuthor => _author;
  String get getRating => _rating;
  String get getDescription => _description;
}

List<Book> books = [];
