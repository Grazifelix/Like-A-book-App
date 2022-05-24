import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class testPage extends StatefulWidget {
  const testPage({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<testPage> createState() => _testPage();
}

class _testPage extends State<testPage> {
  var url = Uri.parse("http://127.0.0.1:5000/test");

  Future getData() async {
    final response =
        await http.get(url, headers: {"Access-Control-Allow-Origin": "true"});
    final decode = jsonDecode(response.body);
    print(decode['id']);
    List<Test> nums = [];
    if (response.statusCode == 200) {
      int cont = -1;
      for (var n in decode) {
        cont += 1;
        Test testes = Test(n['id'][cont], n['num'][cont]);
        nums.add(testes);
      }
      print(nums.length);
      return nums;
    } else {
      print('error');
    }
  }

  // @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Test connection')),
//         body: Card(
//           child: FutureBuilder(
//               future: getData(),
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   return const Center(
//                     child: Text('loading...'),
//                   );
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(snapshot.data[index].num),
//                         );
//                       });
//                 }
//               }),
//         ));
//   }
// }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Test connection')),
        body: Center(
          child: ElevatedButton(
            child: Text('Click me'),
            onPressed: () => {getData()},
          ),
        ));
  }
}

class Test {
  String test = '';
  String test2 = '';
  Test(this.test, this.test2);
}
