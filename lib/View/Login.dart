import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

import '../Utils/Components/Mytext_field.dart';
import 'package:event_creation/Utils/Routes/Routes_name.dart';
import 'package:event_creation/Utils/utils.dart';
import 'package:event_creation/auth/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:event_creation/Utils/Components/My_Button.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = AuthService();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    var height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width;
    final FocusNode _focusNode = FocusNode();
    // login method
    void login() async {
      setState(() {
        isloading = true;
      });
      try {
        await authService.Login(emailcontroller.text.toString(),
                passwordcontroller.text.toString())
            .then((value) {
          utils().toastmassege('User login Successfully');
          // emailcontroller.clear();
          // passwordcontroller.clear();
          setState(() {
            isloading = false;
          });
          // move to home screen
          Navigator.pushNamed(context, RoutesName.home);
        });
      } catch (e) {
        utils().toastmassege(e.toString());
        setState(() {
          isloading = false;
        });
      }
    }
    // Using google sign method
    void goolge()async{
     User? user= await _authService.signInWithGoogle();
     if(user!=null){
      Navigator.pushNamed(context, RoutesName.home);
     }
     else{
      utils().toastmassege("Google Sign in failed");
     }
      
    }

    Dispose() {
      emailcontroller.dispose();
      passwordcontroller.dispose();
    }

    return Scaffold(
      backgroundColor: Color(0xFF140C23),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              // message ,salogon,
              Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                """Sign in to Organize events With your 
                family or friends""",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // Email textfield
              MyTextField(
                controller: emailcontroller,
                hinttext: 'Enter your Email',
                
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // password textfield
              MyTextField(
                controller: passwordcontroller,
                hinttext: 'Password ',
                obsuretext: true,
                focusNode: _focusNode,
                icon: Icon(
                  Icons.password,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              // sign button
              My_Button(
                  bgcolor: Colors.green,
                  onPressed: () {
                    try {
                      login();
                    } catch (e) {
                      utils().toastmassege(e.toString());
                    }
                  },
                  isloading: isloading,
                  text: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              SizedBox(
                height: height * 0.03,
              ),
              // not a member ? registor now
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                "_______________________or__________________________",
                style: TextStyle(color: Colors.grey.shade300),
              ),
              SizedBox(
                height: height * 0.05,
              ),
          
              // Google to login
              My_Button(
                  onPressed: () {
                    goolge();
                  },
                  text: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "continue with google ",
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            "assests/images/goog.jpg",
                            height: height*0.043,
                            width: width*0.1,
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
