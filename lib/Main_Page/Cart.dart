import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Main_Page/Cart_Ui_Page.dart';
import 'package:ecom/democarttt.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import '../bottom_navigation.dart';
import 'catagory.dart';
import 'order.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget currentScreen = Cart();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationView(),
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
