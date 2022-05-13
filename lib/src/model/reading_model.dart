class Reading {
  final String _bookId;
  int? _rating;
  bool _isFavorite;
  bool _readAfter;
  bool _readed;
  Reading(this._bookId, this._isFavorite, this._readAfter, this._readed);

  String get getBookId => _bookId;
  bool get getIsFavorite => _isFavorite;
  bool get getIsReadAfter => _readAfter;
  bool get getIsReaded => _readed;
  int? get getRating => _rating;

  set setRating(int? value) {
    if (value! >= 1 && value <= 5) {
      _rating = value;
    } else {
      _rating = null;
    }
  }

  bool isAllFalse() {
    if (!_isFavorite && !_readAfter && !_readed) {
      return true;
    } else {
      return false;
    }
  }

  void toggleIsFavorite() => _isFavorite = !_isFavorite;
  void toggleReadAfter() => _readAfter = !_readAfter;
  void toggleReaded() => _readed = !_readed;
}

List<Reading> readingBooks = [];
