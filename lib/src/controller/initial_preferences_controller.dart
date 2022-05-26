import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
import 'package:likeabook_app/src/model/book_model.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

List initialPreferencesBooks = [];

var defautLivroUrl =
    "https://media.istockphoto.com/photos/light-purple-defocused-blurred-motion-abstract-background-picture-id1138288769?k=20&m=1138288769&s=612x612&w=0&h=qJ233qtmMHje4XqJZxnSbTUfLo4-gLdqDGp4F51HQuo=";

Future<void> getInitialRandomBooks() async {
  var url = Uri.parse("http://127.0.0.1:5000/get-random-books");
  final response =
      await http.get(url, headers: {"Access-Control-Allow-Origin": "true"});
  final decode = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (var n in decode['books']) {
      initialPreferencesBooks.add(
        Book(defautLivroUrl, n['book_id'], n['titulo'], n['autor'],
            n['descricao'], n['rating'], n['cluster_id']),
      );
    }
  }
}

void initUserCollection(List selectBooks) {
  CollectionReference collection =
      FirebaseFirestore.instance.collection(localUser.getUserId);
  if (selectBooks.isEmpty) {
    collection.doc('mode').set({'random': true});
  } else {
    collection.doc('mode').set({'random': false});
    saveBooks(selectBooks, collection);
  }
}

void saveBooks(List selectBooks, CollectionReference collection) {
  for (Book book in selectBooks) {
    collection.doc(book.getBookId).set({
      'rating': -1,
      'isFavorite': false,
      'readAfter': false,
      'readed': true,
      'cluster_id': book.getClusterId,
    });
    readingBooks.add(Reading(book.getBookId, false, false, true));
  }
}
