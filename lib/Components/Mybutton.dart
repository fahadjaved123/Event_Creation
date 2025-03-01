import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mybutton extends StatefulWidget {
  String text;
  Color? color;
  Color? bg;
  void Function()? onPressed;
  Mybutton(
      {super.key, required this.text, required this.onPressed, this.color,this.bg});

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: widget.bg,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(color: widget.color),
          )),
    );
  }
}
