import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../cardPage.dart';
import '../../data.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  List<MentorDescription> jobs = [
    MentorDescription(
        name: 'Vin Sharma',
        title: 'English Professional',
        time: '6:30 pm to 7:00 pm',
        photo:
            'https://lh3.googleusercontent.com/proxy/zwC2_p9XiCbfUEiuInHZVss91PrBX1jphF7EnzfYBhq-dUcXCn32tmH8T4KVL9Hq5_gQ4z5K25oR4E5Baq1u_vuiQZNSP19rCC8cLi0tDe3KJh8RfCu4ut6cGsag7ulsHozytXw77KjY3Y2Duq03IelGOfobHpMsoCn55g',
        meetID: 'as0235'),
    MentorDescription(
        name: 'Sam',
        title: 'Spanish Proffesional',
        time: '7:00 pm to 8:30 pm',
        photo:
            'https://lh3.googleusercontent.com/proxy/zwC2_p9XiCbfUEiuInHZVss91PrBX1jphF7EnzfYBhq-dUcXCn32tmH8T4KVL9Hq5_gQ4z5K25oR4E5Baq1u_vuiQZNSP19rCC8cLi0tDe3KJh8RfCu4ut6cGsag7ulsHozytXw77KjY3Y2Duq03IelGOfobHpMsoCn55g',
        meetID: 'bc045'),
  ];

  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();
  final _passwordController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Text(
      //     'Video Call',
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text('Upcoming \nMeetings',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardPage()));
                        },
                        title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: Text(jobs[index].name,
                                style: GoogleFonts.montserrat(
                                  // color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ))),
                        leading: CircleAvatar(
                            radius: 20,
                            child: Image.asset('lib/assets/person.png')),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: Text(jobs[index].title,
                                  style: GoogleFonts.montserrat(
                                    // color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                            Text(jobs[index].time,
                                style: GoogleFonts.montserrat(
                                  // color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                          child: Text('Meeting ID: ${jobs[index].meetID}',
                                  style: GoogleFonts.montserrat(
                                    // color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                             Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                                          child: Text('Password: abcdef',
                                  style: GoogleFonts.montserrat(
                                    // color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 1,
            // child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 400,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                controller: _channelController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    fillColor: Colors.blue,
                                    errorText: _validateError
                                        ? 'Channel name is mandatory'
                                        : null,
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    hintText: 'Enter Meeting Id',
                                    hintStyle: TextStyle(
                                        fontSize: 18.0, color: Colors.white70)),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: TextField(
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    fillColor: Colors.blue,
                                    errorText: _validateError
                                        ? 'Channel name is mandatory'
                                        : null,
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 18.0, color: Colors.white70)),
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: RaisedButton(
                              onPressed: onJoin,
                              child: Text('Join'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
           // ),
          ),
        ],
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
