import 'package:likeabook_app/src/model/book_model.dart';
import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
//Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
//Flask API
import "package:http/http.dart" as http;
import 'dart:convert';

CollectionReference collection =
    FirebaseFirestore.instance.collection(localUser.getUserId);

void initUserCollection() async {
  var result = await collection.get();

  for (var doc in result.docs) {
    Reading reading =
        Reading(doc.id, doc['isFavorite'], doc['readAfter'], doc['readed']);
    reading.setRating = doc['rating'];
    readingBooks.add(reading);
  }
}

Future<void> getUserMode() async {
  var mode = await FirebaseFirestore.instance
      .collection(localUser.getUserId)
      .doc('mode')
      .get();
  localUser.setIsRandomMode = mode['random'];
}

//Flask API

var url = Uri.parse("http://127.0.0.1:5000/get-random-books");
var defautLivroUrl =
    'https://camo.githubusercontent.com/b7b7dca15c743879821e7cfc14e8034ecee3588e221de0a6f436423e304d95f5/68747470733a2f2f7a7562652e696f2f66696c65732f706f722d756d612d626f612d63617573612f33363664616462316461323032353338616531333332396261333464393030362d696d6167652e706e67';
Future getBooks() async {
  await getUserMode();
  final response =
      await http.get(url, headers: {"Access-Control-Allow-Origin": "true"});
  final decode = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (var n in decode['books']) {
      books.add(
        Book(defautLivroUrl, n['book_id'], n['titulo'], n['autor'],
            n['descricao'], n['rating']),
      );
    }
  }
  return books;
}
