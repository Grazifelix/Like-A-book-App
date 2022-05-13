import 'package:likeabook_app/src/model/reading_model.dart';
import 'package:likeabook_app/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
