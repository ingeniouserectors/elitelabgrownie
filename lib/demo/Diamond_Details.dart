import 'dart:convert';

import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Details/alsolike.dart';
import 'package:ecom/Details/Diamond_DetailPage_image.dart';
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

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../Api/Apiclass.dart';
import '../Main_Page/Cart.dart';
import '../Main_Page/catagory.dart';
import '../Main_Page/order.dart';
import '../bottom_navigation.dart';

class DetailPage1 extends StatefulWidget {
  final String mLot;
  const DetailPage1({Key? key, required this.mLot}) : super(key: key);

  @override
  State<DetailPage1> createState() => _DetailPage1State();
}

class _DetailPage1State extends State<DetailPage1> {
  List<String> linPink = [
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
  ];


  DaimondList mDaimondList = DaimondList();
  final PageStorageBucket bucket = PageStorageBucket();

  bool _isLoading = true;
  bool addedCart = false;
  int simpleIntInput = 1;
  int steppedIntInput = 1;
  // double simpleDoubleInput = 1;
  // double steppedDoubleInput = 1;
  var size, height, width;

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
  void initState() {
    getDaimondData();
    super.initState();
  }

  List<String> mFile = [];
  void getDaimondData() async {
    var headers = {
      "Accept": "application/json",
      "consumerKey": "bbae36baea2ef8dcd1f9a8a88cc59f06",
      "consumerSecret": "5edc426ec2965bba17c96e766c47ad73",
      "oauth_token": "819dc5826cd08cca9c57d392ba2b305e",
      "oauth_token_secret": "97565ea77d5c8c8f7c63b8f5f3916656",
    };
    setState(() {
      _isLoading = true;
    });
    var url = 'https://www.overnightmountings.com/api/rest/labgrowndiamond/${widget.mLot}';
    var response = await http.get(Uri.parse(url), headers: headers);

    mDaimondList = DaimondList.fromJson(jsonDecode(response.body));

    if (mDaimondList.imagelink!.isNotEmpty) {
      mFile.add(mDaimondList.imagelink!);
    }

    // if (mDaimondList.videolink!.isNotEmpty) {
    //   mFile.add(mDaimondList.videolink!);
    // }

    if (mDaimondList.htmllink!.isNotEmpty) {
      mFile.add(mDaimondList.htmllink!);
    }

    if (mDaimondList.certificateimage!.isNotEmpty) {
      mFile.add(mDaimondList.certificateimage!);
    }

    isCart();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
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
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: TopCategories(),
                      )),
                ),
                const Divider(),
                mDaimondList.lot != null
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                DaimondProductImages(
                                  mFile: mFile,
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
                                            /*GestureDetector(
                                        child: const Text(
                                          'Lab Grown Diamond',

                                          ///mDaimondList.diamonddetailsId!,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),*/
                                            GestureDetector(
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 13, bottom: 13),
                                                child: Text(
                                                  "\$${double.parse(mDaimondList.markupprice!).toStringAsFixed(2)} Per Stone",
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
                                                    "Lot: ",
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
                                                    mDaimondList.lot!,
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
                                                const Padding(
                                                  padding: EdgeInsets.only(bottom: 20, top: 5),
                                                  child: Text(
                                                    "In stock",
                                                    style: TextStyle(
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
                                            // Container(
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            //     children: [
                                            //       // Padding(
                                            //       //   padding: const EdgeInsets.only(right: 247),
                                            //       //   child: Text(
                                            //       //     'Select the quantity',
                                            //       //     style: TextStyle(fontSize: 16),
                                            //       //   ),
                                            //       // ),
                                            //
                                            //       // Padding(
                                            //       //   padding: EdgeInsets.only(right: 10),
                                            //       QuantityInput(
                                            //           buttonColor: Colors.white,
                                            //
                                            //           iconColor: Colors.cyan,
                                            //           label: '',
                                            //           value: simpleIntInput,
                                            //           onChanged: (value) => setState(
                                            //                   () => simpleIntInput = int.parse(value.replaceAll(',', '')))),
                                            //       // ),
                                            //     ],
                                            //   ),
                                            // ),

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
                                                    onTap: () {
                                                      if (addedCart) {
                                                        DbProvider().deleteCart(
                                                            mDaimondList.diamonddetailsId
                                                                .toString(),
                                                            true,
                                                            context);
                                                      } else {
                                                        DbProvider().addCart(
                                                            jsonEncode(mDaimondList),
                                                            true,
                                                            context);
                                                      }
                                                      isCart();
                                                    },
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
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Container(
                                    color: const Color(0XFFF1F2F3),
                                    child: ExpansionTile(
                                      initiallyExpanded: true,
                                      title: const Text(
                                        "DESCRIPTION",
                                        style: (TextStyle(color: Colors.black)),
                                      ),
                                      children: [
                                        Container(
                                            width: Get.width,
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0, bottom: 15, left: 25, right: 5),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 21.0),
                                                        child: Text(
                                                          '\u25CF  Lot #: ${(mDaimondList.lot == "") ? 'N/A' : mDaimondList.lot!}\n'
                                                          '\u25CF  Shape: ${(mDaimondList.shape == "") ? 'N/A' : mDaimondList.shape!}\n'
                                                          '\u25CF  Measurement: ${(mDaimondList.length == "") ? 'N/A' : double.parse(mDaimondList.length!!).toStringAsFixed(2)}(L) X ${(mDaimondList.width == "") ? 'N/A' : double.parse(mDaimondList.width!).toStringAsFixed(2)}(W) X ${(mDaimondList.depth == "") ? 'N/A' : double.parse(mDaimondList.depth!).toStringAsFixed(2)}(D)\n'
                                                          '\u25CF  Carat: ${(mDaimondList.weight == "") ? 'N/A' : double.parse(mDaimondList.weight!).toStringAsFixed(2)}ct\n'
                                                          '\u25CF  Clarity: ${(mDaimondList.clarity == "") ? 'N/A' : mDaimondList.clarity!}\n'
                                                          '\u25CF  Color: ${(mDaimondList.color == "") ? 'N/A' : mDaimondList.color!}\n'
                                                          '\u25CF  Cut: ${(mDaimondList.cutgrade == "") ? 'N/A' : mDaimondList.cutgrade!}\n'
                                                          '\u25CF  Report: ${(mDaimondList.lab == "") ? 'N/A' : mDaimondList.lab!}\n'
                                                          '\u25CF  Price/Carat: ${(mDaimondList.pricect == "") ? 'N/A' : getPrice(double.parse(mDaimondList.pricect!).toStringAsFixed(2), '')}\n'
                                                          '\u25CF  Price/Stone: ${(mDaimondList.markupprice == "") ? 'N/A' : getPrice(double.parse(mDaimondList.markupprice!).toStringAsFixed(2), '')}\n',
                                                          style: const TextStyle(
                                                              fontSize: 15.0,
                                                              fontWeight: FontWeight.w500,
                                                              height: 1.50,
                                                              color: Color(0xff526d7c)),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 20,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 150,
                                                      ),
                                                      Text(
                                                        '\u25CF  Certificate: ${(mDaimondList.certificate == "") ? 'N/A' : mDaimondList.certificate!}\n'
                                                        '\u25CF  Polish: ${(mDaimondList.polish == "") ? 'N/A' : mDaimondList.polish!}\n'
                                                        '\u25CF  Symmetry: ${(mDaimondList.symmetry == "") ? 'N/A' : mDaimondList.symmetry!}\n'
                                                        '\u25CF  Fluorescence: ${(mDaimondList.fluor == "") ? 'N/A' : mDaimondList.fluor!}\n'
                                                        '\u25CF  Hearts And Arrows: ${(mDaimondList.heartsandarrows == "") ? 'N/A' : mDaimondList.heartsandarrows!}\n'
                                                        '\u25CF  Depth Precentage: ${(mDaimondList.depthPrecentage == "") ? 'N/A' : double.parse(mDaimondList.depthPrecentage!).toStringAsFixed(2)}\n'
                                                        '\u25CF  Table Precentage: ${(mDaimondList.tablePrecentage == "") ? 'N/A' : double.parse(mDaimondList.tablePrecentage!).toStringAsFixed(2)}\n'
                                                        '\u25CF  Girdle: ${(mDaimondList.gridlePercentage == "") ? 'N/A' : mDaimondList.gridlePercentage!}\n'
                                                        '\u25CF  Culet: ${(mDaimondList.culet == "") ? 'N/A' : mDaimondList.culet!}\n'
                                                        '\u25CF  Origin: ${(mDaimondList.origin == "") ? 'N/A' : mDaimondList.origin!}',
                                                        style: const TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight: FontWeight.w500,
                                                            height: 1.50,
                                                            color: Color(0xff526d7c)),
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    color: const Color(0XFFF1F2F3),
                                    child: ExpansionTile(
                                      title: const Text(
                                        "CATEGORIES",
                                        style: (TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold)),
                                      ),
                                      children: [
                                        Container(
                                          width: Get.width,
                                          height: 50,
                                          color: Colors.white,
                                          padding: const EdgeInsets.only(top: 10, left: 15),
                                          child: const Text(
                                            'Lab Grown Diamond',
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
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    color: const Color(0XFFF1F2F3),
                                    child: ExpansionTile(
                                      title: const Text(
                                        "TAGS",
                                        style: (TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold)),
                                      ),
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 10, left: 15, bottom: 15),
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
                                        "Styles might fit",
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
                      )
                    : Expanded(
                        child: Container(
                            height: 100,
                            width: 100,
                            alignment: Alignment.center,
                            child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')),
                      )

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
        if (DbProvider().getCart()[i].diamonddetailsId != null &&
            DbProvider().getCart()[i].diamonddetailsId.toString() ==
                mDaimondList.diamonddetailsId.toString()) {
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

  String getPrice(String data, String value) {
    return '\$$data$value';
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
