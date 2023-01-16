import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 3;
  final List<Widget> screens = [
    Cart(),
    Category(),
    Order(),
    Profile(),
    HomePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[700],
              child: ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {setState(() {
                currentScreen = HomePage();
                currentTab = 3;
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
                        currentScreen = Category();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/first.png"),
                          color:
                          currentTab == 0 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        currentScreen = Order();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,size: 30,
                          color:
                          currentTab == 1 ? Colors.blueAccent[700] : Colors.grey,
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
                        currentScreen = Cart();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/cart.png"),
                          color:
                          currentTab == 4 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/profile.png"),


                          color:
                          currentTab == 5 ? Colors.blueAccent[700] : Colors.grey,
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
    );
  }
}
