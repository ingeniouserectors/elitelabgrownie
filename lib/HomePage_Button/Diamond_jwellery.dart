import 'dart:convert';
import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
import 'package:ecom/Details/DetailPage.dart';
import 'package:ecom/Details/DetailPage_image.dart';
import 'package:ecom/Head_footer/Bottom.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/HomePage_Button/model/model_custom_products.dart';
import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/view/bottom_cart_view.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:ecom/core/view/progress_indicator_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Main_Page/Cart.dart';
import '../Main_Page/HomePage.dart';
import '../Main_Page/Profile.dart';
import '../Main_Page/catagory.dart';
import '../bottom_navigation.dart';
import '../core/view/app_string.dart';

class DiamondJewellery extends StatefulWidget {
  final String apiUrl;
  const DiamondJewellery({Key? key, required this.apiUrl}) : super(key: key);

  @override
  State<DiamondJewellery> createState() => _DiamondJewelleryState();
}

class _DiamondJewelleryState extends State<DiamondJewellery> {
  bool isvisible1 = true;
  bool isvisible2 = true;
  bool isvisible3 = true;
  bool isvisible4 = true;
  bool isvisible5 = true;
  bool isvisible6 = true;

  bool CenterShapevisible1 = true;
  bool CenterShapevisible2 = true;
  bool CenterShapevisible3 = true;
  bool CenterShapevisible4 = true;
  bool CenterShapevisible5 = true;
  bool CenterShapevisible6 = true;
  bool CenterShapevisible7 = true;
  bool CenterShapevisible8 = true;
  bool CenterShapevisible9 = true;
  bool CenterShapevisible10 = true;

  bool metalvisible1 = true;
  bool metalvisible2 = true;
  bool metalvisible3 = true;
  bool metalvisible4 = true;

  final PageStorageBucket bucket = PageStorageBucket();

