class Reading {
  final String _bookId;
  bool _isFavorite;
  bool _readAfter;
  bool _readed;
  Reading(this._bookId, this._isFavorite, this._readAfter, this._readed);

  String get getBookId => _bookId;
  bool get getIsFavorite => _isFavorite;
  bool get getIsReadAfter => _readAfter;
  bool get getIsReaded => _readed;

  void toggleIsFavorite() => _isFavorite = !_isFavorite;
  void toggleReadAfter() => _readAfter = !_readAfter;
  void toggleReaded() => _readed = !_readed;
}

List<Reading> readingBooks = [];
