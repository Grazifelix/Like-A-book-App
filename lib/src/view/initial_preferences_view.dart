import 'package:flutter/material.dart';
import 'package:likeabook_app/src/controller/initial_preferences_controller.dart';
import 'package:likeabook_app/src/model/book_model.dart';

class InitialPreferences extends StatefulWidget {
  const InitialPreferences({Key? key}) : super(key: key);
  static const routeName = '/preferences';

  @override
  State<InitialPreferences> createState() => _InitialPreferences();
}

class _InitialPreferences extends State<InitialPreferences> {
  final List selectBooks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getInitialRandomBooks(),
        builder: (context, AsyncSnapshot snapshot) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selecione os livros que voce já leu:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
                ),
                const SizedBox(
                  height: 30,
                ),

                //gridview
                SizedBox(
                  height: 300,
                  width: 500,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: initialPreferencesBooks.length,
                      itemBuilder: (context, index) =>
                          bookSelection(book: initialPreferencesBooks[index])),
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
                      onTap: () {
                        initUserCollection(selectBooks);
                        Navigator.pushNamed(context, '/home');
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
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
                    onPressed: () {
                      initUserCollection([]);
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text(
                      'Pular',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 85, 207),
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bookSelection({required Book book}) {
    bool clicked = selectBooks.contains(book);
    var opac = Colors.black.withOpacity(1.0);
    return Container(
      alignment: Alignment.center,
      width: 130.88,
      height: 200.03,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(book.getUrlImage),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                opac,
                BlendMode.dstATop,
              ))),
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Text(book.getTitle),
          Transform.scale(
            scale: 5.0,
            child: Checkbox(
              activeColor: const Color.fromARGB(160, 99, 85, 207),
              shape: const CircleBorder(side: BorderSide.none),
              value: clicked,
              onChanged: (value) => setState(
                () {
                  if (clicked) {
                    selectBooks.remove(book);
                    clicked = !clicked;
                  } else {
                    selectBooks.add(book);
                    opac = Colors.black.withOpacity(0.4);
                    clicked = !clicked;
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
