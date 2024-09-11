import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_login_ui/Instagram_Home_scrren.dart';
import 'package:instagram_login_ui/bottomnav/notification.dart';
import 'package:instagram_login_ui/bottomnav/profile.dart';
import 'package:instagram_login_ui/bottomnav/reels.dart';
import 'package:instagram_login_ui/bottomnav/search.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int myIndex = 0;
  List<Widget> widgetList = [
    InstagramHomeScrren(),
    Search(),
    Reels(),
    NotificationPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (Index) {
            setState(() {
              myIndex = Index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                  size: 35,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 35,
                )),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/video.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              label: "",
              activeIcon: Image.asset(
                "images/video.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "images/heart.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              label: "",
              activeIcon: Image.asset(
                "images/heart.png",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            BottomNavigationBarItem(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "images/b1.jpg",
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              label: "",
              activeIcon: Image.asset(
                "images/b1.jpg",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
          ]),
      body: Center(
        child: widgetList[myIndex],
      ),
    );
  }
}
