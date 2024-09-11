import "package:flutter/material.dart";
import "package:instagram_login_ui/bottomnav/bottomnav.dart";

class InstagramHomeScrren extends StatefulWidget {
  const InstagramHomeScrren({super.key});

  @override
  State<InstagramHomeScrren> createState() => InstagramHomeScrrenState();
}

class InstagramHomeScrrenState extends State<InstagramHomeScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.camera_alt_outlined,
          size: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              "images/instagram-share-icon.png",
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          )
        ],
        title: Center(
          child: Text(
            "Instagram",
            style: TextStyle(
              color: Colors.black,
              fontSize: 50.0,
              fontFamily: "MyCustomFont",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  "Stories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      "images/b1.jpg",
                                      height: 65,
                                      width: 65,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.5)),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          //we use clipreact for giving a border
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "images/b2.jpg",
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          //we use clipreact for giving a border
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "images/b3.jpg",
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          //we use clipreact for giving a border
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "images/b4.jpg",
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          //we use clipreact for giving a border
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "images/b5.jpg",
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(
                            width: 10.0,
                          ),
                          //we use clipreact for giving a border
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(40)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "images/b6.jpg",
                                  height: 65,
                                  width: 65,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Your Story",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "images/b1.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Justin Cro",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: "Poppins-Black.ttf",
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "images/more.png",
                        height: 40,
                        width: 10,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Image.asset(
                  "images/b7.jpeg",
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Image.asset(
                      "images/heart.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      "images/chat.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      "images/send.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        "images/save-instagram.png",
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "images/b1.jpg",
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(" Liked by "),
                    Text(
                      "Virat ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("and "),
                    Text(
                      "75k others  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Justin Cro:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text("Living my dream"),
                    Text(
                      "#FitnessFreak #LeanChallanges",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("View all 1,150 comments"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
