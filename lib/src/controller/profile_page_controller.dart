import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/model/reading_model.dart';

RepositoryItens repository = RepositoryItens();

List bookIdReadeds = [];
List bookIdSaveds = [];

void loadLists() {
  bookIdReadeds = readingBooks
      .where((element) => element.getIsReaded == true)
      .map((e) => e.getBookId)
      .toList();
  bookIdSaveds = readingBooks
      .where((element) => element.getIsReadAfter == true)
      .map((e) => e.getBookId)
      .toList();
}

int countReadedBooks() {
  return bookIdReadeds.length;
}

getReadedBooks(int index) {
  return repository
      .getItens()
      .firstWhere((element) => element.title == bookIdReadeds[index]);
}

int countSavedBooks() {
  return bookIdSaveds.length;
}

getSavedBooks(int index) {
  return repository
      .getItens()
      .firstWhere((element) => element.title == bookIdSaveds[index]);
}
