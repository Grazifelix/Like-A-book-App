import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/book_model.dart';

List bookIdReadeds = [];
List bookIdSaveds = [];
List favoritesbooks = [];

void loadLists() {
  bookIdReadeds = readingBooks
      .where((element) => element.getIsReaded == true)
      .map((e) => e.getBookId)
      .toList();
  bookIdSaveds = readingBooks
      .where((element) => element.getIsReadAfter == true)
      .map((e) => e.getBookId)
      .toList();
  favoritesbooks = readingBooks
      .where((element) => element.getIsFavorite == true)
      .map((e) => e.getBookId)
      .toList();
}

int countReadedBooks() {
  return bookIdReadeds.length;
}

getReadedBooks(int index) {
  return books
      .firstWhere((element) => element.getBookId == bookIdReadeds[index]);
}

int countSavedBooks() {
  return bookIdSaveds.length;
}

getSavedBooks(int index) {
  return books
      .firstWhere((element) => element.getBookId == bookIdSaveds[index]);
}

isFavorite(Book book) {
  if (favoritesbooks.contains(book.getBookId)) {
    return true;
  } else {
    return false;
  }
}
