import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_login_ui/Instagram_Home_scrren.dart';

class OtpScreen extends StatefulWidget {
  final String verificationid;
  const OtpScreen({super.key, required this.verificationid});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpcontroller = TextEditingController();

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
                constraints: const BoxConstraints(maxHeight: 600),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Instagram",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontFamily: "MyCustomFont",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _otpcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter OTP here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: _otpcontroller.text.toString(),
                          );
                          await FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InstagramHomeScrren()),
                            );
                          });
                        } catch (ex) {
                          log(ex.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Failed to sign in: $ex')));
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
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
