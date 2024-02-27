import 'package:collegelistapi/models/college_model.dart';
import 'package:collegelistapi/screen/HomePage.dart';
import 'package:collegelistapi/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeDetails extends StatefulWidget {
  int index;
  String coutryCode;
  final coutryName;
  final collegeName;
  final webPage;
  final domain;
  final province;
  CollegeDetails(
      {super.key,
      required this.index,
      required this.webPage,
      required this.collegeName,
      required this.coutryName,
      required this.coutryCode,
      required this.domain,
      required this.province});

  @override
  State<CollegeDetails> createState() => _CollegeDetailsState();
}

class _CollegeDetailsState extends State<CollegeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90.0),
                    bottomRight: Radius.circular(90.0),
                  ),
                  color: Color.fromARGB(255, 113, 5, 140),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 10)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Container(
                      //color: Colors.amber,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(5, 5),
                              blurRadius: 10)
                        ],
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      'assets/meeting.png', scale: 3,
                      // height: 30,
                      //width: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: double.infinity,
            //  height: 20,
              child: Center(
                child: Text(
                  widget.collegeName,
                  style:
                      GoogleFonts.passionOne(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //width: 250,
               height: 70,
              // color: Colors.amber,
            
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 175, 137, 193),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 10)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.coutryName,
                    style: GoogleFonts.neuton(fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.domain,style: TextStyle(color: color2,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: 20,
                ),
                Text(widget.coutryCode,style: TextStyle(color: color2,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Center(
              child: Text(
                  'state-province : ${widget.province == null ? "no province data" : widget.province} ',style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                print(widget.webPage);
                lonchWebsite(Uri.parse(widget.webPage));
              },
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.5), // Color of the shadow
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset to bottom
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "College Website",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> lonchWebsite(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }
}
