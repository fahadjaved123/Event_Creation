import 'package:event_creation/Utils/Components/Event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventSummary extends StatelessWidget {
  const EventSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        // Adjust sizes dynamically based on screen width
        double containerWidth = screenWidth * 0.86; // 86% of screen width
        double containerHeight = screenHeight * 0.12; // 12% of screen height
        double imageSize = screenWidth * 0.25; // Image size relative to screen
        double textSize = screenWidth * 0.045; // Adjust font size dynamically

        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04), // Dynamic horizontal padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: screenHeight *
                        0.08), // Top margin (8% of screen height)
                Padding(
                  padding: EdgeInsets.only(top: 62.h, left: 21.w, right: 21.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // ✅ Fix: Auto adjust spacing
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assests/images/back.png",
                          width: 9.26.w,
                          height: 16.h,
                        ),
                      ),
                      Text(
                        "Event Summary",
                        style: TextStyle(
                          color: Color(0xFFF5F5F5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        "assests/images/Menu.png",
                        width: 3.w,
                        height: 13.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // Event Container
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1B1F3A),
                        Color(0xFF183A3D),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      // Event Image
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assests/images/Image.png",
                            width: imageSize,
                            height: imageSize,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Event Text
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "The Event Title Goes\nhere in line",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: textSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "12 Oct, 2025 | 12:45 PM",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: textSize * 0.75,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Event Summary",
                  style: TextStyle(
                    color: Color(0xFFF5F5F5),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
