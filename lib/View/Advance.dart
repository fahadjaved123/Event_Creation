import 'package:event_creation/Controllers/Event_Controller/Event-Controller.dart';
import 'package:event_creation/View/Event_catagory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvanceOptions extends StatefulWidget {
  const AdvanceOptions({super.key});

  @override
  State<AdvanceOptions> createState() => _AdvanceOptionsState();
}

class _AdvanceOptionsState extends State<AdvanceOptions> {
  final private = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final heigth = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: const Color(0xFF33495D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF33495D),
        title: Text(
          "Advance Options",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Color(0xFF2ECC71),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  width: width * 1,
                  height: heigth * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () =>
                              Text(private.isprivate.value ? "Private" : "Public",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                        ),
                        Obx(() => Switch(
                            activeColor: Color(0xFF2ECC71), // Color when ON
                            activeTrackColor:
                                Colors.greenAccent, // Track color when ON
                            inactiveThumbColor:
                                Color(0xFF33495D), // Thumb color when OFF
                            inactiveTrackColor: Color.fromARGB(
                                255, 98, 99, 100), // Track color when OFF
                            value: private.isprivate.value,
                            onChanged: (value) => private.toggleprive())),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heigth * 0.02,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventCategory()));
                  },
                  child: Text(
                    'Event Category ->',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  )),
              SizedBox(
                height: heigth * 0.02,
              ),
              Text(
                "Themes",
                style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 30.0),
              ),
              SizedBox(
                height: heigth * 0.02,
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            private.toggelsele();
                          },
                          child: Icon(
                            Icons.check_circle,
                            color: private.isselected.value
                                ? Color(0xFF2ECC71)
                                : Color(0xFFBDC3C7),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assests/images/theme.jpg',
                        height: heigth * 0.1,
                        width: width * 0.27,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFFBDC3C7),
                      ),
                      Image.asset(
                        'assests/images/theme.jpg',
                        height: heigth * 0.1,
                        width: width * 0.27,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              Text(
                "Lighting",
                style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 30.0),
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFFBDC3C7),
                      ),
                      Image.asset(
                        'assests/images/theme.jpg',
                        height: heigth * 0.1,
                        width: width * 0.27,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Color(0xFFBDC3C7),
                      ),
                      Image.asset(
                        'assests/images/theme.jpg',
                        height: heigth * 0.1,
                        width: width * 0.27,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),

              // Music Playlist

              Text(
                "Music Playlist",
                style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 30.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Connect to Spotify or Deezer",
                    style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 15.0),
                  ),
                  SizedBox(
                    height: heigth * 0.01,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(70.0),
                              child: Image.asset(
                                'assests/images/spotify.png',
                                height: 50,
                                width: 50,
                              )),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'Spotify',
                            style: TextStyle(
                                color: Color(0xFF2ECC71), fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        'Or',
                        style:
                            TextStyle(color: Color(0xFFBDC3C7), fontSize: 15.0),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: Image.asset(
                                "assests/images/pngaaa.com-69724.png",
                                height: 50,
                                width: 50,
                              )),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            'deezer',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFFBDC3C7),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    'Select a pre-made playlist',
                    style: TextStyle(
                      color: Color(0xFFBDC3C7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFFBDC3C7),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    'Create a custom Playlist',
                    style: TextStyle(
                      color: Color(0xFFBDC3C7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Interactive Games',
                    style: TextStyle(
                      color: Color(0xFFBDC3C7),
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: heigth * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Color(0xFFBDC3C7),
                            ),
                            Image.asset('assests/images/theme.jpg',
                                height: heigth * 0.1, width: width * 0.27),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 45.0),
                              child: Icon(Icons.check_circle,
                                  color: Color(0xFFBDC3C7)),
                            ),
                            Image.asset('assests/images/theme.jpg',
                                height: heigth * 0.1, width: width * 0.27),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 45.0),
                              child: Icon(
                                Icons.check_circle,
                                color: Color(0xFFBDC3C7),
                              ),
                            ),
                            Image.asset('assests/images/theme.jpg',
                                height: heigth * 0.1, width: width * 0.27),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heigth * 0.01,
              ),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFBDC3C7),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF2ECC71),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child:
                        ElevatedButton(onPressed: () {}, child: Text('Reset')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
