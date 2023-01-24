import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/HomePage_Button/Education.dart';
import 'package:ecom/HomePage_Button/mydashboard.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Diamond.dart';
import 'package:ecom/core/view/app_string.dart';
import 'package:ecom/totalorder.dart';
import 'package:ecom/totalearned.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';

import '../bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
  }

  // int pageIndex=0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> _demo = [
    Container(
      child: Image.asset(
        "assets/images/Mobile_Template_O1.jpg",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/images/Mobile_Template_O3.jpg",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/images/Mobile_Template_O2.jpg",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: drawer(),
      ),
      appBar: customappbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: _demo,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
                  ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _demo.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 20.0,
                      height: 2.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(10),
                          color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Totalorderpage()));
                      },
                      child: Container(
                        height: 97,
                        decoration: BoxDecoration(
                          color: Color(0xff6cabc8),
                          borderRadius: BorderRadius.circular(3.5),
                        ),
                        child: Center(
                            child: Text(
                          "Total Order Amount: \$500,000",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Totalearnpage()));
                      },
                      child: Container(
                        height: 97,
                        decoration: BoxDecoration(
                          color: Color(0xff6cabc8),
                          borderRadius: BorderRadius.circular(3.5),
                        ),
                        child: Center(
                            child: Text(
                          "Total Point Earned: 5,000",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DataPage()));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff15b28c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Certified Lab Grown Diamonds",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DiamondJewellery(
                                  apiUrl: AppString.seeAll,
                                )));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff15b28c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Ready to Ship Lab Grown Diamond Jewelry",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Mydashboard()));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff15b28c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "My Dashboard",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Education()));
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff15b28c),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Lab Grown Education",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4, left: 11, right: 11),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: Center(
                          child: buildAnimatedText(
                              "Gold - \$5000     Platinum - \$3000   Palladium - \$1500    Silver - \$50          **Open Saturdays through Christmas\!")),
                    ),
                  ),
                ],
              ),
            ),
            //
            // Container(
            //   child: buildAnimatedText("ap"),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildAnimatedText(String text) => Marquee(
        text: text,
        style: TextStyle(fontSize: 17, color: Color(0xff333333)),
        blankSpace: 300,
        velocity: 100,
      );
}
