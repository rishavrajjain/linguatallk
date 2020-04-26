

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'src/pages/index.dart';
import 'videoPlayer.dart';

import 'dhiyo.dart';

void main() => runApp(MaterialApp(
  home:Pager(),
 debugShowCheckedModeBanner: false
));

class Pager extends StatefulWidget {
  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  int pageIndex = 0;

  //final MyHomePage myHomePage = MyHomePage();
  final Dhiyo dhiyoPage = Dhiyo();
  final IndexPage agoraPage = IndexPage();
  final VideoPlayer videoPlayer = VideoPlayer();

  Widget showPage = VideoPlayer();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return videoPlayer;
        break;
      case 1:
        return agoraPage;
        break;
      case 2:
        return dhiyoPage;
        break;
      case 3:
        return dhiyoPage;
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.black,
        items: <Widget>[
          Icon(Icons.library_books, size: 25,color: Colors.black,),
          Icon(Icons.play_circle_filled, size: 25,color: Colors.black,),

          Icon(Icons.language, size: 28,color: Colors.black,),
          Icon(Icons.person, size: 25,color: Colors.black,),
        ],
        onTap: (index) {
          setState(() {
            showPage = _pageChooser(index);
          });
          //Handle button tap
        },
      ),
      body: Container(
          color: Colors.black,
          child: Center(
            child: showPage,
          )),
    );
  }
}



