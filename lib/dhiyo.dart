import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'home2.dart';
import 'models/job.dart';

//import 'models/global.dart';

class Dhiyo extends StatefulWidget {
  @override
  _DhiyoState createState() => _DhiyoState();
}

class _DhiyoState extends State<Dhiyo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Recommended Mentors',
                          style:GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  constraints: BoxConstraints.expand(height: 200),
                  child: ListView(
                      padding: EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      children: getRecentJobs()),
                ),
                Container(
                  height: 500,
                  margin: EdgeInsets.only(top: 250),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 40,left: 20),
                        child: Text("Explore New Languages",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),),
                      ),
                      Expanded(
                        child: ListView(
                          children: getJobCategories(),
                        ),
                      ),
                      SizedBox(height:35)
                    ],
                  ),
                )
              ],
            ),
             SizedBox(height:35)
          ],
        ),
      ),),
    );
  }

  List<String> jobCategories = [
    "Spanish",
    "Bengali",
    "Arabic",
    "Hindi",
    "Malay",
    "Russian"
  ];

  Map jobCatToIcon = {
    "Spanish": Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQQv0SXyhqdHpQn9a769w6bnW1c81r3APg5a6F8eMKuqQhwLS9e&usqp=CAU',
    height: 600,
    ),
    "Bengali": Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSPnjHCNoiJ2-pLFJwo43SKetwztCcdnmxcWtQ5K3uFt9H6BiVy&usqp=CAU'),
    "Arabic": Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTn5mc_iObMb8nliHCmQ7y2NKZzFSPeuOcEs6vr9MP7-ucnnmRK&usqp=CAU'),
    "Russian": Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-_PNvJb23gzEo1Un7Sp2XZoFU6Dd0EfYiUXhRtmqjiboBHErd&usqp=CAU'),
    "Malay": Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRL8XDNWteC069LwKyfvPKPYP3VCPv9T0_xaAs-0a_z9G0VbrnI&usqp=CAU'),
    "Hindi": Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Hindi.svg/1200px-Hindi.svg.png'),
  };

  Widget getCategoryContainer(String categoryName) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
         BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(categoryName,
              style: GoogleFonts.montserrat(
                // color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FlatButton(
              //backgroundColor: Colors.white,
              child: jobCatToIcon[categoryName],
              //elevation: 10,
              onPressed: () {
                print('Icon tapped');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage2()),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.isNotEmpty) {
      jobCategoriesCards.add(
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }

  Widget getJobCard(Job job) {
    return GestureDetector(
      onTap: (){
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage2()),
                );
      },
          child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
        height: 150,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
             BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: job.companyLogo,
                ),
                SizedBox(width:5),
                Text(
                  job.jobTitle,
                  style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                )
              ],
            ),
            Text(job.companyName + " - " + job.timeRequirement, style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
            Text(job.location),
            Text(/*makeSalaryToK(job.salary)*/'\$20', style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                              
          ],
        ),
      ),
    );
  }

  List<Widget> getRecentJobs() {
    List<Widget> recentJobCards = [];
    List<Job> jobs = findJobs();
    for (Job job in jobs) {
      recentJobCards.add(getJobCard(job));
    }
    return recentJobCards;
  }
   List<Job> findJobs() {
    List<Job> jobs = [];
    for (int i = 0; i < 10; i++) {
      jobs.add( Job("English ", "Vin Sharma", 20, "Hourly Rate", "Part time", AssetImage("lib/assets/person.png")));
    }
    return jobs;
  }
  
}
