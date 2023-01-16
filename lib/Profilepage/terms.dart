import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:flutter/material.dart';
import '../Head_footer/appbar.dart';
import '../Head_footer/drawer.dart';
import '../HomePage_Button/Education.dart';
import '../Main_Page/Profile.dart';
import '../horizontal_list.dart';


class Trems extends StatefulWidget {
  @override
  State<Trems> createState() => _TremsState();
}

class _TremsState extends State<Trems> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  int currentTab = 3;
  Widget currentScreen = Trems();
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
              child: const ImageIcon(AssetImage("assets/images/Bottom/home.png")),
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
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/education8 (1).jpg",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                      //co
                      TopCategories(),
                    ),
                  ),
                ),
              ),

              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "Privacy and Term Of Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. ",
                            style:
                            TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
