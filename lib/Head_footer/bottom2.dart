
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Mynavigationbar extends StatefulWidget {
  const Mynavigationbar({Key? key}) : super(key: key);

  @override
  _MynavigationbarState createState() => _MynavigationbarState();
}

class _MynavigationbarState extends State<Mynavigationbar> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingAction(),


      bottomNavigationBar: CupertinoTabScaffold(

          tabBar: CupertinoTabBar(
              activeColor: Colors.blueAccent[700],
              inactiveColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon : ImageIcon(
                    AssetImage("assets/images/Bottom/first.png"),
                  ),
                  // label: "Productos",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  // label: 'Clientes',
                ),
                BottomNavigationBarItem(
                  icon:    ImageIcon(
                AssetImage("assets/images/Bottom/cart.png"),),
                  // label: 'Ventas',
                ),
                BottomNavigationBarItem(
                  icon:     ImageIcon(
                AssetImage("assets/images/Bottom/profile.png"),),
                  // label: "Historial",
                ),
              ]),
          tabBuilder: (BuildContext contex, int index) {

            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => Category(),
                );
                break;
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => Order(),
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => Cart(),
                );
                break;
              case 3:
                return CupertinoTabView(
                  builder: (BuildContext context) => Profile(),
                );
              default:
                CupertinoTabView(builder:  (BuildContext context) => HomePage(),);


            }
            return Container(
            );
          }),
    );
  }
}

class FloatingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        Container(

          margin: EdgeInsets.only(bottom:70,),

          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Colors.blueAccent[700],
                child: ImageIcon(AssetImage("assets/images/Bottom/home.png")),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>HomePage()),
                  );
                }),
          ),
        ),
      ],
    );
  }
}


// import 'package:ecom/Main_Page/Cart.dart';
// import 'package:ecom/Main_Page/HomePage.dart';
// import 'package:ecom/Main_Page/Profile.dart';
// import 'package:ecom/Main_Page/order.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// PersistentTabController _controller =PersistentTabController(initialIndex: 0);
//
// //Screens for each nav items.
// List<Widget> _NavScreens() {
//   return [
//     HomePage(),
//     Profile(),
//     Cart(),
//     Order(),
//     Profile(),
//
//   ];
// }
//
//
// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.home),
//       title: ("Home"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.favorite),
//       title: ("OFFERS"),
//       activeColorPrimary: CupertinoColors.activeGreen,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.person_pin),
//       title: ("Help"),
//       activeColorPrimary: CupertinoColors.systemRed,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.local_activity),
//       title: ("ProfileScreen"),
//       activeColorPrimary: CupertinoColors.systemIndigo,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(Icons.account_box_outlined),
//       title: ("Cart"),
//       activeColorPrimary: CupertinoColors.systemIndigo,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//     ),
//
//   ];
// }
// @override
// Widget build(BuildContext context) {
//   return Center(
//     child: PersistentTabView (
//       controller: _controller,
//       screens: _NavScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white,
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       hideNavigationBarWhenKeyboardShows: true,
//       popAllScreensOnTapOfSelectedTab: true,
//       navBarStyle: NavBarStyle.style9,
//     ),
//   );
// }