import 'package:event_creation/Utils/Components/My_bottom_sheet.dart';
import 'package:event_creation/View/Event_Summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF140C23),
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(top: screenheight * 0.5, left: screenwidth * 0.01),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assests/images/back.png",
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF140C23),
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            MyBottomSheet.showMybottomsheet(context);
          },
          child: Text(
            'Event Detail',
            style: TextStyle(
                color: Colors.white,
                fontSize: screenwidth * 0.08,
                fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenwidth * 0.02),
            child: Row(
              children: [
                Image.asset("assests/images/heart.png"),
                SizedBox(
                  width: screenwidth * 0.05,
                ),
                Image.asset(
                  "assests/images/loc.png",
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.075,
                  top: screenheight * 0.05,
                  bottom: screenheight * 0.05,
                  right: screenwidth * 0.06),
              child: Image.asset(
                "assests/images/Image.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenwidth * 0.06),
              child: Container(
                width: screenwidth * 0.23,
                height: screenheight * 0.035,
                decoration: BoxDecoration(
                  color: Color(0xFF2ECC71),
                ),
                child: Center(
                  child: Text(
                    'Private',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.06, top: screenheight * 0.01),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      MyBottomSheet.showMybottomsheet(context);
                    },
                    child: Text(
                      "Radiohead Concert ",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: screenwidth * 0.045),
                    ),
                  ),
                  SizedBox(
                    width: screenwidth * 0.35,
                  ),
                  Container(
                    width: screenwidth * 0.15,
                    height: screenheight * 0.04,
                    decoration: BoxDecoration(
                        color: Color(0xFFD2FFE7),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text(
                        '\$483',
                        style:
                            TextStyle(color: Color(0xFF177B40), fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.06, top: screenheight * 0.01),
              child: RichText(
                  text: TextSpan(
                      text: "182 ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      children: [
                    TextSpan(
                        text: " Participant  .  22 Oct, 2022",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xFF9496A5))),
                  ])),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.06, top: screenheight * 0.01),
              child: Row(
                children: [
                  Image.asset(
                    "assests/images/person.png",
                  ),
                  SizedBox(
                    width: screenwidth * 0.02,
                  ),
                  Text('12 Slots Available',
                      style: TextStyle(fontSize: 17, color: Color(0xFF9496A5))),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.06, top: screenheight * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventSummary()));
                    },
                    child: Text(
                      "About Event",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.02,
                  ),
                  RichText(
                      text: TextSpan(
                          text:
                              """Odio elit tempus tristique viverra scelerisque.pellentesque phasellus nibh urna ipsum sollicitudin urna est enim... """,
                          style:
                              TextStyle(fontSize: 17, color: Color(0xFF9496A5)),
                          children: [
                            TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF2ECC71)),
                            )
                          ])),
                  SizedBox(
                    height: screenheight * 0.02,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset("assests/images/Image (1).png"),
                      ),
                      SizedBox(
                        width: screenwidth * 0.02,
                      ),
                      Text(
                        "Jannifer Dane",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenwidth * 0.06, top: screenheight * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Maps',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(255, 255, 255, 1))),
                  SizedBox(
                    height: screenheight * 0.02,
                  ),
                  Image.asset(
                    'assests/images/Map.png',
                    width: double.infinity,
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenheight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenwidth * 0.04),
              child: Container(
                width: screenwidth * 0.94,
                height: screenheight * 0.053,
                decoration: BoxDecoration(
                  color: Color(0xFF2ECC71),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: Text("Book Now",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 1)))),
              ),
            ),
            SizedBox(
              height: screenheight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