  List<String> linPink = [
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: TopCategories(),
                    )),
              ),
              const Divider(),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    openbottomsheet();
                  },

                  // onTap: () {
                  //   showModalBottomSheet<void>(
                  //     isScrollControlled: true,
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(30),
                  //         topRight: Radius.circular(30),
                  //       ),
                  //     ),
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return SizedBox(
                  //         height: 700,
                  //         child: Center(
                  //           child: ListView(
                  //             // mainAxisAlignment:
                  //             //     MainAxisAlignment.center,
                  //             // mainAxisSize: MainAxisSize.min,
                  //             children: <Widget>[
                  //               Padding(
                  //                 padding: const EdgeInsets.symmetric(horizontal: 16),
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Column(
                  //                       children: [
                  //                         Padding(
                  //                           padding: const EdgeInsets.only(top: 14),
                  //                           child: Center(
                  //                             child: Container(
                  //                               decoration: BoxDecoration(
                  //                                 color: Colors.black12,
                  //                                 borderRadius: BorderRadius.circular(10),
                  //                               ),
                  //                               height: 10,
                  //                               width: 80,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //
                  //                     Row(
                  //                       children: [
                  //                         const Text(
                  //                           "Layouts",
                  //                           style: TextStyle(fontSize: 25),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     // Divider(),
                  //                     Row(
                  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                       crossAxisAlignment: CrossAxisAlignment.center,
                  //                       children: [
                  //                         Row(
                  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                           crossAxisAlignment: CrossAxisAlignment.center,
                  //                           children: [
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   top: 8, left: 16, right: 16, bottom: 8),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   color: const Color(0xffEBEBEB),
                  //                                   borderRadius: BorderRadius.circular(10),
                  //                                 ),
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.all(15.0),
                  //                                   child: Image.asset(
                  //                                     "assets/Filter/grid1.png",
                  //                                     height: 65,
                  //                                     width: 65,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   top: 8, left: 16, right: 16, bottom: 8),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   color: const Color(0xffEBEBEB),
                  //                                   borderRadius: BorderRadius.circular(10),
                  //                                 ),
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.all(15.0),
                  //                                   child: Image.asset(
                  //                                     "assets/Filter/grid2.png",
                  //                                     height: 65,
                  //                                     width: 65,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   top: 8, left: 16, right: 16, bottom: 8),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   color: const Color(0xffEBEBEB),
                  //                                   borderRadius: BorderRadius.circular(10),
                  //                                 ),
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.all(15.0),
                  //                                   child: Image.asset(
                  //                                     "assets/Filter/grid3.png",
                  //                                     height: 65,
                  //                                     width: 65,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   top: 8, left: 16, right: 16, bottom: 8),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   color: const Color(0xffEBEBEB),
                  //                                   borderRadius: BorderRadius.circular(10),
                  //                                 ),
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.all(15.0),
                  //                                   child: Image.asset(
                  //                                     "assets/Filter/grid5.png",
                  //                                     height: 65,
                  //                                     width: 65,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             Padding(
                  //                               padding: const EdgeInsets.only(
                  //                                   top: 8, left: 16, right: 16, bottom: 8),
                  //                               child: Container(
                  //                                 decoration: BoxDecoration(
                  //                                   color: const Color(0xffEBEBEB),
                  //                                   borderRadius: BorderRadius.circular(10),
                  //                                 ),
                  //                                 child: Padding(
                  //                                   padding: const EdgeInsets.all(15.0),
                  //                                   child: Image.asset(
                  //                                     "assets/Filter/grid1.png",
                  //                                     height: 65,
                  //                                     width: 65,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         )
                  //                       ],
                  //                     ),
                  //
                  //                     const Divider(
                  //                       color: Colors.white,
                  //                     ),
                  //
                  //                     const SizedBox(
                  //                       height: 30,
                  //                     ),
                  //                     ExpansionTile(
                  //                         title: const Text(
                  //                           "Sort by",
                  //                           style: TextStyle(fontSize: 25),
                  //                         ),
                  //                         children: [
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 top: 0, bottom: 4, left: 11, right: 11),
                  //                             child: Row(
                  //                               children: [
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Date : Latest",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(width: 7),
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Date : Oldest",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 top: 0, bottom: 4, left: 11, right: 11),
                  //                             child: Row(
                  //                               children: [
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Price : Low to High",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(width: 7),
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Price : High to Low",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 top: 0, bottom: 4, left: 11, right: 11),
                  //                             child: Row(
                  //                               children: [
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Title : A to Z",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 const SizedBox(width: 7),
                  //                                 Expanded(
                  //                                   child: GestureDetector(
                  //                                     onTap: () {},
                  //                                     child: Container(
                  //                                       height: 55,
                  //                                       decoration: BoxDecoration(
                  //                                         color: const Color(0xffEBEBEB),
                  //                                         borderRadius: BorderRadius.circular(5),
                  //                                       ),
                  //                                       child: const Center(
                  //                                           child: Text(
                  //                                             "Title : Z to A",
                  //                                             style: TextStyle(
                  //                                               fontSize: 18,
                  //                                             ),
                  //                                           )),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ]),
                  //
                  //                     ExpansionTile(
                  //                         title: const Text(
                  //                           "By Price",
                  //                           style: TextStyle(fontSize: 22),
                  //                         ),
                  //                         children: [
                  //                           Container(
                  //                             // margin: EdgeInsets.all(1.0),
                  //                             child: Column(
                  //                               children: <Widget>[
                  //                                 RangeSliderItem(
                  //                                   title: '',
                  //                                   initialMinValue: 20,
                  //                                   initialMaxValue: 80,
                  //                                   onMinValueChanged: (v) {},
                  //                                   onMaxValueChanged: (v) {},
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ]),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   );
                  // },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Icon(
                          Icons.filter_list,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 440,
                        ),
                        child: Text(
                          "Jewelry Filter",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              Grib(
                url: widget.apiUrl,
              ).p2().expand(),

              // Align(
              //     alignment: FractionalOffset.bottomRight,
              //     child: SizedBox(
              //       height: 70,
              //       width: 70,
              //       child: ElevatedButton(
              //         style: TextButton.styleFrom(
              //           textStyle: const TextStyle(color: Colors.white),
              //           backgroundColor: const Color(0xffD9F3F2),
              //           shape: const RoundedRectangleBorder(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(30),
              //               // topRight: Radius.circular(30),
              //             ),
              //           ),
              //         ),
              //         onPressed: () => {},
              //         child: const Icon(
              //           Icons.add_shopping_cart,
              //           color: Colors.black,
              //         ),
              //       ),
              //     )),

              // SizedBox(
              //   height: 50,
              // )
            ],
          ),
          const BottomCartView(),
        ],
      ),
    );
  }

  void openbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return SizedBox(
                height: 900,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 10,
                                      width: 80,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //backgroundColor: Color(0xffD9F3F2),
                                backgroundColor: Colors.cyan,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Apply",
                                style: TextStyle(fontSize: 25),
                              ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text(
                                  "Jewelry",
                                  style: TextStyle(fontSize: 25),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     setState(() {
                                              //       isvisible = !isvisible;
                                              //     });
                                              //   },
                                              //   child: Visibility(
                                              //     visible: isvisible,
                                              //     child: Container(
                                              //       height: 55,
                                              //       decoration: BoxDecoration(
                                              //         color: const Color(0xffEBEBEB),
                                              //         borderRadius: BorderRadius.circular(5),
                                              //       ),
                                              //       child:  Center(
                                              //           child: Text(
                                              //             "Engagement Ring",
                                              //             style: TextStyle(
                                              //               fontSize: 18,
                                              //             ),
                                              //           )),
                                              //     ),
                                              //   ),
                                              // ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    isvisible1 = !isvisible1;
                                                  });
                                                },
                                                child: Container(
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: isvisible1
                                                        ? const Color(0xffEBEBEB)
                                                        : const Color(0xffD9F3F2),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      !isvisible1
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.cyan,
                                                              ))
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.transparent,
                                                              )),
                                                      Container(
                                                          padding: const EdgeInsets.only(left: 80),
                                                          child: Text(
                                                            "Engagement Ring",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: isvisible1
                                                                    ? Colors.black
                                                                    : Colors.cyan),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible2 = !isvisible2;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: isvisible2
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !isvisible2
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Wedding Bands",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: isvisible2
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible3 = !isvisible3;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: isvisible3
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !isvisible3
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Fashion Rings",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: isvisible3
                                                              ? Colors.black
                                                              : Colors.cyan,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius: BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //           "Fashion Rings",
                                          //           style: TextStyle(
                                          //             fontSize: 18,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible4 = !isvisible4;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: isvisible4
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !isvisible4
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Bracelets",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: isvisible4
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Bracelets",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible5 = !isvisible5;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: isvisible5
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !isvisible5
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Necklaces & Pendants",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: isvisible5
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Necklaces & Pendants",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isvisible6 = !isvisible6;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: isvisible6
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !isvisible6
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Earrings",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: isvisible6
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Earrings",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                            ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text(
                                  "Center Shape",
                                  style: TextStyle(fontSize: 25),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    CenterShapevisible1 = !CenterShapevisible1;
                                                  });
                                                },
                                                child: Container(
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: CenterShapevisible1
                                                        ? const Color(0xffEBEBEB)
                                                        : const Color(0xffD9F3F2),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      !CenterShapevisible1
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.cyan,
                                                              ))
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.transparent,
                                                              )),
                                                      Container(
                                                          padding: const EdgeInsets.only(left: 80),
                                                          child: Text(
                                                            "Round",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: CenterShapevisible1
                                                                    ? Colors.black
                                                                    : Colors.cyan),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible2 = !CenterShapevisible2;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible2
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible2
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Princess",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible2
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // child: GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius: BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //           "Wedding Bands",
                                          //           style: TextStyle(
                                          //             fontSize: 18,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible3 = !CenterShapevisible3;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible3
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible3
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Marquise",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible3
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius: BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //           "Fashion Rings",
                                          //           style: TextStyle(
                                          //             fontSize: 18,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible4 = !CenterShapevisible4;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible4
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible4
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Cushion",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible4
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Bracelets",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible5 = !CenterShapevisible5;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible5
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible5
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Oval",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible5
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Necklaces & Pendants",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible6 = !CenterShapevisible6;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible6
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible6
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Pear",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible6
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Earrings",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible7 = !CenterShapevisible7;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible7
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible7
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Emerald",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible7
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Necklaces & Pendants",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible8 = !CenterShapevisible8;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible8
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible8
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Asscher",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible8
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Earrings",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible9 = !CenterShapevisible9;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible9
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible9
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Radiant",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible9
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Necklaces & Pendants",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                CenterShapevisible10 = !CenterShapevisible10;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: CenterShapevisible10
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !CenterShapevisible10
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Heart",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: CenterShapevisible10
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Earrings",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                            ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text(
                                  "Metal",
                                  style: TextStyle(fontSize: 25),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     setState(() {
                                              //       isvisible = !isvisible;
                                              //     });
                                              //   },
                                              //   child: Visibility(
                                              //     visible: isvisible,
                                              //     child: Container(
                                              //       height: 55,
                                              //       decoration: BoxDecoration(
                                              //         color: const Color(0xffEBEBEB),
                                              //         borderRadius: BorderRadius.circular(5),
                                              //       ),
                                              //       child:  Center(
                                              //           child: Text(
                                              //             "Engagement Ring",
                                              //             style: TextStyle(
                                              //               fontSize: 18,
                                              //             ),
                                              //           )),
                                              //     ),
                                              //   ),
                                              // ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    metalvisible1 = !metalvisible1;
                                                  });
                                                },
                                                child: Container(
                                                  height: 55,
                                                  decoration: BoxDecoration(
                                                    color: metalvisible1
                                                        ? const Color(0xffEBEBEB)
                                                        : const Color(0xffD9F3F2),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      !metalvisible1
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.cyan,
                                                              ))
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: const Icon(
                                                                Icons.done,
                                                                color: Colors.transparent,
                                                              )),
                                                      Container(
                                                          padding: const EdgeInsets.only(left: 80),
                                                          child: Text(
                                                            "White Gold",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: metalvisible1
                                                                    ? Colors.black
                                                                    : Colors.cyan),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                metalvisible2 = !metalvisible2;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: metalvisible2
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !metalvisible2
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Yellow Gold",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: metalvisible2
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // child: GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius: BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //           "Wedding Bands",
                                          //           style: TextStyle(
                                          //             fontSize: 18,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 4, left: 11, right: 11),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                metalvisible3 = !metalvisible3;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: metalvisible3
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !metalvisible3
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Rose Gold",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: metalvisible3
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius: BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //           "Fashion Rings",
                                          //           style: TextStyle(
                                          //             fontSize: 18,
                                          //           ),
                                          //         )),
                                          //   ),
                                          // ),
                                        ),
                                        const SizedBox(width: 7),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                metalvisible4 = !metalvisible4;
                                              });
                                            },
                                            child: Container(
                                              height: 55,
                                              decoration: BoxDecoration(
                                                color: metalvisible4
                                                    ? const Color(0xffEBEBEB)
                                                    : const Color(0xffD9F3F2),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  !metalvisible4
                                                      ? Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.cyan,
                                                          ))
                                                      : Container(
                                                          padding: const EdgeInsets.only(left: 10),
                                                          child: const Icon(
                                                            Icons.done,
                                                            color: Colors.transparent,
                                                          )),
                                                  Container(
                                                      padding: const EdgeInsets.only(left: 80),
                                                      child: Text(
                                                        "Platinum",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: metalvisible4
                                                                ? Colors.black
                                                                : Colors.cyan),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     height: 55,
                                          //     decoration: BoxDecoration(
                                          //       color: const Color(0xffEBEBEB),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5),
                                          //     ),
                                          //     child: const Center(
                                          //         child: Text(
                                          //       "Bracelets",
                                          //       style: TextStyle(
                                          //         fontSize: 18,
                                          //       ),
                                          //     )),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            // ExpansionTile(
                            //     title: const Text(
                            //       "By Price",
                            //       style: TextStyle(fontSize: 22),
                            //     ),
                            //     children: [
                            //       Container(
                            //         // margin: EdgeInsets.all(1.0),
                            //         child: Column(
                            //           children: <Widget>[
                            //             RangeSliderItem(
                            //               title: '',
                            //               initialMinValue: 20,
                            //               initialMaxValue: 80,
                            //               onMinValueChanged: (v) {},
                            //               onMaxValueChanged: (v) {},
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class RangeSliderItem extends StatefulWidget {
  final String title;
  final int initialMinValue;
  final int initialMaxValue;
  final ValueChanged<int> onMinValueChanged;
  final ValueChanged<int> onMaxValueChanged;

  const RangeSliderItem(
      {Key? key,
      required this.title,
      required this.initialMinValue,
      required this.initialMaxValue,
      required this.onMinValueChanged,
      required this.onMaxValueChanged})
      : super(key: key);

  @override
  _RangeSliderItemState createState() => _RangeSliderItemState();
}

class _RangeSliderItemState extends State<RangeSliderItem> {
  late int minValue;
  late int maxValue;

  @override
  void initState() {
    super.initState();
    minValue = widget.initialMinValue;
    maxValue = widget.initialMaxValue;
  }

  @override
  Widget build(BuildContext context) {
    return FilterItemHolder(
      title: widget.title,
      value: '$minValue-$maxValue',
      child: CupertinoRangeSlider(
        minValue: minValue.roundToDouble(),
        maxValue: maxValue.roundToDouble(),
        min: 1.0,
        max: 100.0,
        onMinChanged: (minVal) {
          setState(() {
            minValue = minVal.round();
            widget.onMinValueChanged(minValue);
          });
        },
        onMaxChanged: (maxVal) {
          setState(() {
            maxValue = maxVal.round();
            widget.onMaxValueChanged(maxValue);
          });
        },
      ),
    );
  }
}

class FilterItemHolder extends StatelessWidget {
  final String title;
  final String value;
  final Widget? child;

  FilterItemHolder({Key? key, required this.title, this.value = '', this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          // margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 12.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    child: Column(
                      children: [
                        Center(
                          child: Text(value, style: const TextStyle(fontSize: 30)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: SizedBox(
            height: 47.0,
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}

class Grib extends StatefulWidget {
  final String url;
  const Grib({Key? key, required this.url}) : super(key: key);

  @override
  State<Grib> createState() => _GribState();
}

class _GribState extends State<Grib> {
  List<ModelCustomProducts> mModelCustomProducts = [];

  ///List<ModelCustomProducts> mCurrentCustomProducts = [];
  int page = 1;
  int pageCount = 12;
  int startAt = 0;
  int? endAt;
  int totalPages = 0;

  late bool isFavorite;

  List<String> linPink = [
    'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
    'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_647Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_654Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_656Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_659Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_664Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
    'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_647Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_654Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_656Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_659Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_664Z.png'
  ];
//
  List<String> Price = [
    '\$20',
    '\$30',
    '\$40',
    '\$50',
    '\$60',
    '\$70',
    '\$80',
    '\$90',
    '\$20',
    '\$30',
    '\$40',
    '\$50',
    '\$60',
    '\$70',
    '\$80',
    '\$90',
  ];

  List<String> Titels = [
    'Pandal',
    'Breslet',
    'Earrings',
    'Earrings',
    'Gold Ring',
    'Gold Ring',
    'Necklace',
    'Necklace',
    'Pandal1',
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
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
  ];

  // Color _iconColor = Colors.black;
  Color _favIconColor = Colors.grey[500]!;
  Color _favIconColor1 = Colors.grey[100]!;
  int selectedImage = 0;

  @override
  void initState() {
    // TODO: implement initState
    getDaimondData();
    super.initState();
  }

  bool isLoading = false;
  final PageStorageBucket bucket = PageStorageBucket();

  void getDaimondData() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      "Accept": "application/json",
      "consumerKey": "bbae36baea2ef8dcd1f9a8a88cc59f06",
      "consumerSecret": "5edc426ec2965bba17c96e766c47ad73",
      "oauth_token": "819dc5826cd08cca9c57d392ba2b305e",
      "oauth_token_secret": "97565ea77d5c8c8f7c63b8f5f3916656",
    };

    String url = '';
    if (AppString.seeAll == widget.url) {
      url = '${widget.url}?page=${page}&limit=12';
    } else {
      url = '${widget.url}&page=${page}&limit=12';
    }

    var response = await http.get(Uri.parse(url), headers: headers);
    print('widget.url--$url');
    print('widget.statusCode--${response.statusCode}');
    print('widget.body--${response.body.toString()}');
    // print("data  -----------${data}");
    response.body == [] ? isLoading = false : isLoading = true;

    Map<String, dynamic> valueMap = jsonDecode(response.body.toString());
    valueMap.forEach((key, value) {
      try {
        ModelCustomProducts streams = ModelCustomProducts.fromJson(value);
        mModelCustomProducts.add(streams);
      } catch (e) {
        // isLoading = false;
        print('catch--$e');
        print("hhhhg");
      }
    });

    setState(() {
      isLoading = false;
    });
    isCart();
  }

  /* void loadPreviousPage() {
    if (page > 1) {
      setState(() {
        startAt = startAt - pageCount;
        endAt = page == totalPages ? endAt! - mCurrentCustomProducts.length : endAt! - pageCount;
        mCurrentCustomProducts = mModelCustomProducts.getRange(startAt, endAt!).toList();
        page = page - 1;
      });
    }
  }

  void loadNextPage() {
    if (page < totalPages) {
      setState(() {
        startAt = startAt + pageCount;
        endAt = mModelCustomProducts.length > endAt! + pageCount
            ? endAt! + pageCount
            : mModelCustomProducts.length;
        mCurrentCustomProducts = mModelCustomProducts.getRange(startAt, endAt!).toList();
        page = page + 1;
      });
    }
  }*/

  isCart() {
    if (DbProvider().getCart().isNotEmpty) {
      for (int i = 0; i < mModelCustomProducts.length; i++) {
        mModelCustomProducts[i].isCart = false;
      }
      for (int i = 0; i < mModelCustomProducts.length; i++) {
        for (int j = 0; j < DbProvider().getCart().length; j++) {
          if (DbProvider().getCart()[j].entityId != null &&
              DbProvider().getCart()[j].entityId.toString() ==
                  mModelCustomProducts[i].entityId.toString()) {
            mModelCustomProducts[i].isCart = true;
          }
        }
      }
      setState(() {});
    } else {
      setState(() {
        for (int i = 0; i < mModelCustomProducts.length; i++) {
          mModelCustomProducts[i].isCart = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartResponse) {
          isCart();
        }
      },
      child: Column(
        children: [
          Expanded(
            child: isLoading && page == 1
                ? mModelCustomProducts.isEmpty
                    ? Center(
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')),
                      )
                    : const Center(child: Text("No Data Found"))
                : Column(
                    children: [
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification.metrics.pixels ==
                                    scrollNotification.metrics.maxScrollExtent &&
                                isLoading == false) {
                              setState(() {
                                page += 1;
                              });
                              getDaimondData();
                            }
                            return false;
                          },
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: mModelCustomProducts.length,
                              // scrollDirection: Axis.horizontal,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, mainAxisExtent: 410),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 270,
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DetailPage(
                                                      mModelCustomProducts:
                                                          mModelCustomProducts[index],
                                                    ),
                                              ));
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //     builder: (context) => DetailPage(
                                          //           mModelCustomProducts:
                                          //               mModelCustomProducts[index],
                                          //         )));
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Stack(children: [
                                              ImageViewerNetwork(
                                                url:
                                                    mModelCustomProducts[index].imageUrl.toString(),
                                                width: double.infinity,
                                                height: 250,
                                                mFit: BoxFit.contain,
                                              ),
                                              Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: _favIconColor1,
                                                        // borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      child: IconButton(
                                                          splashColor: Colors.transparent,
                                                          highlightColor: Colors.transparent,
                                                          icon: _favIconColor == Colors.red
                                                              ? Icon(
                                                                  Icons.favorite,
                                                                  color: _favIconColor,
                                                                  size: 18,
                                                                )
                                                              : Icon(
                                                                  Icons.favorite_outline,
                                                                  color: _favIconColor,
                                                                  size: 18,
                                                                ),
                                                          onPressed: () {
                                                            // selectedImage = index;

                                                            setState(() {
                                                              // selectedImage = index;
                                                              if (_favIconColor ==
                                                                  Colors.grey[500]) {
                                                                _favIconColor = Colors.red;
                                                                _favIconColor1 = Colors.red[100]!;
                                                              } else {
                                                                _favIconColor = Colors.grey[500]!;
                                                                _favIconColor1 = Colors.grey[100]!;
                                                              }
                                                            });
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                            const Divider(),

                                            Flexible(
                                                child: Padding(
                                              padding: const EdgeInsets.only(left: 8, top: 0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Style# ${mModelCustomProducts[index].sku.toString()}\n${mModelCustomProducts[index].metaltype.toString()}\t${mModelCustomProducts[index].metalcolor.toString()} Gold \n${mModelCustomProducts[index].totalweight.toString()}  ${mModelCustomProducts[index].quailty.toString()}',
                                                    //Titels[index],
                                                    softWrap: true,
                                                    maxLines: 7,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 16, fontWeight: FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            )),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8, top: 0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '\$${double.parse(mModelCustomProducts[index].finalprice.toString()).toStringAsFixed(2)}',
                                                        // Price[index],
                                                        style: GoogleFonts.raleway(
                                                          textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      /* Text(
                                                        "\$2",
                                                        style: GoogleFonts.aclonica(
                                                          textStyle: const TextStyle(
                                                              color: Colors.black54,
                                                              decoration: TextDecoration.lineThrough,
                                                              fontSize: 14),
                                                        ),
                                                      ),*/
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        mModelCustomProducts[index]
                                                                    .isInStock
                                                                    .toString() ==
                                                                '1'
                                                            ? 'In Stock'
                                                            : '',
                                                        // stock[index],
                                                        style: GoogleFonts.aclonica(
                                                          textStyle: const TextStyle(
                                                              color: Colors.cyan,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 11),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: mModelCustomProducts[index].isCart !=
                                                                    null &&
                                                                mModelCustomProducts[index].isCart!
                                                            ? const Icon(
                                                                Icons.add_shopping_cart,
                                                                size: 20,
                                                                color: const Color(0xff5FC2BF),
                                                              )
                                                            : const Icon(
                                                                Icons.add_shopping_cart,
                                                                size: 20,
                                                              ),
                                                        onPressed: mModelCustomProducts[index]
                                                                    .isInStock ==
                                                                '1'
                                                            ? () {
                                                                if (mModelCustomProducts[index]
                                                                            .isCart !=
                                                                        null &&
                                                                    mModelCustomProducts[index]
                                                                        .isCart!) {
                                                                  DbProvider().deleteCart(
                                                                      mModelCustomProducts[index]
                                                                          .entityId
                                                                          .toString(),
                                                                      false,
                                                                      context);
                                                                  isCart();
                                                                } else {
                                                                  var data =
                                                                      mModelCustomProducts[index];
                                                                  data.qty = 1;
                                                                  DbProvider().addCart(
                                                                      jsonEncode(data),
                                                                      false,
                                                                      context);
                                                                }
                                                                isCart();
                                                              }
                                                            : null,
                                                      )

                                                      // icon: Icon(
                                                      //   Icons.add_shopping_cart,size: 15,
                                                      //   // color: ,
                                                      // ),
                                                      // onPressed: () {
                                                      // }
                                                      // Spacer(),

                                                      // Align(
                                                      //   alignment: Alignment.bottomLeft,
                                                      //   child: Padding(
                                                      //     padding: const EdgeInsets.only(left: 8),
                                                      //     child: IconButton(
                                                      //         icon: Icon(
                                                      //           Icons.add_shopping_cart,size: 15,
                                                      //           // color: ,
                                                      //         ),
                                                      //         onPressed: () {
                                                      //         }),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsets.only(left: 8,top:0),
                                            //   child: Row(
                                            //     children: [
                                            //       Text(
                                            //         stock[index],
                                            //         style: GoogleFonts.aclonica(
                                            //           textStyle: TextStyle(
                                            //               color: Colors.green,
                                            //               fontWeight: FontWeight.w300,
                                            //               fontSize: 10),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  // shadowColor: Colors.black,
                                );
                              }),
                        ),
                      ),
                      Visibility(
                        visible: isLoading && page != 1,
                        child: SizedBox(
                          height: 73,
                          width: 100,
                          // child: Text("NO data Found")
                          child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json'),
                        ),
                      )
                    ],
                  ),
          )
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: page > 1 ? loadPreviousPage : null,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                ),
              ),
              Text("$page / $totalPages"),
              IconButton(
                onPressed: page < totalPages ? loadNextPage : null,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                ),
              ),
            ],
          ),*/
        ],
      ),
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0xff5FC2BF).withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.asset(mModelCustomProducts[index].imageUrl.toString(), fit: BoxFit.contain),
      ),
    );
  }
}

class MyData {
  String? linPink;
  String? Price;
  String? Titels;
  String? stock;

  MyData({required this.linPink, required this.Price, required this.Titels, required this.stock});
}
