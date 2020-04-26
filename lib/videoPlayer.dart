import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'videoClass.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 70, 10, 0),
            child: Text("Learn",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListView(
                children: <Widget>[
                  VideoClass(
                    videoURL: 'https://www.youtube.com/watch?v=hsLYD1Jyf3A',
                    title: 'Learn how to say the letters and sounds in Spanish ',
                  ),
                  SizedBox(height: 18),
                   VideoClass(
                    videoURL:
                        'https://www.youtube.com/watch?v=eLWgsHCTKIw',
                    title: 'Learning Spanish With Money Heist',
                  ),
                  SizedBox(height: 18),
                  VideoClass(
                    videoURL:
                        'https://www.youtube.com/watch?v=SLmEdQ1pcAM',
                    title: 'The Spanish Alphabets with examples and Pronounciation',
                  ),
                  
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 14)
        ],
      ),
    );
  }
}
