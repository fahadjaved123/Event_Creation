import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final hinttext;
  Mytextfield({
    super.key,
    required this.controller,
    this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white), // Set text color to white
        decoration: InputDecoration(
          //labelText: hinttext,
          hintText: hinttext,
          hintStyle:
              TextStyle(color: Colors.white), // Optional: Change label color
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a title';
          }
          return null;
        },
      ),
    );
  }
}
