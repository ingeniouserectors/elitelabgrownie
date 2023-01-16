
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalListPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HorizontalListPageState createState() => _HorizontalListPageState();
}

class _HorizontalListPageState extends State<HorizontalListPage> {
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
                            child: Image.network(
                              linPink[index],
                              height: 250,
                              width: 200,
                            ),
                          ),
                          Divider(),
                          Flexible(
                              child: Padding(
                            padding:  EdgeInsets.only(left: 25,bottom: 3,top: 2),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  Titels[index],
                                  // textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                  Padding(
                            padding: EdgeInsets.only(left: 145,bottom: 1,top: 1),
                                 child:Icon(Icons.add_shopping_cart,size: 20, )
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
