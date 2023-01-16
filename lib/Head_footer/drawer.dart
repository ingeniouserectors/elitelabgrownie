import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/Diamond.dart';
import 'package:ecom/core/view/app_string.dart';
import 'package:ecom/demo/Diamond_Details.dart';
import 'package:flutter/material.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 120,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Image.asset(
                    'assets/images/image_elite.png',
                    height: 42,
                  ),
                )),
          ),
          Divider(
            height: 3,
            // indent: 70,
            // endIndent: 20,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontFamily: "roboto", fontSize: 13),
            ),
            onTap: () =>
                {
                  Navigator.pop(context),
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))
                },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(
              'Profile',
              style: TextStyle(fontFamily: "roboto", fontSize: 13),
            ),
            onTap: () =>
                {
                  Navigator.pop(context),
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()))
                },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontFamily: "roboto", fontSize: 13),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text(
              'Feedback',
              style: TextStyle(fontFamily: "roboto", fontSize: 13),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(fontFamily: "roboto", fontSize: 13),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              color: Color(0XFFEBEBEB),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "BY CATEGORY",
                  style: (TextStyle(color: Colors.black54)),
                ),
                children: [
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        "Certified Lab Grown Diamonds",
                        style: TextStyle(fontFamily: "roboto", fontSize: 13),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DataPage()));
                      },
                      tileColor: Colors.white,
                    ),
                  ),

                  // Divider(
                  //   height: 1,
                  // ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        "Ready to Ship Lab Grown Diamond Jewelry",
                        style: TextStyle(fontFamily: "roboto", fontSize: 13),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DiamondJewellery(
                                  apiUrl: AppString.seeAll,
                                )));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
