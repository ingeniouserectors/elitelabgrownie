import 'dart:math';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Head_footer/drawer.dart';


import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:flutter/cupertino.dart';
import 'Main_Page/order.dart';

class Totalearnpage extends StatefulWidget {
  Totalearnpage({Key? key}) : super(key: key);
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<Totalearnpage> {
  late List<DatatableHeader> _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 100;
  List<bool>? _expanded;
  String? _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  // ignore: unused_field
  String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;
  var random = new Random();

  List<Map<String, dynamic>> _generateData({int n: 100}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;
    print(i);
    // ignore: unused_local_variable
    for (var data in source) {
      temps.add({
        "id": "$i",
        "Certificate": "AP",
        "Lot#":  "B101272$i",
        "Shape": "Round",
        "Carat": "0.0$i",
        "Clarity": "FL",
        "Color": "F",
        "Cut": "Very Good",
        "Report": "${i}0",
        "Link": "5",
        "Price/CT": "\$20.00",
        "Est. Price": "\$20.00"
      });
      i++;
    }
    return temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 3)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData(n: random.nextInt(10000)));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start: 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
    _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    /// set headers
    _headers = [
      DatatableHeader(
          text: "Lot#",
          value: "Lot#",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Shape",
          value: "Shape",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Carat",
          value: "Carat",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Clarity",
          value: "Clarity",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Color",
          value: "Color",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Cut",
          value: "Cut",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Link",
          value: "Link",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Price/CT",
          value: "Price/CT",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
          text: "Est. Price",
          value: "Est. Price",
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }



  int currentTab = 3;
  Widget currentScreen = Totalearnpage();
  final PageStorageBucket bucket = PageStorageBucket();


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[700],
              child: ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));

              });}),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
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
                          AssetImage("assets/images/Bottom/first.png"),
                          color: currentTab == 0
                              ? Colors.blueAccent[700]
                              : Colors.grey,
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
                              builder: (context) => Order(),
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
                          color: currentTab == 1
                              ? Colors.blueAccent[700]
                              : Colors.grey,
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
                              builder: (context) => Cart(),
                            ));
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/cart.png"),
                          color: currentTab == 4
                              ? Colors.blueAccent[700]
                              : Colors.grey,
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
                              builder: (context) => Profile(),
                            ));
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Bottom/profile.png"),
                          color: currentTab == 5
                              ? Colors.blueAccent[700]
                              : Colors.grey,
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

      backgroundColor:Colors.white,
      drawer: Drawer(child: drawer(),),
      appBar: customappbar(),
      body:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
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
                Divider(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(left: 20,top:8,bottom: 8),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 700,
                                      child: Center(
                                        child: ListView(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 14),
                                                        child: Center(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color:
                                                              Colors.black12,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                            ),
                                                            height: 10,
                                                            width: 80,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // Row(
                                                  //   children: [
                                                  //     Text(
                                                  //       "Layouts",
                                                  //       style: TextStyle(
                                                  //           fontSize: 25),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  // // Divider(),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //   MainAxisAlignment
                                                  //       .spaceBetween,
                                                  //   crossAxisAlignment:
                                                  //   CrossAxisAlignment.center,
                                                  //   children: [
                                                  //     Row(
                                                  //       mainAxisAlignment:
                                                  //       MainAxisAlignment
                                                  //           .spaceBetween,
                                                  //       crossAxisAlignment:
                                                  //       CrossAxisAlignment
                                                  //           .center,
                                                  //       children: [
                                                  //         Padding(
                                                  //           padding:
                                                  //           const EdgeInsets
                                                  //               .only(
                                                  //               top: 8,
                                                  //               left: 16,
                                                  //               right: 16,
                                                  //               bottom: 8),
                                                  //           child: Container(
                                                  //             decoration:
                                                  //             BoxDecoration(
                                                  //               color: Color(
                                                  //                   0xffEBEBEB),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   10),
                                                  //             ),
                                                  //             child: Padding(
                                                  //               padding:
                                                  //               const EdgeInsets
                                                  //                   .all(
                                                  //                   15.0),
                                                  //               child:
                                                  //               Image.asset(
                                                  //                 "assets/Filter/grid1.png",
                                                  //                 height: 65,
                                                  //                 width: 65,
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Padding(
                                                  //           padding:
                                                  //           const EdgeInsets
                                                  //               .only(
                                                  //               top: 8,
                                                  //               left: 16,
                                                  //               right: 16,
                                                  //               bottom: 8),
                                                  //           child: Container(
                                                  //             decoration:
                                                  //             BoxDecoration(
                                                  //               color: Color(
                                                  //                   0xffEBEBEB),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   10),
                                                  //             ),
                                                  //             child: Padding(
                                                  //               padding:
                                                  //               const EdgeInsets
                                                  //                   .all(
                                                  //                   15.0),
                                                  //               child:
                                                  //               Image.asset(
                                                  //                 "assets/Filter/grid2.png",
                                                  //                 height: 65,
                                                  //                 width: 65,
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Padding(
                                                  //           padding:
                                                  //           const EdgeInsets
                                                  //               .only(
                                                  //               top: 8,
                                                  //               left: 16,
                                                  //               right: 16,
                                                  //               bottom: 8),
                                                  //           child: Container(
                                                  //             decoration:
                                                  //             BoxDecoration(
                                                  //               color: Color(
                                                  //                   0xffEBEBEB),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   10),
                                                  //             ),
                                                  //             child: Padding(
                                                  //               padding:
                                                  //               const EdgeInsets
                                                  //                   .all(
                                                  //                   15.0),
                                                  //               child:
                                                  //               Image.asset(
                                                  //                 "assets/Filter/grid3.png",
                                                  //                 height: 65,
                                                  //                 width: 65,
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Padding(
                                                  //           padding:
                                                  //           const EdgeInsets
                                                  //               .only(
                                                  //               top: 8,
                                                  //               left: 16,
                                                  //               right: 16,
                                                  //               bottom: 8),
                                                  //           child: Container(
                                                  //             decoration:
                                                  //             BoxDecoration(
                                                  //               color: Color(
                                                  //                   0xffEBEBEB),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   10),
                                                  //             ),
                                                  //             child: Padding(
                                                  //               padding:
                                                  //               const EdgeInsets
                                                  //                   .all(
                                                  //                   15.0),
                                                  //               child:
                                                  //               Image.asset(
                                                  //                 "assets/Filter/grid5.png",
                                                  //                 height: 65,
                                                  //                 width: 65,
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //         Padding(
                                                  //           padding:
                                                  //           const EdgeInsets
                                                  //               .only(
                                                  //               top: 8,
                                                  //               left: 16,
                                                  //               right: 16,
                                                  //               bottom: 8),
                                                  //           child: Container(
                                                  //             decoration:
                                                  //             BoxDecoration(
                                                  //               color: Color(
                                                  //                   0xffEBEBEB),
                                                  //               borderRadius:
                                                  //               BorderRadius
                                                  //                   .circular(
                                                  //                   10),
                                                  //             ),
                                                  //             child: Padding(
                                                  //               padding:
                                                  //               const EdgeInsets
                                                  //                   .all(
                                                  //                   15.0),
                                                  //               child:
                                                  //               Image.asset(
                                                  //                 "assets/Filter/grid1.png",
                                                  //                 height: 65,
                                                  //                 width: 65,
                                                  //               ),
                                                  //             ),
                                                  //           ),
                                                  //         ),
                                                  //       ],
                                                  //     )
                                                  //   ],
                                                  // ),
                                                  // Divider(),

                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  ExpansionTile(
                                                      initiallyExpanded: true,

                                                      title: Text(
                                                        "Sort by",
                                                        style: TextStyle(
                                                            fontSize: 25),
                                                      ),
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 0,
                                                              bottom: 4,
                                                              left: 11,
                                                              right: 11),
                                                          child: Row(

                                                            children: [
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Date : Latest",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 7),
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Date : Oldest",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 0,
                                                              bottom: 4,
                                                              left: 11,
                                                              right: 11),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Price : Low to High",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 7),
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Price : High to Low",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 0,
                                                              bottom: 4,
                                                              left: 11,
                                                              right: 11),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Title : A to Z",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 7),
                                                              Expanded(
                                                                child:
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                  Container(
                                                                    height: 55,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0xffEBEBEB),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(5),
                                                                    ),
                                                                    child: Center(
                                                                        child:
                                                                        Text(
                                                                          "Title : Z to A",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            18,
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]),

                                                  ExpansionTile(
                                                      initiallyExpanded: true,

                                                      title: Text(
                                                        "By Price",
                                                        style: TextStyle(
                                                            fontSize: 22),
                                                      ),
                                                      children: [
                                                        Container(
                                                          // margin: EdgeInsets.all(1.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              RangeSliderItem(
                                                                title: '',
                                                                initialMinValue:
                                                                20,
                                                                initialMaxValue:
                                                                80,
                                                                onMinValueChanged:
                                                                    (v) {},
                                                                onMaxValueChanged:
                                                                    (v) {},
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:0),
                                    child: Icon(Icons.filter_list),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 440,top: 0),
                                    child: Text(
                                      "Points & Reward Filter",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20,),
                                    // child: TextButton(
                                    // style: ButtonStyle(
                                    //   backgroundColor:
                                    //       MaterialStateProperty.all(Colors.white),
                                    // ),
                                    child: Icon(
                                      Icons.expand_more,
                                      color: Colors.black,
                                    ),

                                  ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            margin: EdgeInsets.all(11),
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(
                              maxHeight: 800,
                            ),
                            child: Card(
                              elevation: 0,
                              shadowColor: Colors.black,
                              clipBehavior: Clip.none,
                              child: ResponsiveDatatable(
                                reponseScreenSizes: [ScreenSize.xs],
                                headers: _headers,
                                source: _source,
                                selecteds: _selecteds,
                                showSelect: _showSelect,
                                autoHeight: false,
                                dropContainer: (data) {
                                  if (int.tryParse(data['id'].toString())!.isEven) {
                                    return Text("is Even");
                                  }
                                  return _DropDownContainer(data: data);
                                },
                                onChangedRow: (value, header) {
                                  /// print(value);
                                  /// print(header);
                                },
                                onSubmittedRow: (value, header) {
                                  /// print(value);
                                  /// print(header);
                                },
                                onTabRow: (data) {
                                  print(data);
                                },
                                onSort: (value) {
                                  setState(() => _isLoading = true);

                                  setState(() {
                                    _sortColumn = value;
                                    _sortAscending = !_sortAscending;
                                    if (_sortAscending) {
                                      _sourceFiltered.sort((a, b) =>
                                          b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                                    } else {
                                      _sourceFiltered.sort((a, b) =>
                                          a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                                    }
                                    var _rangeTop = _currentPerPage! < _sourceFiltered.length
                                        ? _currentPerPage!
                                        : _sourceFiltered.length;
                                    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                                    _searchKey = value;

                                    _isLoading = false;
                                  });
                                },
                                expanded: _expanded,
                                sortAscending: _sortAscending,
                                sortColumn: _sortColumn,
                                isLoading: _isLoading,
                                onSelect: (value, item) {
                                  print("$value  $item ");
                                  if (value!) {
                                    setState(() => _selecteds.add(item));
                                  } else {
                                    setState(
                                            () => _selecteds.removeAt(_selecteds.indexOf(item)));
                                  }
                                },
                                onSelectAll: (value) {
                                  if (value!) {
                                    setState(() => _selecteds =
                                        _source.map((entry) => entry).toList().cast());
                                  } else {
                                    setState(() => _selecteds.clear());
                                  }
                                },
                                footers: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text("Rows per page:"),
                                  ),
                                  if (_perPages.isNotEmpty)
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: DropdownButton<int>(
                                        value: _currentPerPage,
                                        items: _perPages
                                            .map((e) => DropdownMenuItem<int>(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                            .toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            _currentPerPage = value;
                                            _currentPage = 1;
                                            _resetData();
                                          });
                                        },
                                        isExpanded: false,
                                      ),
                                    ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child:
                                    Text("$_currentPage - $_currentPerPage of $_total"),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 16,
                                    ),
                                    onPressed: _currentPage == 1
                                        ? null
                                        : () {
                                      var _nextSet = _currentPage - _currentPerPage!;
                                      setState(() {
                                        _currentPage = _nextSet > 1 ? _nextSet : 1;
                                        _resetData(start: _currentPage - 1);
                                      });
                                    },
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward_ios, size: 16),
                                    onPressed: _currentPage + _currentPerPage! - 1 > _total
                                        ? null
                                        : () {
                                      var _nextSet = _currentPage + _currentPerPage!;

                                      setState(() {
                                        _currentPage = _nextSet < _total
                                            ? _nextSet
                                            : _total - _currentPerPage!;
                                        _resetData(start: _nextSet - 1);
                                      });
                                    },
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                  )
                                ],
                                headerDecoration: BoxDecoration(
                                    color: Color(0xff505050),
                                    border: Border(
                                      // bottom: BorderSide(color: Colors.red, width: 1)
                                    )),
                                selectedDecoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(color: Colors.green[300]!, width: 1)),
                                  color: Colors.green,
                                ),
                                headerTextStyle: TextStyle(color: Colors.white),
                                rowTextStyle: TextStyle(color: Colors.black),
                                selectedTextStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

              ]),
    );

  }
  RangeValues rangeValue = RangeValues(0.0, 300);
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      /// height: 100,
      child: Column(
        /// children: [
        ///   Expanded(
        ///       child: Container(
        ///     color: Colors.red,
        ///     height: 50,
        ///   )),
        /// ],
        children: _children,
      ),
    );

  }
}
