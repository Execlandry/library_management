import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_management/common/app_colors.dart';
import 'package:library_management/pages/userUi/cardsui.dart';
// import 'package:pet_ui/configuration.dart';
// import 'package:pet_ui/screen2.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  TextEditingController _searchController = TextEditingController();
  // List _allResult = [];

  //  String? email;
  // String? name;

  // getBooksStream() async {
  //   final uid = await FirebaseAuth.instance.currentUser;
  //   // var data = await FirebaseFirestore.instance
  //   // .collection("books").doc(uid).get();

  //   setState(() {
  //     // _allResult = data.document;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      Text(
                        'Welcome !',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Row(
                      // children: [
                      // Icon(
                      // Icons.location_on,
                      // color: primaryGreen,
                      // ),
                      // if(user != null ){
                      //   Text(),
                      // }
                      // else{

                      // }
                      // ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  )
                  // CircleAvatar()
                ],
              ),
            ),
            // SizedBox(height: 50),

            Column(
              children: [
                Container(
                  height: size.height * 0.2,
                  child: Stack(children: [
                    Container(
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: AppColor.kprimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.kprimaryColor.withOpacity(0.23),
                              offset: Offset(0, 10),
                              blurRadius: 50,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Search a Book",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      },
                      child: SizedBox(
                          height: 1000,
                          width: 1000,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                              itemBuilder: (context, index) => BookCard())),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
