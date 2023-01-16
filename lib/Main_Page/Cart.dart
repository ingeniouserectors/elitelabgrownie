import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Main_Page/Cart_Ui_Page.dart';
import 'package:ecom/democarttt.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'catagory.dart';
import 'order.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentTab = 3;
  Widget currentScreen = Cart();
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
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  });
                }),
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
                            color: currentTab == 0 ? Colors.blueAccent[700] : Colors.grey,
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
                            color: currentTab == 1 ? Colors.blueAccent[700] : Colors.grey,
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
                            color: currentTab == 4 ? Colors.blueAccent[700] : Colors.grey,
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
                            color: currentTab == 5 ? Colors.blueAccent[700] : Colors.grey,
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
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: customappbar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: cartui(),
        ));
  }
}
