import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference collection =
    FirebaseFirestore.instance.collection(localUser.getUserId);

bool isReadingBook(CardProfileItem book) {
  return readingBooks.any((element) => element.getBookId == book.title);
}

Reading searchBook(CardProfileItem book) {
  return readingBooks.firstWhere((element) => element.getBookId == book.title);
}

bool isSavedBook(CardProfileItem book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsReadAfter;
  } else {
    return false;
  }
}

bool isReadBook(CardProfileItem book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsReaded;
  } else {
    return false;
  }
}

bool isFavoriteBook(CardProfileItem book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsFavorite;
  } else {
    return false;
  }
}

void saveBook(CardProfileItem book) async {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleReadAfter();
    await collection
        .doc(book.title)
        .update({'readAfter': result.getIsReadAfter});
  } else {
    createReadingBook(book, readAfter: true);
  }
}

void favoriteBook(CardProfileItem book) async {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleIsFavorite();
    await collection
        .doc(book.title)
        .update({'isFavorite': result.getIsFavorite});
  } else {
    createReadingBook(book, isFavorite: true);
  }
}

void doneBook(CardProfileItem book) async {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleReaded();
    await collection.doc(book.title).update({'readed': result.getIsReaded});
  } else {
    createReadingBook(book, readed: true);
  }
}

void createReadingBook(CardProfileItem book,
    {bool isFavorite = false,
    bool readAfter = false,
    bool readed = false}) async {
  await collection.doc(book.title).set(
    {
      'isFavorite': isFavorite,
      'readAfter': readAfter,
      'readed': readed,
    },
  );
  readingBooks.add(Reading(book.title, isFavorite, readAfter, readed));
}
