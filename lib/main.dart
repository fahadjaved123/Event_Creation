import 'package:event_creation/Controllers/Theme_controler.dart';
import 'package:event_creation/Utils/Routes/Routes.dart';
import 'package:event_creation/Utils/Routes/Routes_name.dart';
import 'package:event_creation/auth/Auth_gate.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return  ScreenUtilInit(
      builder: (context,child){
        return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
           theme: themeControler.isdark.value 
                ? ThemeData.dark() 
                : ThemeData.light(),
           initialRoute: RoutesName.slpachview,
        onGenerateRoute:(settings) => Routes.generatorroute(settings),
          );
      },
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}
