//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class WishListHorizontal extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _WishListHorizontalState createState() => _WishListHorizontalState();
// }
//
// class _WishListHorizontalState extends State<WishListHorizontal> {
//   // List<Map> categories = [
//   //   {'name': 'All', 'iconPath': 'assets/icons/all_icon.png'},
//   //   {'name': 'My', 'iconPath': 'assets/icons/fav_icon.png'},
//   //   {'name': 'Anxious', 'iconPath': 'assets/icons/anxious_icon.png'},
//   //   {'name': 'Kids', 'iconPath': 'assets/icons/kid_icon.png'},
//   //   {'name': 'Sleep', 'iconPath': 'assets/icons/moon_icon.png'},
//   //   {'name': 'All', 'iconPath': 'assets/icons/all_icon.png'},
//   //   {'name': 'My', 'iconPath': 'assets/icons/fav_icon.png'},
//   //   {'name': 'Anxious', 'iconPath': 'assets/icons/anxious_icon.png'},
//   //   {'name': 'Kids', 'iconPath': 'assets/icons/kid_icon.png'},
//   //   {'name': 'Sleep', 'iconPath': 'assets/icons/moon_icon.png'},
//   // ];
//
//   List<String> linPink = [
//     'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_647Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_654Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_656Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_659Z.png',
//     'assets/Jewellery/image_2022_12_24T18_43_37_664Z.png'
//   ];
//
//   List<String> Price = [
//     '\$20',
//     '\$30',
//     '\$40',
//     '\$50',
//     '\$60',
//     '\$70',
//     '\$80',
//     '\$90'
//   ];
//
//   List<String> Titels = [
//     'Pandal',
//     'Breslet',
//     'Earrings',
//     'Earrings',
//     'Gold Ring',
//     'Gold Ring',
//     'Necklace',
//     'Necklace'
//   ];
//
//   List<String> stock = [
//     'In Stock',
//     'In Stock',
//     'In Stock',
//     'In Stock',
//     'In Stock',
//     'In Stock',
//     'In Stock',
//     'In Stock',
//   ];
//
//   // Color primaryBlue = Color(0xFF586894);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // SizedBox(
//                 //   height: 20,
//                 // ),
//                 // Text(
//                 //   "You might also like",
//                 //   style: TextStyle(
//                 //       fontSize: 40.0,
//                 //       fontWeight: FontWeight.bold,
//                 //       fontStyle: FontStyle.italic,
//                 //       color: Colors.black),
//                 // ),
//                 SizedBox(
//                   height: 23,
//                 ),
//                 Container(
//                   height: 390,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: linPink.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           color: Colors.white,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             // mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 margin: EdgeInsets.only(left: 20),
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey[100],
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Image.asset(
//                                   linPink[index],
//                                   height: 250,
//                                   width: 200,
//                                 ),
//                               ),
//                               Divider(),
//                               Flexible(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 25,bottom: 3,top: 2),
//                                     child: Row(
//                                       // mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//
//                                           Titels[index],
//                                           // textAlign: TextAlign.left,
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 2,
//                                           style: TextStyle(fontSize: 18),
//
//                                         ),
//                                       ],
//                                     ),
//                                   )),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 25,bottom: 1,top: 8),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       Price[index], textAlign: TextAlign.left,
//                                       style: GoogleFonts.raleway(
//                                         textStyle: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text(
//                                       "\$2",
//                                       style: GoogleFonts.raleway(
//                                         textStyle: TextStyle(
//                                           color: Colors.black54,
//                                           decoration: TextDecoration.lineThrough,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 25,bottom: 1,top: 1),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//
//                                   children: [
//                                     Text(
//                                       stock[index], textAlign: TextAlign.left,
//                                       style: GoogleFonts.aclonica(
//                                         textStyle: TextStyle(
//                                           color: Colors.cyan,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 11,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//               ]),
//         ));
//   }
// }
