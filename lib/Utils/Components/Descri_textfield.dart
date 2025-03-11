import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mydes extends StatelessWidget {
  TextEditingController controller;
  Mydes({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color:  Color(0xFFBDC3C7),
          borderRadius: BorderRadius.circular(10.0)
        ),
        height: 180,
        child: TextFormField(
          maxLines: 5,
          controller: controller,
          decoration: InputDecoration(
              border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          )),
          validator: (value){
            if(value==null || value.isEmpty){
              return 'Please enter description';
            }
            else{
              return null;
            }
          },
        ),
      ),
    );
  }
}
