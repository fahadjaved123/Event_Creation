import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_Button extends StatefulWidget {
  void Function()? onPressed;
  final text;
  Color? bgcolor;
  bool isloading;
  My_Button(
      {super.key,
      required this.onPressed,
      required this.text,
      this.bgcolor,
      this.isloading = false});

  @override
  State<My_Button> createState() => _ButtonState();
}

class _ButtonState extends State<My_Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: widget.bgcolor,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: Colors.green,
                width: 2,
              )),
          child: widget.isloading
              ? Container(
                  margin: EdgeInsets.only(
                      left: 100, right: 100, top: 10, bottom: 10),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 2,
                  ),
                )
              : TextButton(onPressed: widget.onPressed, child: widget.text)),
    );
  }
}
