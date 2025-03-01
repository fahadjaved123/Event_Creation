import 'dart:io';

import 'package:event_creation/Components/Descri_textfield.dart';
import 'package:event_creation/Components/MY_bottom_bar.dart';
import 'package:event_creation/Components/MyTextfield.dart';
import 'package:event_creation/Components/Mybutton.dart';
import 'package:event_creation/Controllers/Event_Controller/Event-Controller.dart';
import 'package:event_creation/View/Advance.dart';
import 'package:event_creation/View/Event_catagory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  final eventcre = Get.put(EventController());
  String selecttime = '';
  String selectdate = "";
  String category = 'Photo';
  File? mediaFile; // File to store image or video
  final ImagePicker picker = ImagePicker();

  // Function to pick image or video based on category
  Future<void> pickMedia() async {
    final XFile? pickedFile;

    if (category == 'Video') {
      pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      setState(() {
        mediaFile = File(pickedFile!.path);
      });
    }
  }
  // select date

  Future<void> _setdate(BuildContext context) async {
    DateTime? pickedate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2025));
    if (pickedate != null) {
      final formatdate = DateFormat('dd MMM yy').format(pickedate);
      setState(() {
        selectdate = formatdate;
      });
    }
  }

  // Select Time

  Future<void> _settime(BuildContext context) async {
    TimeOfDay? pickedtime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedtime != null) {
      final now = DateTime.now();
      final formattime = DateFormat('hh:mm a').format(
        DateTime(
            now.year, now.day, now.hour, pickedtime.hour, pickedtime.minute),
      );
      setState(() {
        selecttime = formattime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var widt = MediaQuery.of(context).size.width * 1;
    final heght = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      bottomNavigationBar: Mybottombar(),
      backgroundColor: Color(0xFF33495D),
      appBar: AppBar(
        backgroundColor: Color(0xFF33495D),
        title: Text(
          "Event Creation",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        //centerTitle: true,
        foregroundColor: Color(0xFF2ECC71),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Event Title",
                  style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 20.0),
                ),
              ),
              Mytextfield(
                controller: _titleController,
                hinttext: "Event Title",
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _settime(context);
                    },
                    icon: Icon(
                      Icons.access_time,
                      color: Color(0xFFBDC3C7),
                    ),
                  ),
                  Text(
                    "${selecttime}",
                    style: TextStyle(color: Color(0xFFBDC3C7)),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _setdate(context);
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color(0xFFBDC3C7),
                    ),
                  ),
                  Text(
                    "${selectdate}",
                    style: TextStyle(color: Color(0xFFBDC3C7)),
                  )
                ],
              ),
              SizedBox(
                height: heght * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Description',
                  style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 25.0),
                ),
              ),
              Mydes(controller: _descriptionController),
              // Location
              SizedBox(
                height: heght * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Location',
                  style: TextStyle(color: Color(0xFFBDC3C7), fontSize: 20.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 180.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    hintText: 'Street Address',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heght * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              width: widt * 0.22,
                              height: heght * 0.04,
                              decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    hintText: 'City',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: widt * 0.02,
                            ),
                            Container(
                              width: widt * 0.22,
                              height: heght * 0.04,
                              decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    hintText: 'Postal Code',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: heght * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              width: widt * 0.22,
                              height: heght * 0.04,
                              decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    hintText: 'State',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: widt * 0.02,
                            ),
                            Container(
                              width: widt * 0.22,
                              height: heght * 0.04,
                              decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10.0, bottom: 10.0),
                                    hintText: 'Country',
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Category

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text("Select Category",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            ChoiceChip(
                              label: Text(
                                "Photo",
                                style: TextStyle(
                                  color: category == 'Photo'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              showCheckmark: false,
                              selected: category == 'Photo',
                              selectedColor: Colors.green,
                              backgroundColor: Color(0xFFBDC3C7),
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(
                                    color: category == 'Photo'
                                        ? Colors.green
                                        : Colors.transparent),
                              ),
                              onSelected: (bool selected) {
                                setState(() {
                                  category = 'Photo';
                                });
                              },
                            ),
                            SizedBox(
                              width: widt * 0.02,
                            ),
                            ChoiceChip(
                              label: Text(
                                "Video",
                                style: TextStyle(
                                  color: category == 'Video'
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              showCheckmark: false,
                              selected: category == 'Video',
                              selectedColor: Colors.green,
                              backgroundColor: Color(0xFFBDC3C7),
                              labelPadding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onSelected: (bool selected) {
                                setState(() {
                                  category = 'Video';
                                });
                              },
                            ),
                            SizedBox(
                              width: widt * 0.03,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: widt * 0.48,
                                  height: heght * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFBDC3C7),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          pickMedia();
                                        },
                                        child: mediaFile != null
                                            ? category == 'Photo'
                                                ? Image.file(mediaFile!,
                                                    width: 200,
                                                    height: 200,
                                                    fit: BoxFit.cover)
                                                : Text(
                                                    "Video Selected: ${mediaFile!.path.split('/').last}")
                                            : Text("No file selected",
                                                style: TextStyle(fontSize: 16)),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdvanceOptions()));
                          },
                          child: RichText(
                              text: TextSpan(
                                  text: "Advance Option",
                                  style: TextStyle(
                                      color: Color(0xFF2ECC71), fontSize: 20.0),
                                  children: [
                                TextSpan(
                                  text: " .",
                                  style: TextStyle(color: Color(0xFFBDC3C7)),
                                )
                              ])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0, top: 5.0),
                        child: Mybutton(
                            bg: Color(0xFF2ECC71),
                            color: Color(0xFFBDC3C7),
                            text: 'Submet',
                            onPressed: () {
                              print(_titleController.text);
                              print(_descriptionController.text);
                              if (_titleController.text.isNotEmpty &&
                                  _descriptionController.text.isNotEmpty) {
                                eventcre.adddata(
                                  _titleController.text.toString(),
                                  _descriptionController.text.toString(),
                                );
                              } else {
                                print('filee ');
                              }
                            }),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
