import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_login_ui/phoneauth/otpscreen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController _phonecontroller = TextEditingController();
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
                      controller: _phonecontroller,
                      decoration: InputDecoration(
                        hintText: ("Enter Your Phone Number Here"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          FirebaseAuth.instance.verifyPhoneNumber(
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException ex) {},
                              codeSent:
                                  (String verificationid, int? resendtoken) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (Context) => OtpScreen(verificationid: verificationid,)));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationid) {},
                              phoneNumber: _phonecontroller.text.toString());
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
