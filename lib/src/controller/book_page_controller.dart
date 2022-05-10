import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookPageController {
  LocalUser localUser;
  List<Reading> readingsBooks = [];
  late CollectionReference collection;
  BookPageController(this.localUser) {
    iniciarColletion();
  }

  void iniciarColletion() async {
    collection = FirebaseFirestore.instance.collection(localUser.getUserId);
    var result = await collection.get();

    for (var doc in result.docs) {
      readingsBooks.add(
          Reading(doc.id, doc['isFavorite'], doc['readAfter'], doc['readed']));
    }
  }

  void criarDoc(CardProfileItem book,
      {bool isFavorite = false,
      bool readAfter = false,
      bool readed = false}) async {
    print('criou');
    await collection.doc(book.title).set(
      {
        'isFavorite': isFavorite,
        'readAfter': readAfter,
        'readed': readed,
      },
    );
    readingsBooks.add(Reading(book.title, isFavorite, readAfter, readed));
  }

  void updateFavorites(CardProfileItem book, bool isFavorite) async {
    print('atualizou');
    await collection.doc(book.title).update({'isFavorite': isFavorite});
    readingsBooks
        .firstWhere((element) => element.bookId == book.title)
        .isFavorite = isFavorite;
  }

  void saveBook(CardProfileItem book, bool save) async{
    await collection.doc(book.title).update({'readAfter': save});
    readingsBooks
        .firstWhere((element) => element.bookId == book.title)
        .isFavorite = save;
  }

  void doneBook(CardProfileItem book, bool done) async{
    await collection.doc(book.title).update({'readed': done});
    readingsBooks
        .firstWhere((element) => element.bookId == book.title)
        .isFavorite = done;
  }


  bool isReadingbook(CardProfileItem book) {
    if (readingsBooks.any((element) => element.bookId == book.title)) {
      return true;
    }
    return false;
  }
}
