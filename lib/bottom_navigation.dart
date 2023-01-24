import 'package:flutter/material.dart';

import 'Main_Page/Cart.dart';
import 'Main_Page/HomePage.dart';
import 'Main_Page/Profile.dart';
import 'Main_Page/catagory.dart';
import 'Main_Page/order.dart';

class BottomHomeButton extends StatefulWidget {
  const BottomHomeButton({Key? key}) : super(key: key);

  @override
  State<BottomHomeButton> createState() => _BottomHomeButtonState();
}

class _BottomHomeButtonState extends State<BottomHomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {

  int currentTab = 3;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}
