import 'package:event_creation/Utils/Components/My_Button.dart';
import 'package:event_creation/Utils/Routes/Routes_name.dart';
import 'package:flutter/material.dart';

class SlpashView extends StatelessWidget {
  const SlpashView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              "assests/images/spotify.png",
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          RichText(
            text: TextSpan(
                text: "Welcome to ",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 25.0),
                children: [
                  TextSpan(
                    text: "Soirify",
                    style: TextStyle(color: Color(0xFF2ECC71), fontSize: 25.0),
                  )
                ]),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Text("""Organize or particitants in events
           with your family and friend""",
              style: TextStyle(color: Color(0xFFD2FFE7), fontSize: 15.0)),
          SizedBox(
            height: height * 0.02,
          ),
          My_Button(
              bgcolor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              text: Text("Login", style: TextStyle(color: Color(0xFFD2FFE7)))),
          SizedBox(
            height: height * 0.03,
          ),
          My_Button(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.registor);
              },
              bgcolor: Color(0xFF1B1F3A),
              text: Text("Register an account",
                  style: TextStyle(color: Color(0xFFD2FFE7)))),
        ],
      ),
    );
  }
}
