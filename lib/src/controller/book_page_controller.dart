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

bool isReadedBook(CardProfileItem book) {
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

void createReadingBook(
  CardProfileItem book, {
  int? rating,
  bool isFavorite = false,
  bool readAfter = false,
  bool readed = false,
}) async {
  await collection.doc(book.title).set(
    {
      'rating': rating,
      'isFavorite': isFavorite,
      'readAfter': readAfter,
      'readed': readed,
    },
  );
  Reading reading = Reading(book.title, isFavorite, readAfter, readed);
  reading.setRating = rating;
  readingBooks.add(reading);
}

void ratingBook(CardProfileItem book, int rating) {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.setRating = rating;
    collection.doc(book.title).update({'rating': result.getRating});
  } else {
    createReadingBook(book, readed: true, rating: rating);
  }
}

bool activeStar(CardProfileItem book, int starValue) {
  if (isReadingBook(book)) {
    if (starValue <= searchBook(book).getRating!) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
