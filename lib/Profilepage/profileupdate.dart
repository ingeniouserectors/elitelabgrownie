import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:flutter/material.dart';

import '../Head_footer/appbar.dart';
import '../Head_footer/drawer.dart';
import '../Main_Page/Profile.dart';
import '../horizontal_list.dart';

class Update_Profile extends StatefulWidget {
  @override
  State<Update_Profile> createState() => _Update_ProfileState();
}

class _Update_ProfileState extends State<Update_Profile> {
  double fontSize = 18;
  int currentTab = 3;
  Widget currentScreen = Update_Profile();
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
              child:
              const ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                });
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
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
                              builder: (context) => const Category(),
                            ));
                        // currentScreen = Category();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/first.png"),
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
                              builder: (context) => const Order(),
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
                              builder: (context) => const Cart(),
                            ));
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/cart.png"),
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
                              builder: (context) => const Profile(),
                            ));
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/profile.png"),
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
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 0,
              ),
              child: ClipRRect(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: TopCategories(),
                    )),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                   padding: EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text("Email(or Username)",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                          alignment: Alignment.topLeft,
                          child: Text("ap77@gmail.com",style: TextStyle(fontSize: 22,color: Color(0xff263238),))
                      ),

                      SizedBox(
                        height: 35,
                      ),

                      Container(
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Display name",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                  ),
                                ),

                              ),
                            ),

                            SizedBox(
                              height: 35,
                            ),

                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("First name",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Lase name",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Address 1",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Address 2",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("City",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 35,
                            ),

                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("State/Province",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Country",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Zip-Code",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 35,
                            ),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text("Company",style: TextStyle(fontSize: 28,color: Color(0xff546E7A),fontWeight: FontWeight.w500),)),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),

                          ],
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