import 'dart:convert';

import 'package:ecom/Details/alsolike.dart';
import 'package:ecom/checkout/checkout_view.dart';
import 'package:ecom/core/model/model_cart_products.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Main_Page/order.dart';
import 'demo/view/widget_cart.dart';
import 'horizontal_list.dart';

class cartui extends StatefulWidget {
  const cartui({Key? key}) : super(key: key);

  @override
  State<cartui> createState() => _cartuiState();
}

class _cartuiState extends State<cartui> {
  Widget currentScreen = const cartui();
  final PageStorageBucket bucket = PageStorageBucket();

  List<String> linPink = [
    'https://www.overnightmountings.com/media/catalog/product/cache/1/thumbnail/250x250/9df78eab33525d08d6e5fb8d27136e95/5/0/50354-E_1.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/thumbnail/250x250/9df78eab33525d08d6e5fb8d27136e95/5/0/50354-E_1.jpg',
    'https://www.overnightmountings.com/media/catalog/product/cache/1/thumbnail/250x250/9df78eab33525d08d6e5fb8d27136e95/5/0/50354-E_1.jpg',
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
    isCart();
    _controller = TextEditingController();
  }

  List<ModelCartProducts> mModelCartProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Divider(
                height: 3,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: mModelCartProducts.isNotEmpty
                        ? ListTile(
                            leading: Text(
                              "TOTAL  ${mModelCartProducts.length} items",
                              style: const TextStyle(color: Colors.cyan),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                DbProvider().clearCart(context);
                                isCart();
                              },
                              child: const Text(
                                "CLEAR CART",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              mModelCartProducts.isEmpty? SizedBox(): const Divider(),
              Expanded(
                child:  mModelCartProducts.isEmpty? Container(child: Text('Empty Cart'),alignment: Alignment.center,): SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                       ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mModelCartProducts.length,
                          itemBuilder: (context, index) {
                            return WidgetCart(deleteCart: (){
                              DbProvider().deleteCart(
                                  mModelCartProducts[index].isDiamond!
                                      ? mModelCartProducts[index]
                                      .diamonddetailsId
                                      .toString()
                                      : mModelCartProducts[index].entityId.toString(),
                                  mModelCartProducts[index].isDiamond!,
                                  context);
                              setState(() {
                                mModelCartProducts.removeAt(index);
                              });
                            }, mModelCartProducts: mModelCartProducts[index], updateQTY: (qty ) {
                              mModelCartProducts[index].qty=qty;
                              var data =mModelCartProducts[index];
                              setState(() {
                                data.qty=qty;
                                DbProvider().addCart(
                                    jsonEncode(data), false, context);
                              });
                            },);
                          },
                        ),
                        SizedBox(
                          height: 50,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 590,
                                  color: Colors.white,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Coupon Code',
                                      prefixIcon: Icon(Icons.search, color: Colors.cyan, size: 20),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 150,
                                  child: TextButton.icon(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(color: Colors.white),
                                      backgroundColor: Colors.grey[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    onPressed: () => {},
                                    icon: const Icon(Icons.verified, color: Colors.cyan, size: 25),
                                    label: const Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.cyan, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

//
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                            bottom: 0,
                          ),
                          child: Container(
                            color: Colors.grey[100],
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  color: Colors.grey[100],
                                  child: ListTile(
                                    leading:
                                        Text("Products", style: TextStyle(color: Colors.grey[600])),
                                    trailing: Text("x${getQty()}", style: TextStyle(color: Colors.grey[600])),
                                  ),
                                ),
                                ListTile(
                                  leading: Text(
                                    "Total:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey[650],
                                        fontWeight: FontWeight.w400),
                                  ),
                                  trailing: Text(getCartPrice(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[650],
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 25),
                          child: Row(
                            children: [
                              Text(
                                "My Like list",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                  color: Colors.grey[900],
                                  fontFamily: "raleway",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                )),
                              ),
// style: TextStyle(
//     fontSize: 22.0,
//     fontWeight: FontWeight.w100,
//     // fontStyle: FontStyle.italic,
//     color: Colors.black),),

                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Order(),
                                      ));
                                },
                                child: const Text(
                                  "see all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
// fontStyle: FontStyle.italic,
                                      color: Colors.cyan),
                                ),
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
            ],
          ),
          Visibility(
            visible:  mModelCartProducts.isNotEmpty,
            child: Positioned(
              bottom: 50,
              left: 310,
              // width: MediaQuery.of(context).size.width,
              child: Container(
                height: 70,
                width: 200,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onPressed: () => {
                    Get.to(CheckoutView())
                  },
                  icon: const Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'CHECKOUT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  isCart() {
    if (DbProvider().getCart().isNotEmpty) {
      setState(() {
        mModelCartProducts = DbProvider().getCart();
      });
    } else {
      setState(() {
        mModelCartProducts = [];
      });
    }
  }

  String getCartPrice() {
    if (mModelCartProducts.isNotEmpty) {
      double price = 0;
      for (int i = 0; i < mModelCartProducts.length; i++) {
        if (mModelCartProducts[i].isDiamond!) {
          price = price + double.parse(mModelCartProducts[i].markupprice!);
        } else {
          price = (price +
              double.parse(mModelCartProducts[i].finalprice!) * mModelCartProducts[i].qty!);
        }
      }
      return "\$${price.toStringAsFixed(2)}";
    } else {
      return "\$00.00";
    }
  }

  String getQty() {
    if (mModelCartProducts.isNotEmpty) {
      int qty = 0;
      for (int i = 0; i < mModelCartProducts.length; i++) {
        if (mModelCartProducts[i].isDiamond!) {
          qty=qty+1;
        } else {
          qty=qty+ mModelCartProducts[i].qty!;
        }
      }
      return qty.toString();
    } else {
      return '0';
    }
  }
}
