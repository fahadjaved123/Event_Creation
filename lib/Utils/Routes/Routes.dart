import 'package:event_creation/Utils/Routes/Routes_name.dart';
import 'package:event_creation/View/Home.dart';
import 'package:event_creation/View/Login.dart';
import 'package:event_creation/View/Register.dart';
import 'package:event_creation/View/Splach_view.dart';
import 'package:event_creation/auth/Auth_gate.dart';
import 'package:flutter/material.dart';

class Routes {
  //final Food food;
  static MaterialPageRoute generatorroute(RouteSettings route){
    switch(route.name){
      case RoutesName.login:
      return MaterialPageRoute(builder: (BuildContext context)=>Login());
      case RoutesName.registor:
      return MaterialPageRoute(builder: (BuildContext Context)=>Register());
      case RoutesName.home:
      return MaterialPageRoute(builder:(BuildContext context)=>Home());
       case RoutesName.authservice:
      return MaterialPageRoute(builder:(BuildContext context)=>AuthGate());
      case RoutesName.slpachview:
      return MaterialPageRoute(builder: (BuildContext context)=>SlpashView());
      // case RoutesName.foodview:
      // return MaterialPageRoute(builder: (BuildContext context)=>FoodView(food:food ,));
      default:
      return MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          body: Center(child: Text('No Route is found '),),
        );
      });
    }
  }
}