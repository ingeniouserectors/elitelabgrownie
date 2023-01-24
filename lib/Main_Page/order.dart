
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bottom_navigation.dart';


class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with WidgetsBindingObserver {

  Widget currentScreen = Order();
  final PageStorageBucket bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    double iconheight = MediaQuery.of(context).size.height;
    double iconwidth = MediaQuery.of(context).size.width;
    String? law;

    return Scaffold(

        floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationView(),

        drawer: Drawer(child: drawer(),),
        appBar: customappbar(),
    body: Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color(0xff2297C3),
      //       Color(0xff0A9695),
      //     ]
      //   )
      //
      // ),
      color: Colors.white,
      child: SafeArea(
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



        Divider(
          height: 3,
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              child: ListTile(
                leading: Text("Liked 1 items",style: TextStyle(color: Colors.cyan),),
                trailing: Text("Clear Liked Products",style: TextStyle(color: Colors.red),),
              ),
            ),
          ],
        ),
        Divider(),


        _WishList().p2().expand(),


      ],
      ),
      ),
    )
    );
  }
}



class _WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<_WishList> {
  List<String> linPink = [
    'https://www.overnightmountings.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/L/G/LGET003-25S7.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/L/G/LGET003-25S7.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/L/G/LGET003-25S7.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/L/G/LGET003-25S7.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/L/G/LGET003-25S7.jpg',
  ];

  List<String> Price = [
    '\$1582.86',
    '\$7504.74',
    '\$1766.04',
    '\$1480.92',
    '\$1577.67',
  ];

  List<String> Titels = [
    'BRACELET',
    'BRACELET',
    'BRACELET',
    'BRACELET',
    'BRACELET',
  ];

  List<String> stock = [
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',

  ];

  // Color primaryBlue = Color(0xFF586894);

  String dropdownvalue = ' 1';

// List of items in our dropdown menu

  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: linPink.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 50, bottom: 20),
                    child: Icon(Icons.remove_circle_outline),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.network(
                      linPink[index],
                      height: 150,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Titels[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(Price[index],
                            style: TextStyle(color: Colors.black38),),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: (){}, child: Text("ADD TO CART"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff5FC2BF))),)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) { return Divider(); },);
  }
}
