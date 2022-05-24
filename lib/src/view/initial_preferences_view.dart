import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/initial_controller.dart';
import 'package:likeabook_app/src/itemsTestClass.dart';
import 'package:likeabook_app/src/model/book_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InitialPreferences extends StatefulWidget {
  const InitialPreferences({Key? key}) : super(key: key);
  static const routeName = '/preferences';

  @override
  State<InitialPreferences> createState() => _InitialPreferences();
}

RepositoryItens repository = RepositoryItens();

class Test {
  String test = '';
  String test2 = '';
  Test(this.test, this.test2);
}

class _InitialPreferences extends State<InitialPreferences> {
  final List selectBooks =
      []; //essa lista será utilizada pelo algoritmo de recomendação
  bool check2 = false;
  String test = '';
  String test2 = '';
  List<Test> tst = [];
  var url = Uri.parse("http://127.0.0.1:5000/test");

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    final response = await http.get(url);
    final decode = jsonDecode(response.body);
    // for (var n in decode.values) {
    //   Test t = Test(n['num'], n['num2']);
    //   tst.add(t);
    //   print(tst);
    // }
    if (response.statusCode == 200) {
      setState(() {
        for (var n in decode) {
          Test nn = Test(n['num'], n['num2']);
          tst.add(nn);
        }
        if (tst.length == null) {
          print('Lista vazia');
        } else {
          print(tst.length);
        }

        test = decode['num'];
        test2 = decode['num2'];
        // test = tst[0].toString();
        // print(tst[0].toString());
        // test2 = tst[1].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //print(books);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(test),
            Text(test2),
            // Text(
            //   test,
            //   // 'Selecione os livros que voce já leu:',
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
            // ),
            const SizedBox(
              height: 30,
            ),

            //gridview
            SizedBox(
              height: 300,
              width: 500,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: repository.getItens().length,
                  itemBuilder: (context, index) =>
                      bookSelection(item: repository.getItens()[index])),
            ),
            const SizedBox(
              height: 50,
            ),

            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Material(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  onTap: () async {
                    // final response = await http
                    //     .get(Uri.http('https://127.0.0.1:5000', 'test'));
                    // final decode =
                    //     json.decode(response.body) as Map<String, dynamic>;

                    // setState(() {
                    //   test = decode['num'];
                    // });
                  },
                  child: Ink(
                    height: 54,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [
                              0.0,
                              0.4,
                              0.6,
                              1.0
                            ],
                            colors: [
                              Color.fromARGB(255, 99, 85, 207),
                              Color.fromARGB(255, 117, 102, 212),
                              Color.fromARGB(255, 123, 103, 255),
                              Color.fromARGB(255, 99, 85, 207)
                            ]),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Center(
                      child: Text(
                        'Pronto!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            //textbutton
            Flexible(
              child: TextButton(
                  onPressed: () => {
                        Navigator.pushNamed(context, '/home'),
                      },
                  child: const Text(
                    'Pular',
                    style: TextStyle(
                        color: Color.fromARGB(255, 99, 85, 207),
                        fontSize: 20,
                        fontWeight: FontWeight.w100),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookSelection({required CardProfileItem item}) {
    bool clicked = selectBooks.contains(item.title);
    var opac = Colors.black.withOpacity(1.0);
    return Container(
      alignment: Alignment.center,
      width: 130.88,
      height: 200.03,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(item.urlImage),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                opac,
                BlendMode.dstATop,
              ))),
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Color.fromARGB(0, 255, 255, 255),
        ),
        child: Transform.scale(
          scale: 5.0,
          child: Checkbox(
            activeColor: Color.fromARGB(160, 99, 85, 207),
            shape: const CircleBorder(side: BorderSide.none),
            value: clicked,
            onChanged: (value) => setState(
              () {
                if (clicked == false) {
                  clicked = true;
                  selectBooks.insert(selectBooks.length, item.title);
                  opac = Colors.black.withOpacity(0.4);
                } else {
                  clicked = false;
                  selectBooks.remove(item.title);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
