import 'package:ecom/horizontal_list.dart';
import 'package:ecom/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../wishlist/horizontal_wislist.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: context.canvasColor,


      body: SingleChildScrollView(
        child: Column(
          children: [

            ClipRRect(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: TopCategories(),
                  )),
            ),
            Divider(
              height: 3,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text("TOTAL  1 items",style: TextStyle(color: Colors.cyan),),
                    trailing: Text("Clear Cart",style: TextStyle(color: Colors.red),),
                  ),
                ),
              ],
            ),
            Divider(),


             CartList().p2().expand(),
            Divider(),
            _Cupan(),
            Divider(),
            _CartTotal(),

            Divider(),
            Row(
              children: [
                // Text("My Wishlist",style: GoogleFonts.raleway(
                //   textStyle: TextStyle(color: Colors.grey[600],fontFamily: "raleway",fontWeight: FontWeight.w100, fontSize: 11,),
                // ),),

                Spacer(),
                GestureDetector(
                  onTap: (){},

                    child: Text("see all"))
              ],
            ),

            // WishListHorizontal(),
            //
            // Divider(),

            Center(
              child: Container(
                height: 70,
                width: 200,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onPressed: () => {},
                  icon: Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                  label: Text(
                    'CHECKOUT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class _Cupan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 600,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 45,
            width: 150,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () => {},
              icon: Icon(Icons.verified, color: Colors.cyan, size: 25),
              label: Text(
                'Apply',
                style: TextStyle(color: Colors.cyan, fontSize: 20),
              ),
            ),
          ),
        ],
      ),

//
    );
  }
}







class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Container(
            
            color: Colors.grey[100],
            child: ListTile(
              leading: Text("Products"),
              trailing: Text("x2"),
            ),
          ),
          Container(
            height: 50,
            color: Colors.grey[100],
            child: ListTile(
              leading: Text(
                "Total:",
                style: TextStyle(fontSize: 20),
              ),
              trailing: Text("\$50", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),

//
    );
  }
}

class CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<CartList> {
  List<String> linPink = [
    'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
    'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
  ];

  List<String> Price = [
    '\$20',
    '\$30',
    '\$40',
  ];

  List<String> Titels = [
    'Pandal',
    'Breslet',
    'Earrings',
  ];

  List<String> stock = [
    'In Stock',
    'In Stock',
    'In Stock',
  ];

  // Color primaryBlue = Color(0xFF586894);

  String dropdownvalue = ' 1';

// List of items in our dropdown menu
  var items = [
    ' 1',
    ' 2',
    ' 3',
    ' 4',
    ' 5',
    ' 6',
    ' 7',
    ' 8',
    ' 9',
    ' 10',
  ];
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
                      child: Image.asset(
                        linPink[index],
                        height: 200,
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
                            style: (TextStyle(color: Colors.black54)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(Price[index],style: TextStyle(color: Colors.black54),),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                              borderRadius: BorderRadius.circular(3.5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
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


class WishListHorizontal extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _WishListHorizontalState createState() => _WishListHorizontalState();
}

class _WishListHorizontalState extends State<WishListHorizontal> {
  // List<Map> categories = [
  //   {'name': 'All', 'iconPath': 'assets/icons/all_icon.png'},
  //   {'name': 'My', 'iconPath': 'assets/icons/fav_icon.png'},
  //   {'name': 'Anxious', 'iconPath': 'assets/icons/anxious_icon.png'},
  //   {'name': 'Kids', 'iconPath': 'assets/icons/kid_icon.png'},
  //   {'name': 'Sleep', 'iconPath': 'assets/icons/moon_icon.png'},
  //   {'name': 'All', 'iconPath': 'assets/icons/all_icon.png'},
  //   {'name': 'My', 'iconPath': 'assets/icons/fav_icon.png'},
  //   {'name': 'Anxious', 'iconPath': 'assets/icons/anxious_icon.png'},
  //   {'name': 'Kids', 'iconPath': 'assets/icons/kid_icon.png'},
  //   {'name': 'Sleep', 'iconPath': 'assets/icons/moon_icon.png'},
  // ];

  List<String> linPink = [
    'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
    'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_647Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_654Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_656Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_659Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_664Z.png'
  ];

  List<String> Price = [
    '\$20',
    '\$30',
    '\$40',
    '\$50',
    '\$60',
    '\$70',
    '\$80',
    '\$90'
  ];

  List<String> Titels = [
    'Pandal',
    'Breslet',
    'Earrings',
    'Earrings',
    'Gold Ring',
    'Gold Ring',
    'Necklace',
    'Necklace'
  ];

  List<String> stock = [
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
  ];

  // Color primaryBlue = Color(0xFF586894);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                // Text(
                //   "You might also like",
                //   style: TextStyle(
                //       fontSize: 40.0,
                //       fontWeight: FontWeight.bold,
                //       fontStyle: FontStyle.italic,
                //       color: Colors.black),
                // ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  height: 390,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: linPink.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  linPink[index],
                                  height: 250,
                                  width: 200,
                                ),
                              ),
                              Divider(),
                              Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25,bottom: 3,top: 2),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(

                                          Titels[index],
                                          // textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 18),

                                        ),
                                      ],
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(left: 25,bottom: 1,top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      Price[index], textAlign: TextAlign.left,
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "\$2",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          color: Colors.black54,
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 25,bottom: 1,top: 1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Text(
                                      stock[index], textAlign: TextAlign.left,
                                      style: GoogleFonts.aclonica(
                                        textStyle: TextStyle(
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ]),
        ));
  }
}

