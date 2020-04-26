import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoClass extends StatefulWidget {
  final String videoURL;
  final String title;

  VideoClass({this.videoURL, this.title});
  @override
  _VideoClassState createState() => _VideoClassState();
}

class _VideoClassState extends State<VideoClass> {
  // String videoURL = 'https://www.youtube.com/watch?v=FhhrE3OOcAc';
  YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL),
        flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
    ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          YoutubePlayer(controller: controller,),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(widget.title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ]);
  }
}
