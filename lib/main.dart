import 'package:event_creation/Controllers/Theme_controler.dart';
import 'package:event_creation/View/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeControler themeControler=Get.put(ThemeControler());
   MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
         theme: themeControler.isdark.value 
              ? ThemeData.dark() 
              : ThemeData.light(),
          home: Home(),
        ));
  }
}
