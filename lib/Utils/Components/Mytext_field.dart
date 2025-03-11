import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  final controller;
  bool obsuretext;
  final hinttext;
  Icon? icon;
  final FocusNode? focusNode;
  MyTextField(
      {super.key,
      required this.controller,
      this.hinttext,
      this.obsuretext = false,
      this.icon,
      this.focusNode});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

final FocusNode _focusNode = FocusNode();
bool _isFocused = false;

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      setState(() {
        _isFocused = widget.focusNode!.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.obsuretext,
        decoration: InputDecoration(
            suffixIcon: widget.icon,
            labelText: widget.hinttext,
            labelStyle: TextStyle(
              color: _isFocused
                  ? Colors.green
                  : Colors.white, // Change label color
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
