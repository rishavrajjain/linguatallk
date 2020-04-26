import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'card2.dart';
//import 'dart:typed_data';
//import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  final PageController ctrl = PageController();
  List<Widget> cardList;
  static GlobalKey previewContainer = GlobalKey();
  bool boolTrue = true;

  // void _removeCard(index) {
  //   setState(() {
  //     cardList.removeAt(index);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: boolTrue
          ? AppBar(
              backgroundColor: Colors.black,
              title: Text('Menta'),
              centerTitle: true,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () => {}),
                )
              ],
            )
          : null,
      body: RepaintBoundary(
        key: previewContainer,
        child: PageView(
          controller: ctrl,
          children: <Widget>[
            MatchCard2(
      // url: "https://www.google.com",
      title: "English Teacher",
      body:
          "Velit nisi Lorem nulla consectetur labore cillum sunt sunt deserunt excepteur elit ut. ",
      image:
          "https://4.bp.blogspot.com/-es0SLr2bMAM/Uj3DhGAqX0I/AAAAAAAAk4w/Dyxl4C5r5Wc/s1600/norway_scenery-wallpaper-2560x1440.jpg",
    ),
    MatchCard2(
      // url: "https://www.google.com",
      title: "English Teacher",
      body:
          "Laboris sunt duis qui exercitation aute. Laborum laboris cillum elit dolore consequat deserunt id. Cupidatat minim laborum aliquip officia laboris elit.",
      image:
          "https://www.cmsdrupal.com/static/c9655cb528b5c6c7e63c33ec3590d126/4dbff/identify-senior-developers.jpg",
    ),
     MatchCard2(
      // url: "https://www.google.com",
      title: "English Teacher",
      body:
          "Velit nisi Lorem nulla consectetur labore cillum sunt sunt deserunt excepteur elit ut. ",
      image:
          "https://4.bp.blogspot.com/-es0SLr2bMAM/Uj3DhGAqX0I/AAAAAAAAk4w/Dyxl4C5r5Wc/s1600/norway_scenery-wallpaper-2560x1440.jpg",
    ),

          ],

        )
      ),
    );
  }

  // List<Widget> _getMatchCard() {
  //   int c;

  //   List<MatchCard2> cards =  List();

  //   cards.add(MatchCard2(
  //     url: "https://www.google.com",
  //     title: "Junior Illustrator",
  //     body:
  //         "Velit nisi Lorem nulla consectetur labore cillum sunt sunt deserunt excepteur elit ut. Eu commodo aute commodo cupidatat quis reprehenderit laboris do fugiat est quis sint.",
  //     image:
  //         "https://4.bp.blogspot.com/-es0SLr2bMAM/Uj3DhGAqX0I/AAAAAAAAk4w/Dyxl4C5r5Wc/s1600/norway_scenery-wallpaper-2560x1440.jpg",
  //   ));
  //   cards.add(MatchCard2(
  //     url: "https://www.google.com",
  //     title: "Senior Developer",
  //     body:
  //         "Laboris sunt duis qui exercitation aute. Laborum laboris cillum elit dolore consequat deserunt id. Cupidatat minim laborum aliquip officia laboris elit.",
  //     image:
  //         "https://www.cmsdrupal.com/static/c9655cb528b5c6c7e63c33ec3590d126/4dbff/identify-senior-developers.jpg",
  //   ));
  //   cards.add(MatchCard2(
  //     url: "https://www.google.com",
  //     title: "Junior Illustrator",
  //     body:
  //         "Velit nisi Lorem nulla consectetur labore cillum sunt sunt deserunt excepteur elit ut. Eu commodo aute commodo cupidatat quis reprehenderit laboris do fugiat est quis sint.",
  //     image:
  //         "https://4.bp.blogspot.com/-es0SLr2bMAM/Uj3DhGAqX0I/AAAAAAAAk4w/Dyxl4C5r5Wc/s1600/norway_scenery-wallpaper-2560x1440.jpg",
  //   ));
  //   cards.add(MatchCard2(
  //     url: "https://www.google.com",
  //     title: "Senior Developer",
  //     body:
  //         "Laboris sunt duis qui exercitation aute. Laborum laboris cillum elit dolore consequat deserunt id. Cupidatat minim laborum aliquip officia laboris elit.",
  //     image:
  //         "https://www.cmsdrupal.com/static/c9655cb528b5c6c7e63c33ec3590d126/4dbff/identify-senior-developers.jpg",
  //   ));

  //   List<Widget> cardList = List();

  //   for (c = 0; c < cards.length; c++) {
  //     cardList.add(
  //       dismissible(c, cards),
  //     );
  //   }
  //   return cardList;
  // }

  // Dismissible dismissible(int c, List<MatchCard2> cards) {
  //   return Dismissible(
  //       key: UniqueKey(),
  //       direction: DismissDirection.vertical,
  //       onDismissed: (direction) {
  //         if (direction == DismissDirection.up) {
  //           print('up swipe');
  //         }
  //         if (direction == DismissDirection.down) {
  //           print('down swipe');

  //           undoDeletion(c, dismissible(c + 1, cards));
  //           undoDeletion(c, dismissible(c, cards));
  //         }

  //         //_removeCard(0);
  //       },
  //       child: cards[c]);
  // }

  
  void undoDeletion(index, item) {
    setState(() {
      cardList.insert(index, item);
    });
  }
}
