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
var defautLivroUrl =
    "https://media.istockphoto.com/photos/light-purple-defocused-blurred-motion-abstract-background-picture-id1138288769?k=20&m=1138288769&s=612x612&w=0&h=qJ233qtmMHje4XqJZxnSbTUfLo4-gLdqDGp4F51HQuo=";

void initUserCollection() async {
  var url = Uri.parse("http://127.0.0.1:5000/get-user-books?user_id=${localUser.getUserId}");
  final response =
      await http.get(url, headers: {"Access-Control-Allow-Origin": "true"});
  final decode = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (var n in decode['books']) {
      userBooks.add(
        Book(defautLivroUrl, n['book_id'], n['titulo'], n['autor'],
            n['descricao'], n['rating'], n['cluster_id']),
      );
      Reading reading =
          Reading(n['book_id'], n['isFavorite'], n['readAfter'], n['readed']);
      reading.setRating = n['user_rating'];
      readingBooks.add(reading);
    }
  }
}

Future<bool> getUserMode() async {
  var mode = await FirebaseFirestore.instance
      .collection(localUser.getUserId)
      .doc('mode')
      .get();
  localUser.setIsRandomMode = mode['random'];
  return mode['random'];
}

//Flask API

Future getBooks() async {
  late Uri url;
  if (await getUserMode()) {
    url = Uri.parse("http://127.0.0.1:5000/get-random-books");
  } else {
    url = Uri.parse(
        "http://127.0.0.1:5000/get-recomendBooks?user_id=${localUser.getUserId}");
  }
  final response =
      await http.get(url, headers: {"Access-Control-Allow-Origin": "true"});
  final decode = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (var n in decode['books']) {
      books.add(
        Book(defautLivroUrl, n['book_id'], n['titulo'], n['autor'],
            n['descricao'], n['rating'], n['cluster_id']),
      );
    }
  }
  return books;
}
