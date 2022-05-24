import "package:http/http.dart" as http;
import "dart:convert";
import 'package:likeabook_app/src/model/book_model.dart';

void initCollection() async {
  var response =
      await http.get(Uri.http('http://127.0.0.1:5000/', 'get-random-books'));
  final decode = json.decode(response.body) as Map<String, dynamic>;
  int contador = -1;

  for (var value in decode.values) {
    contador++;
    Book book = Book(
        '',
        '',
        value['titulo{$contador}'],
        value['autor{$contador}'],
        value['descricao{$contador}'],
        value['rating{$contador}']);
    books.add(book);
    print(book);
  }
}
