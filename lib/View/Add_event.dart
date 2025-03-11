import 'dart:io';
import 'package:event_creation/Controllers/Event_Controller/Event-Controller.dart';
import 'package:event_creation/Utils/Components/Descri_textfield.dart';
import 'package:event_creation/Utils/Components/MY_bottom_bar.dart';
import 'package:event_creation/Utils/Components/MyTextfield.dart';
import 'package:event_creation/Utils/Components/Mybutton.dart';
import 'package:event_creation/Utils/utils.dart';
import 'package:event_creation/View/Advance.dart';
import 'package:event_creation/View/Event_catagory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:video_player/video_player.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _HomeState();
}

class _HomeState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  final eventcre = Get.put(EventController());
  String selecttime = '';
  String selectdate = "";
  String category = 'Photo';
  bool isvideo = false;
  File? mediaFile; // File to store image or video
  final ImagePicker picker = ImagePicker();
  VideoPlayerController? videoPlayerController;
  // Function to pick image or video based on category
  Future<void> pickMedia() async {
    try {
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
        if (isvideo) {
          videoPlayerController = VideoPlayerController.file(mediaFile!)
            ..initialize().then((onValue) {
              setState(() {
                videoPlayerController!.play();
              });
            });
        } else {
          print('No file selected');
        }
      }
    } catch (e) {
      print('Error in selected file $e');
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
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Mybottombar(),
      backgroundColor: Color(0xFF33495D),
      appBar: AppBar(
        backgroundColor: Color(0xFF33495D),
        title: Text(
          "Event Creation",
          style: TextStyle(
              fontSize: screenwidth * 0.12, fontWeight: FontWeight.bold),
        ),
        //centerTitle: true,
        foregroundColor: Color(0xFF2ECC71),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: screenheight * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenwidth * 0.05),
                  child: Text(
                    "Event Title",
                    style: TextStyle(
                        color: Color(0xFFBDC3C7), fontSize: screenwidth * 0.05),
                  ),
                ),
                Mytext_field(
                  controller: _titleController,
                  hinttext: "Event Title",
                ),
                SizedBox(
                  height: screenheight * 0.01,
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
                  height: screenheight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenwidth * 0.04),
                  child: Text(
                    'Description',
                    style: TextStyle(
                        color: Color(0xFFBDC3C7), fontSize: screenwidth * 0.06),
                  ),
                ),
                Mydes(controller: _descriptionController),
                // Location
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenwidth * 0.04),
                  child: Text(
                    'Location',
                    style: TextStyle(
                        color: Color(0xFFBDC3C7), fontSize: screenwidth * 0.06),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenwidth * 0.03, top: screenheight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: screenwidth * 0.45,
                                    height: screenheight * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDC3C7),
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenheight * 0.01,
                                              bottom: screenheight * 0.012),
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
                                height: screenheight * 0.01,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: screenwidth * 0.22,
                                    height: screenheight * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDC3C7),
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenheight * 0.01,
                                              bottom: screenheight * 0.012),
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
                                    width: screenwidth * 0.02,
                                  ),
                                  Container(
                                    width: screenwidth * 0.22,
                                    height: screenheight * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDC3C7),
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenheight * 0.01,
                                              bottom: screenheight * 0.012),
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
                                height: screenheight * 0.01,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: screenwidth * 0.22,
                                    height: screenheight * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDC3C7),
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenheight * 0.01,
                                              bottom: screenheight * 0.012),
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
                                    width: screenwidth * 0.02,
                                  ),
                                  Container(
                                    width: screenwidth * 0.22,
                                    height: screenheight * 0.04,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBDC3C7),
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04)),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: screenheight * 0.01,
                                              bottom: screenheight * 0.012),
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
                          SizedBox(
                            width: screenwidth * 0.03,
                          ),
                          Expanded(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(right: screenwidth * 0.02),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: screenwidth * 0.5,
                                      height: screenheight * 0.14,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            screenwidth * 0.04),
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(40.7128,
                                                -74.0060), // usa coordinates
                                            zoom: 13.0,
                                          ),
                                          children: [
                                            TileLayer(
                                              urlTemplate:
                                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                              subdomains: ['a', 'b', 'c'],
                                            ),
                                            MarkerLayer(
                                              markers: [
                                                Marker(
                                                  point:
                                                      LatLng(31.5204, 74.3587),
                                                  child: Icon(
                                                      Icons.location_pin,
                                                      color: Colors.red,
                                                      size: 40),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),

                    // Category
                  ],
                ),
                SizedBox(height: screenheight * 0.012),
                Padding(
                  padding: EdgeInsets.only(left: screenwidth * 0.04),
                  child: Text("Select Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenwidth * 0.05,
                      )),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenwidth * 0.03),
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
                            width: screenwidth * 0.02,
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
                              borderRadius:
                                  BorderRadius.circular(screenwidth * 0.06),
                            ),
                            onSelected: (bool selected) {
                              setState(() {
                                category = 'Video';
                              });
                            },
                          ),
                          SizedBox(
                            width: screenwidth * 0.03,
                          ),
                          Row(
                            children: [
                              Container(
                                width: screenwidth * 0.43,
                                height: screenheight * 0.1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFBDC3C7),
                                  borderRadius:
                                      BorderRadius.circular(screenwidth * 0.06),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          pickMedia();
                                        },
                                        child: mediaFile != null
                                            ? isvideo
                                                ? videoPlayerController !=
                                                            null &&
                                                        videoPlayerController!
                                                            .value.isInitialized
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    screenwidth *
                                                                        0.04),
                                                        child: AspectRatio(
                                                          aspectRatio:
                                                              videoPlayerController!
                                                                  .value
                                                                  .aspectRatio,
                                                          child: VideoPlayer(
                                                              videoPlayerController!),
                                                        ),
                                                      )
                                                    : Center(
                                                        child:
                                                            CircularProgressIndicator())
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.file(
                                                      mediaFile!,
                                                      height: double.infinity,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                            : Icon(Icons.image)),
                                    Text(category == 'Photo'
                                        ? "Select photo"
                                        : "Select Video"),
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
                      padding: EdgeInsets.only(left: screenwidth * 0.04),
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
                                    color: Color(0xFF2ECC71),
                                    fontSize: screenwidth * 0.06),
                                children: [
                              TextSpan(
                                text: " .",
                                style: TextStyle(color: Color(0xFFBDC3C7)),
                              )
                            ])),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenwidth * 0.21,
                          top: screenheight * 0.01,
                          bottom: screenwidth * 0.02),
                      child: Mybutton(
                          bg: Color(0xFF2ECC71),
                          color: Color(0xFFBDC3C7),
                          text: 'Submet',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              try {
                                if (_titleController.text.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty) {
                                  eventcre
                                      .adddata(
                                          _titleController.text,
                                          _descriptionController.text,
                                          selectdate,
                                          selecttime)
                                      .then((onValue) {
                                    _titleController.clear();
                                    _descriptionController.clear();
                                  });
                                } else {
                                  print('please filed all field');
                                }
                              } catch (e) {
                                 utils().toastmassege('error $e');
                              }
                            } else {
                              print('filed all field');
                            }
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
