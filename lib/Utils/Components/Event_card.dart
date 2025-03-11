import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventCard extends StatefulWidget {
  String imagepath;
  String text;
  Color? color;
  EventCard(
      {super.key,
      required this.imagepath,
      required this.text,
      required this.color});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.only(left: screenwidth * 0.03, right: screenwidth * 0.03),
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Color(0xFF1B1F3A),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenwidth * 0.01),
              child: Image.asset(
                widget.imagepath,
                height: screenheight * 0.1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenheight * 0.015,
                bottom: screenheight * 0.015,
                left: screenwidth * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Poet Palace London',
                        style: TextStyle(
                            fontSize: screenwidth * 0.05,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                      SizedBox(
                        width: screenwidth * 0.09,
                      ),
                      Container(
                        width: screenwidth * 0.12,
                        height: screenheight * 0.033,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(screenwidth * 0.05)),
                        child: Center(
                          child: Text(
                            widget.text,
                            style: TextStyle(
                                color: widget.color,
                                fontSize: screenwidth * 0.05),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.01,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFF2ECC71),
                      ),
                      SizedBox(
                        width: screenwidth * 0.02,
                      ),
                      Text(
                        'location for event gose here',
                        style: TextStyle(
                            color: Color(0xFF9496A5),
                            fontSize: screenwidth * 0.037),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.005,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Color(0xFF2ECC71),
                      ),
                      SizedBox(
                        width: screenwidth * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "15",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: screenwidth * 0.05),
                            children: [
                              TextSpan(
                                text: "  Particpants",
                                style: TextStyle(
                                    color: Color(0xFF9496A5),
                                    fontSize: screenwidth * 0.037),
                              )
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.005,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color(0xFF2ECC71),
                      ),
                      SizedBox(
                        width: screenwidth * 0.02,
                      ),
                      Text(
                        '10 Feb, 2025 |  11:30 pm',
                        style: TextStyle(
                            color: Color(0xFF9496A5),
                            fontSize: screenwidth * 0.037),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
