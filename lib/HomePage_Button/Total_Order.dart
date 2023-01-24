import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Head_footer/drawer.dart';

import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';

import '../Main_Page/Cart.dart';
import '../Main_Page/Profile.dart';
import '../Main_Page/catagory.dart';
import '../Main_Page/order.dart';
import '../bottom_navigation.dart';

class Total_Order extends StatefulWidget {
  const Total_Order({Key? key}) : super(key: key);

  @override
  State<Total_Order> createState() => _Total_OrderState();
}

class _Total_OrderState extends State<Total_Order> {

  Widget currentScreen = Total_Order();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationView(),


        drawer: Drawer(child: drawer(),),
        appBar: customappbar(),
        backgroundColor:Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 0),

              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 0,),
                child: ClipRRect(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 10),
                        child: TopCategories(),
                      )),
                ),
              ),


              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Order",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),

                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20),
                    //   child: ElevatedButton(onPressed: (){},
                    //       child: Text("START SHOPPING "),
                    //
                    //   ),
                    // ),
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("No Data Found",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
