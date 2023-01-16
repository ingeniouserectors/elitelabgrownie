import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Details/alsolike.dart';
import 'package:ecom/Details/DetailPage_image.dart';
import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/model/model_cart_products.dart';
import 'package:ecom/core/view/bottom_cart_view.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quantity_input/quantity_input.dart';
import '../HomePage_Button/model/model_custom_products.dart';
import '../Main_Page/Cart.dart';
import '../Main_Page/catagory.dart';
import '../Main_Page/order.dart';

class DetailPage extends StatefulWidget {
  final ModelCustomProducts mModelCustomProducts;
  const DetailPage({Key? key, required this.mModelCustomProducts}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> linPink = [];

  int currentTab = 3;
  bool addedCart = false;

  /// Widget currentScreen = DetailPage();
  final PageStorageBucket bucket = PageStorageBucket();

  int simpleIntInput = 1;
  int steppedIntInput = 1;
  // double simpleDoubleInput = 1;
  // double steppedDoubleInput = 1;
  var size, height, width;

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  void init() {
    if (widget.mModelCustomProducts.videos != null &&
        widget.mModelCustomProducts.videos!.isNotEmpty) {
      linPink = widget.mModelCustomProducts.videos!;
    }
    linPink.addAll(widget.mModelCustomProducts.images!);
    /*linPink.add('https://deyup.com/640.mp4');
    linPink.add('https://deyup.com/650.mp4');
    linPink.add('https://deyup.com/640.mp4');*/
    isCart();
    setState(() {});
  }

  List<Widget> _demo = [
    Container(
      child: Image.asset(
        "assets/Jewellery/image_2022_12_24T18_43_37_654Z.png",
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    ),
    Container(
      child: Image.asset(
        "assets/Jewellery/image_2022_12_24T18_43_37_656Z.png",
        fit: BoxFit.contain,
        width: double.infinity,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[700],
              child: const ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                });
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Category(),
                            ));
                        // currentScreen = Category();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/first.png"),
                          color: currentTab == 0 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Order(),
                            ));
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: currentTab == 1 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cart(),
                            ));
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/cart.png"),
                          color: currentTab == 4 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ));
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/profile.png"),
                          color: currentTab == 5 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      backgroundColor: Colors.white,
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartResponse) {
            isCart();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  child:
                  Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: TopCategories(),
                      )
                  ),
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          ProductImages(
                            mLink: linPink,
                          ),
                          // Divider(
                          //   height: 3,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, left: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: Text(
                                          widget.mModelCustomProducts.name!,
                                          style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                                          child: Text(
                                            "\$${double.parse(widget.mModelCustomProducts.finalprice).toStringAsFixed(2)}",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.raleway(
                                              textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 0),
                                            child: Text(
                                              "SKU: ",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: Text(
                                              widget.mModelCustomProducts.sku!,
                                              style: const TextStyle(
                                                  color: Color(0xff67C4BE),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 20, top: 5),
                                            child: Text(
                                              "Availability: ",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 20, top: 5),
                                            child: Text(
                                              widget.mModelCustomProducts.isInStock == '1'
                                                  ? "In stock"
                                                  : 'Out of stock',
                                              style: const TextStyle(
                                                  color: Color(0xff67C4BE),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(right: 247),
                                              child: Text(
                                                'Select the quantity',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),

                                            // Padding(
                                            //   padding: EdgeInsets.only(right: 10),
                                            QuantityInput(
                                                buttonColor: Colors.white,
                                                iconColor: Colors.cyan,
                                                label: '',
                                                value: simpleIntInput,
                                                onChanged: (value) => setState(() =>
                                                    simpleIntInput =
                                                        int.parse(value.replaceAll(',', '')))),
                                            // ),
                                          ],
                                        ),
                                      ),

                                      // Quntity(),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 5,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                height: 40,
                                                width: width / 2.12,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xff5FC2BF),
                                                  borderRadius: BorderRadius.circular(3.5),
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  "Buy Now ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400),
                                                )),
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            GestureDetector(
                                              onTap: widget.mModelCustomProducts.isInStock == '1'
                                                  ? () {
                                                      if (addedCart) {
                                                        DbProvider().deleteCart(
                                                            widget.mModelCustomProducts.entityId
                                                                .toString(),
                                                            false,
                                                            context);
                                                      } else {
                                                        var data = widget.mModelCustomProducts;
                                                        data.qty = simpleIntInput;
                                                        DbProvider().addCart(
                                                            jsonEncode(data), false, context);
                                                      }
                                                      isCart();
                                                    }
                                                  : null,
                                              child: Container(
                                                height: 40,
                                                width: width / 2.12,
                                                decoration: BoxDecoration(
                                                  color: const Color(0XFFF1F2F3),
                                                  borderRadius: BorderRadius.circular(3.5),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  addedCart ? 'Remove Cart' : "ADD TO CART",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.w400),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0XFFF1F2F3),
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  title: const Text(
                                    "DESCRIPTION",
                                    style: (TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                  ),
                                  children: [
                                    Container(
                                      width: Get.width,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15, left: 25, right: 5),
                                        child: Text(
                                          '\u25CF Finish Level: ${widget.mModelCustomProducts.level!}\n'
                                          '\u25CF Metal Type: ${widget.mModelCustomProducts.metaltype!}\n'
                                          '\u25CF Metal Color: ${widget.mModelCustomProducts.metalcolor!}\n'
                                          '\u25CF Diamond Quality: ${widget.mModelCustomProducts.quailty!}\n'
                                          '\u25CF Total Weight: ${widget.mModelCustomProducts.totalweight!}\n',
                                          style: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w400,
                                              height: 1.50,
                                              color: Color(0xff526d7c)),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0XFFF1F2F3),
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Theme(
                                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  title: const Text(
                                    "CATEGORIES",
                                    style: (TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                  ),
                                  children: [
                                    Container(
                                      width: Get.width,
                                      height: 50,
                                      color: Colors.white,
                                      padding: const EdgeInsets.only(top: 10, left: 15),
                                      child: Text(
                                        widget.mModelCustomProducts.categoryvalue!,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          height: 1.50,
                                          color: Color(0xff526d7c),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0XFFF1F2F3),
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: ExpansionTile(
                                title: const Text(
                                  "TAGS",
                                  style:
                                      (TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                ),
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 10, left: 15, bottom: 15),
                                    width: Get.width,
                                    color: Colors.white,
                                    child: const Text(
                                      "FEATURE ",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        height: 1.50,
                                        color: Color(0xff526d7c),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 15),
                            child: Row(
                              children: [
                                const Text(
                                  "You might also like",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                      // fontStyle: FontStyle.italic,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: 500,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                              child: HorizontalListPage(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Spacer(),
              ],
            ),
            const BottomCartView()
          ],
        ),
      ),
    );
  }

  isCart() {
    if (DbProvider().getCart().isNotEmpty) {
      bool cart = false;
      for (int i = 0; i < DbProvider().getCart().length; i++) {
        if (DbProvider().getCart()[i].entityId != null &&
            DbProvider().getCart()[i].entityId.toString() == widget.mModelCustomProducts.entityId) {
          simpleIntInput = DbProvider().getCart()[i].qty ?? 1;
          cart = true;
          break;
        }
      }
      setState(() {
        addedCart = cart;
      });
    } else {
      setState(() {
        addedCart = false;
      });
    }
  }
}

class ImageDialog extends StatelessWidget {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Dialog(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/Jewellery/image_2022_12_24T18_43_37_654Z.png'),
                fit: BoxFit.contain)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class Quntity extends StatefulWidget {
//   const Quntity({Key? key}) : super(key: key);
//
//   @override
//   State<Quntity> createState() => _QuntityState();
// }
//
// class _QuntityState extends State<Quntity> {
//
//   int simpleIntInput = 1;
//   int steppedIntInput = 1;
//   @override
//   Widget build(BuildContext context) {
//     return    Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 300),
//           Text(
//             'Select the quantity',
//             style: TextStyle(fontSize: 16),
//           ),
//           // ),
//
//
//           // Padding(
//           //   padding: EdgeInsets.only(right: 10),
//           QuantityInput(
//               buttonColor: Color(0xffEBFAF9),
//               iconColor: Colors.cyan,
//
//
//               label: '',
//               value: simpleIntInput,
//               onChanged: (value) => setState(() =>
//               simpleIntInput =
//                   int.parse(value.replaceAll(',', '')))),
//           // ),
//         ],
//       ),
//     );
//   }
// }
