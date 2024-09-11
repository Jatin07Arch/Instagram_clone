import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_login_ui/Instagram_Home_scrren.dart';
import 'package:instagram_login_ui/Instagram_login_main.dart';
import 'package:instagram_login_ui/auth_services/auth.dart';
import 'package:instagram_login_ui/bottomnav/bottomnav.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  final FirebaseService _auth = FirebaseService();

  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernamecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 500,
              height: 700,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/instagramlogo.png",
                    width: 400,
                    height: 80,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _usernamecontroller,
                    decoration: InputDecoration(
                      hintText: ("Username"),
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
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                      hintText: ("Email"),
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
                    keyboardType: TextInputType.number,
                    controller: _phonecontroller,
                    decoration: InputDecoration(
                      hintText: ("PhoneNumber"),
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
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      hintText: ("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String username = _usernamecontroller.text;
                        String email = _emailcontroller.text;
                        int phonenumber = _phonecontroller.text.length;
                        String password = _passwordcontroller.text;

                        User? user = await _auth.SignUpMethod(email, password);

                        if (user != null) {
                          Fluttertoast.showToast(
                              msg: "User SuccessFully Created");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Bottomnav()));
                        } else {
                          Fluttertoast.showToast(msg: "some error occured !");
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
                      child: Text("Sign Up")),
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
                    height: 10,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                      onPressed: () async{
                        User? user = await _auth.signInWithGoogle();

                          if (user != null) {
              Fluttertoast.showToast(msg: "Google Sign-In Successful");
              // Navigate to the next screen or do something else
            } else {
              Fluttertoast.showToast(msg: "Google Sign-In Failed");
            }
                      },
                      icon: Icon(FontAwesomeIcons.google),
                      label: Text("Log in with Google")),
                  SizedBox(
                    height: 20,
                  ),
                ],
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
                  "Already have an account?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                  child: Text("Sign In"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
