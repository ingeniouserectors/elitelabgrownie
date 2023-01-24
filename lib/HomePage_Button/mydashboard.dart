
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import '../Main_Page/order.dart';
import '../Head_footer/drawer.dart';
import '../bottom_navigation.dart';

class Mydashboard extends StatefulWidget {
  const Mydashboard({Key? key}) : super(key: key);

  @override
  State<Mydashboard> createState() => _MydashboardState();
}

class _MydashboardState extends State<Mydashboard> {

  Widget currentScreen = Mydashboard();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),


        drawer: Drawer(child: drawer(),),
        appBar: customappbar(),
        backgroundColor:Colors.grey[100],
        body:  Column(
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
              SizedBox(height: 20,),

              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 11,bottom: 11,left: 15,
                              right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));

                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "In Progess Orders 5\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));

                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Cancelled Orders 1\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 11,bottom: 11,left: 15,
                              right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));

                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Delivered Orders 98\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));

                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Total Ordres 100\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 11,bottom: 11,left: 15,
                              right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Total Product 98\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Category(),
                                        ));

                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => Category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child: Text(
                                          "Order reviews  100\,000",
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),



            ],
          ),
    );
  }
}
