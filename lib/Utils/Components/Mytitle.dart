import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenwidth*0.6,
        height: screenheight*0.055,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Color.fromRGBO(255, 255, 255, 1)),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search Event..",
              border: UnderlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }
  }