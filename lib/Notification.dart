import 'package:ecom/Details/DetailPage.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/Head_footer/drawer.dart';

import 'package:ecom/horizontal_list.dart';
import 'package:ecom/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class noti extends StatefulWidget {
  const noti({Key? key}) : super(key: key);

  @override
  State<noti> createState() => _notiState();
}

class _notiState extends State<noti> with WidgetsBindingObserver {

  int currentTab = 3;
  Widget currentScreen = noti();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton: Container(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Colors.blueAccent[700],
                child: ImageIcon(AssetImage("assets/images/Bottom/home.png")),
                onPressed: () {setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));

                });}),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Category(),
                              ));
                          // currentScreen = Category();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/Bottom/first.png"),
                            color: currentTab == 0
                                ? Colors.blueAccent[700]
                                : Colors.grey,
                          ),
                          // Text("AP")
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 220,
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Order(),
                              ));
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: currentTab == 1
                                ? Colors.blueAccent[700]
                                : Colors.grey,
                          ),
                          // Text("AP")
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 220,
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cart(),
                              ));
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/Bottom/cart.png"),
                            color: currentTab == 4
                                ? Colors.blueAccent[700]
                                : Colors.grey,
                          ),
                          // Text("AP")
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 120,
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ));
                          currentTab = 5;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/Bottom/profile.png"),
                            color: currentTab == 5
                                ? Colors.blueAccent[700]
                                : Colors.grey,
                          ),
                          // Text("AP")
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),


        drawer: Drawer(child: drawer(),),
        appBar: customappbar(),
        backgroundColor:Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 0),

              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 0,),
                child: ClipRRect(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10),
                        child: TopCategories(),
                      )),
                ),
              ),


              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Notification",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),

                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: ElevatedButton(onPressed: (){},
                    //       child: Text("START SHOPPING "),
                    //
                    //   ),
                    // ),
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("No Data Found",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
