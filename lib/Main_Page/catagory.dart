import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/bottom_navigation.dart';
import 'package:ecom/core/view/app_string.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Widget currentScreen = Category();
  final PageStorageBucket bucket = PageStorageBucket();

  final GlobalKey _key = GlobalKey();
  bool _offstage = true;
  bool _offstage1 = true;

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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 0,
                ),
                child: ClipRRect(
                  child: Container(
                      // color: Colors.white,
                      child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: TopCategories(),
                  )),
                ),
              ),
              Container(
                child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(05),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _offstage = !_offstage;
                          });
                        },
                        // onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>DataPage()));
                        // },
                        child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/diamonds.jpg",
                                ),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "D i a m o n d",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                      //   ),
                      // ),
                    )),
              ),
              Container(
                child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(05),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _offstage1 = !_offstage1;
                          });
                        },
                        child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/Jewelry_LP_New_Jewelry_Desktop.jpeg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "J e w e l r y",
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                      //   ),
                      // ),
                    )),
              ),
              Offstage(
                offstage: _offstage1,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.seeAll)));

                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (context) => DiamondJewellery(
                        //           apiUrl: AppString.seeAll,
                        //         )));
                      },
                      title: Text(
                        "See All ",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "4500 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>   DiamondJewellery(apiUrl: AppString.engagmentRing)));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         DiamondJewellery(apiUrl: AppString.engagmentRing)));
                      },
                      title: Text(
                        "Engagement Rings",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "900 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => DiamondJewellery(apiUrl: AppString.weddingRing)));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.weddingRing)));

                      },
                      title: Text(
                        "Wedding Bands",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "700 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {


                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.fashionRing)));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => DiamondJewellery(apiUrl: AppString.fashionRing)));
                      },
                      title: Text(
                        "Fashion Rings",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "450 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.braceletsRing)));

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         DiamondJewellery(apiUrl: AppString.braceletsRing)));
                      },
                      title: Text(
                        "Bracelets",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "70 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.earringsRing)));

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         DiamondJewellery(apiUrl: AppString.earringsRing)));
                      },
                      title: Text(
                        "Earrings",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "35 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      onTap: () {

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   DiamondJewellery(apiUrl: AppString.pendantsAndNecklacesRing)));


                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         DiamondJewellery(apiUrl: AppString.pendantsAndNecklacesRing)));
                      },
                      title: Text(
                        "Necklaces & Pendants",
                        style: TextStyle(fontFamily: "roboto", fontSize: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "45 items",
                            style: TextStyle(
                                fontFamily: "roboto", fontSize: 16, color: Color(0xff51c0bc)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                bottom: 20,
                                right: 20,
                                top: 10), //apply padding to some sides only
                          ),
                          Icon(
                            CupertinoIcons.forward,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
