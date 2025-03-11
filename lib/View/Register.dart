import 'package:event_creation/Utils/Components/My_Button.dart';
import 'package:event_creation/Utils/Routes/Routes_name.dart';
import 'package:event_creation/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:event_creation/auth/Auth_Service.dart';
import '../Utils/Components/Mytext_field.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _authService = AuthService();

  TextEditingController conformpasswordcontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  bool isloading = false;
  Dispose() {
    conformpasswordcontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Sign up  method
    void Signup() async {
      setState(() {
        isloading = true;
      });
      try {
        await _authService.Signup(
                emailcontroller.text,
                passwordcontroller.text,
                firstnamecontroller.text.toString(),
                lastnamecontroller.text.toString())
            .then((value) {
          utils().toastmassege(
              'User Successfuly registor ${emailcontroller.text.toString()}');
          setState(() {
            isloading = false;
          });
          // now move to login screen
          Navigator.pushNamed(context, RoutesName.login);
        });
      } catch (e) {
        utils().toastmassege(e.toString());
        setState(() {
          isloading = false;
        });
      }
    }

    // Using google sign method
    void goolge() async {
      User? user = await _authService.signInWithGoogle();
      if(user!=null){
        Navigator.pushNamed(context, RoutesName.home);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFF140C23),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              SizedBox(
                height: height * 0.07,
              ),
              // message ,
              Text(
                'Registration',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Column(
                children: [
                  Text(
                    """Welcome to soirify.""",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    """Fill in your details to get Started""",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),

              // first name
              MyTextField(
                controller: firstnamecontroller,
                hinttext: 'First name',
              ),
              SizedBox(
                height: height * 0.03,
              ),

              //last name
              MyTextField(
                controller: lastnamecontroller,
                hinttext: 'Last Name',
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
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // conform passord
              MyTextField(
                controller: conformpasswordcontroller,
                hinttext: 'Conform Password ',
                obsuretext: true,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              // sign button
              My_Button(
                  bgcolor: Colors.green,
                  onPressed: () {
                    if (passwordcontroller.text.length >= 6) {
                      if (passwordcontroller.text ==
                          conformpasswordcontroller.text) {
                        try {
                          Signup();
                        } catch (e) {
                          utils().toastmassege(e.toString());
                        }
                      } else {
                        utils().toastmassege(
                            'Please match password with conform password');
                      }
                    } else {
                      utils()
                          .toastmassege('Please password should be 6 degites');
                    }
                  },
                  isloading: isloading,
                  text: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "_______________________or__________________________",
                style: TextStyle(color: Colors.grey.shade300),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // for Google
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
                            height: height * 0.043,
                            width: width * 0.1,
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
