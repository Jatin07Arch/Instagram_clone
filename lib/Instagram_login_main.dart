import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_login_ui/Instagram_login_main.dart';
import 'package:instagram_login_ui/Instagram_Home_scrren.dart';
import 'package:instagram_login_ui/Instagram_splash_screen.dart';
import 'package:instagram_login_ui/auth_services/auth.dart';
import 'package:instagram_login_ui/bottomnav/bottomnav.dart';
import 'package:instagram_login_ui/phoneauth/phonescreen.dart';
import 'package:instagram_login_ui/sign_up.dart';
import 'dart:math';
import 'firebase_options.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final FirebaseService _auth = FirebaseService();

  bool _obscureText = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 400,
                constraints: BoxConstraints(maxHeight: 600),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Instagram",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontFamily: "MyCustomFont",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: ("phone number, username, or email"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: ("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText =
                                  !_obscureText; // Toggle password visibility
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          String email = _emailController.text;
                          String password = _passwordController.text;

                          User? user =
                              await _auth.SigninMethod(email, password);
                          if (user != null) {
                            Fluttertoast.showToast(
                                msg: "User Successfully login");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Bottomnav()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Please Use valid credential")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 45),
                          backgroundColor: Color(0xFF3897f0),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Log in")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook_sharp),
                        label: Text("Log in with facebook")),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                        onPressed: () async {
                          User? user = await _auth.signInWithGoogle();

                          if (user != null) {
                            Fluttertoast.showToast(
                                msg: "Google Sign-In Successful");
                            // Navigate to the next screen or do something else
                          } else {
                            Fluttertoast.showToast(
                                msg: "Google Sign-In Failed");
                          }
                        },
                        icon: Icon(FontAwesomeIcons.google),
                        label: Text("Log in with Google")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => PhoneScreen()));
                        },
                        icon: Icon(Icons.phone),
                        label: Text("Log in with PhoneNumber")),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () {}, child: Text("Forgot Password?")),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an acoount?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  },
                  child: Text("Sign up"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
