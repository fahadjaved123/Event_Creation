import 'package:event_creation/Utils/Components/Event_card.dart';
import 'package:event_creation/Utils/Components/Mytitle.dart';
import 'package:event_creation/View/Event_details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return  LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double screenHeight = constraints.maxHeight;

      // Adjust sizes dynamically based on screen width
      double containerWidth = screenWidth * 0.08; // 86% of screen width
      double containerHeight = screenHeight * 0.06; // 12% of screen height
      double imageSize = screenWidth * 0.25; // Image size relative to screen
      double textSize = screenWidth * 0.045;
    return Scaffold(
      backgroundColor: Color(0xFF140C23),
      appBar: AppBar(
        backgroundColor: Color(0xFF140C23),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenwidth * 0.03),
            child: Row(
              children: [
                Image.asset("assests/images/bel.png"),
                SizedBox(
                  width: screenwidth * 0.05,
                ),
                Image.asset(
                  "assests/images/Vector (1).png",
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ],
            ),
          )
        ],
        title: Text(
          "Events",
          style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1B1F3A),
                  borderRadius: BorderRadius.circular(5.5),
                ),
                child: Row(
                  children: [
                    MyTitle(),
                    SizedBox(
                      width: screenwidth * 0.06,
                    ),
                    Image.asset(
                      "assests/images/search.png",
                      color: Color(0xFFBDC3C7),
                    ),
                    SizedBox(
                      width: screenwidth * 0.03,
                    ),
                    Image.asset(
                      "assests/images/ser.png",
                      color: Color(0xFFBDC3C7),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.all(screenwidth * 0.05),
              child: Container(
                height: screenheight*0.08,
                decoration: BoxDecoration(
                  color: Color(0xFF1B1F3A),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: containerHeight,
                          decoration: BoxDecoration(
                              color: Color(0xFF2ECC71),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding:EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:containerWidth,
                                  height: containerHeight,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF219251),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                    child: Text("14",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: screenwidth * 0.05,
                                        )),
                                  ),
                                ),
                                SizedBox(width: screenwidth * 0.02),
                                Text("Upcoming Events",
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: screenwidth * 0.035,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: screenwidth * 0.04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: containerHeight,
                          decoration: BoxDecoration(
                              color: Color(0xFF140C23),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: containerWidth,
                                  height: containerHeight,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF33495D),
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Center(
                                    child: Text("06",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: screenwidth * 0.05)),
                                  ),
                                ),
                                SizedBox(width: screenwidth * 0.02),
                                Text("Past Events",
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: screenwidth * 0.035)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenheight * 0.025,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventDetails()));
              },
              child: EventCard(
                imagepath: "assests/images/Preview (2).png",
                text: "open",
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: screenheight * 0.015,
            ),
            EventCard(
              imagepath: "assests/images/Preview (1).png",
              text: "Null",
              color: Color(0xFFC4A924),
            ),
            SizedBox(
              height: screenheight * 0.015,
            ),
            EventCard(
              imagepath: "assests/images/Preview (2).png",
              text: "null",
              color: Color(0xFFC4A924),
            ),
            SizedBox(
              height: screenheight * 0.015,
            ),
            EventCard(
              imagepath: "assests/images/Preview (3).png",
              text: "null",
              color: Color(0xFFC4A924),
            ),
          ],
        ),
      ),
    );
  }
  );
}
}
