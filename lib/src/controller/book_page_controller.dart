import 'package:likeabook_app/src/model/book_model.dart';
import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference collection =
    FirebaseFirestore.instance.collection(localUser.getUserId);

bool isReadingBook(Book book) {
  return readingBooks.any((element) => element.getBookId == book.getBookId);
}

Reading searchBook(Book book) {
  return readingBooks
      .firstWhere((element) => element.getBookId == book.getBookId);
}

bool isSavedBook(Book book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsReadAfter;
  } else {
    return false;
  }
}

bool isReadedBook(Book book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsReaded;
  } else {
    return false;
  }
}

bool isFavoriteBook(Book book) {
  if (isReadingBook(book)) {
    return searchBook(book).getIsFavorite;
  } else {
    return false;
  }
}

void saveBook(Book book) {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleReadAfter();
    if (result.isAllFalse()) {
      cleanDatabase(result);
    } else {
      collection.doc(book.getBookId).update(
        {
          'readAfter': result.getIsReadAfter,
        },
      );
    }
  } else {
    createReadingBook(book, readAfter: true);
  }
}

void favoriteBook(Book book) {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleIsFavorite();
    if (result.isAllFalse()) {
      cleanDatabase(result);
    } else {
      collection.doc(book.getBookId).update(
        {
          'isFavorite': result.getIsFavorite,
        },
      );
    }
  } else {
    createReadingBook(book, isFavorite: true);
  }
}

void doneBook(Book book) {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.toggleReaded();
    if (result.isAllFalse()) {
      cleanDatabase(result);
    } else {
      collection.doc(book.getBookId).update(
        {
          'readed': result.getIsReaded,
        },
      );
    }
  } else {
    createReadingBook(book, readed: true);
  }
}

void createReadingBook(
  Book book, {
  int rating = -1,
  bool isFavorite = false,
  bool readAfter = false,
  bool readed = false,
}) {
  collection.doc(book.getBookId).set(
    {
      'rating': rating,
      'isFavorite': isFavorite,
      'readAfter': readAfter,
      'readed': readed,
    },
  );
  Reading reading = Reading(book.getBookId, isFavorite, readAfter, readed);
  reading.setRating = rating;
  readingBooks.add(reading);
}

void ratingBook(Book book, int starValue) {
  if (isReadingBook(book)) {
    var result = searchBook(book);
    result.setRating = starValue;
    collection.doc(book.getTitle).update({'rating': result.getRating});
  } else {
    createReadingBook(book, readed: true, rating: starValue);
  }
}

bool activeStar(Book book, int starValue, bool userRating) {
  if (userRating) {
    if (isReadingBook(book)) {
      if (starValue <= searchBook(book).getRating) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    if (starValue <= double.parse(book.getRating).truncate()) {
      return true;
    } else {
      return false;
    }
  }
}

void cleanDatabase(Reading book) {
  readingBooks.remove(book);
  collection.doc(book.getBookId).delete();
}
