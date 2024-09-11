import 'dart:async';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_login_ui/Instagram_login_main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Animation jp;
  late AnimationController jpcontroller;

  @override
  void initState() {
    super.initState();

    jpcontroller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3));
    jp = Tween(
        begin: 0.0, end: 200.00).animate(jpcontroller);


    jpcontroller.addListener(() {
      setState(() {});
    });

    jpcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToMyHomePage();
      }
    });
    jpcontroller.forward();
  }

  @override
  void dispose(){
    jpcontroller.dispose();
    super.dispose();
  }

  void navigateToMyHomePage(){
    Navigator.pushReplacement(
        context, MaterialPageRoute(
        builder: (context)=> MyHomePage()),);
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: CupertinoColors.darkBackgroundGray,

        child: AnimatedBuilder(
          animation: jp,
          builder: (context, child) =>
              Icon(FontAwesomeIcons.instagram,
                size: jp.value,
                color: Color(0xFFE4405F),
              ),
        ),

      ),

    );
  }
}




