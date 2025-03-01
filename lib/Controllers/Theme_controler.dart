import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeControler extends GetxController {
  var isdark=false.obs;
  // togel function
  void Toggeltheme(){
    isdark.value=!isdark.value;
    Get.changeThemeMode(isdark.value ? ThemeMode.dark : ThemeMode.light);
  }
}