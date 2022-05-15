import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/model/reading_model.dart';

RepositoryItens repository = RepositoryItens();

int countReadedBooks(){
  return readingBooks.where((element) => element.getIsReaded == true).toList().length;
}

getReadedBooks(int index) {
  List<Reading> listaLidos =
      readingBooks.where((element) => element.getIsReaded == true).toList();

  return repository
      .getItens().firstWhere((element) => element.title == listaLidos[index].getBookId);
}

int countSavedBooks(){
  return readingBooks.where((element) => element.getIsReadAfter == true).toList().length;
}

getSavedBooks(int index) {
  List<Reading> listaLidos =
      readingBooks.where((element) => element.getIsReadAfter == true).toList();

  return repository
      .getItens().firstWhere((element) => element.title == listaLidos[index].getBookId);
}
