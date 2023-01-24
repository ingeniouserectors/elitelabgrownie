// import 'dart:html';
// import 'dart:math';
// import 'package:ecom/Head_footer/appbar.dart';
// import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
// import 'package:ecom/Main_Page/HomePage.dart';
// import 'package:ecom/Main_Page/Profile.dart';
// import 'package:ecom/Main_Page/catagory.dart';
// import 'package:ecom/Main_Page/order.dart';
// import 'package:ecom/Head_footer/drawer.dart';
// import 'package:ecom/demo/demovdo.dart';

// import 'package:ecom/horizontal_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:responsive_table/responsive_table.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:syncfusion_flutter_core/theme.dart';

// import 'Main_Page/Cart.dart';
import 'dart:convert';
import 'package:ecom/bottom_navigation.dart';
import 'package:ecom/core/view/bottom_cart_view.dart';
import 'package:ecom/core/view/load_more_demo.dart';
import 'Api/Apiclass.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:math';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/order.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

// import 'demo/bottomsheet.dart';

class DataPage extends StatefulWidget {
  DataPage({Key? key}) : super(key: key);
  @override
  _DataPageState createState() => _DataPageState();
}

// extension StringCasingExtension on String {
//   String toCapitalized() =>
//       length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
//   String toTitleCase() =>
//       replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
// }

class _DataPageState extends State<DataPage> {
  List<DaimondList> daimondList = [];
  SfRangeValues _values1 = SfRangeValues(40.0, 80.0);
  SfRangeValues _values2 = SfRangeValues(20.0, 80.0);
  SfRangeValues _values3 = SfRangeValues(40.0, 80.0);
  SfRangeValues _values4 = SfRangeValues(40.0, 80.0);
  SfRangeValues _values5 = SfRangeValues(40.0, 80.0);
  late List<DatatableHeader> _headers;
  List<int> _perPages = [10, 20, 50, 100, 27966];
  int _total = 0;
  int? _currentPerPage = 100;
  List<bool>? _expanded;
  String? _searchKey = "id";
  int _currentPage = 1;
  double _value1 = 20.0;
  double _value2 = 20.0;
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

  List<Map<String, dynamic>> _generateData() {
    List<Map<String, dynamic>> temps = [];
    // ignore: unused_local_variable
    for (int i = 0; i < daimondList.length; i++) {
      var item = daimondList[i];

      double pricect = double.parse(item.pricect!);
      double markupprice = double.parse(item.markupprice!);
      double weight = double.parse(item.weight!);
      // String shape = "${(item.shape == "") ? 'N/A' : item.shape.toCapitalized()!}";
      temps.add({
        "id": "$i",
        "Certificate": item.certificate,
        "Lot#": item.lot,
        "Shape": "${item.shape!}",
        "Carat": "${weight.toStringAsFixed(2)}ct",
        "Clarity": item.clarity,
        "Color": "${item.color!}",
        "Cut": "${item.cutgrade!}",
        "Link": item.lab,
        "Report": item.lab,
        "Price/Carat": "\$${pricect.toStringAsFixed(2)}",
        "Est.Price/Stone": "\$${markupprice.toStringAsFixed(2)}"
      });
    }
    return temps;
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(Duration(seconds: 20)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData());
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() {
        _isLoading = false;
      });
    });
  }

  _resetData({start: 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen = _total - start < _currentPerPage! ? _total - start : _currentPerPage;
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
            .where((data) =>
                data[_searchKey!].toString().toLowerCase().contains(value.toString().toLowerCase()))
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
    getDaimondData();

    /// set headers
    _headers = [
      DatatableHeader(
          text: "Lot#", value: "Lot#", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Shape", value: "Shape", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Carat", value: "Carat", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Clarity",
          value: "Clarity",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Color", value: "Color", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Cut", value: "Cut", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Report", value: "Report", show: true, sortable: true, textAlign: TextAlign.center),
      DatatableHeader(
          text: "Price/Carat",
          value: "Price/Carat",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Price/Stone",
          value: "Est.Price/Stone",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget currentScreen = DataPage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: drawer(),
      ),
      appBar: customappbar(),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 0,
                ),
                child: ClipRRect(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: TopCategories(),
                      )),
                ),
              ),
              Divider(),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          bootomshett();
                        },
                        //
                        // onTap: () {
                        //   showModalBottomSheet<void>(
                        //     isScrollControlled: true,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(30),
                        //         topRight: Radius.circular(30),
                        //       ),
                        //     ),
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return Container(
                        //         height: 900,
                        //         color: Colors.white,
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
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "SHAPE",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     // Divider(),
                        //                     SingleChildScrollView(
                        //                       scrollDirection: Axis.horizontal,
                        //                       child: Row(
                        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                         crossAxisAlignment: CrossAxisAlignment.center,
                        //                         children: [
                        //                           Row(
                        //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                             crossAxisAlignment: CrossAxisAlignment.center,
                        //                             children: [
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/1.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/image_2022_12_27T15_32_38_835Z.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/image_2022_12_27T15_32_38_838Z.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/image_2022_12_27T15_32_38_841Z.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/image_2022_12_27T15_32_38_853Z.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //                               Padding(
                        //                                 padding: const EdgeInsets.only(
                        //                                     top: 8, left: 16, right: 16, bottom: 8),
                        //                                 child: Container(
                        //                                   decoration: BoxDecoration(
                        //                                     color: Color(0xffEBEBEB),
                        //                                     borderRadius: BorderRadius.circular(10),
                        //                                   ),
                        //                                   child: Padding(
                        //                                     padding: const EdgeInsets.all(15.0),
                        //                                     child: Image.asset(
                        //                                       "assets/diamond_shape/image_2022_12_27T15_32_38_856Z.png",
                        //                                       height: 65,
                        //                                       width: 65,
                        //                                     ),
                        //                                   ),
                        //                                 ),
                        //                               ),
                        //
                        //                             ],
                        //                           )
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     Divider(),
                        //
                        //                     SizedBox(
                        //                       height: 30,
                        //                     ),
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "CARAT",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     SfSlider(
                        //                       min: 0.0,
                        //                       max: 100.0,
                        //                       // interval: 20,
                        //                       showTicks: true,
                        //                       showLabels: true,
                        //                       value: _value,
                        //                       enableTooltip: true,
                        //                       // labelPlacement: LabelPlacement.betweenTicks,
                        //                       // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                        //                       //   switch (actualValue) {
                        //                       //     case 0:
                        //                       //       return '';
                        //                       //     case 20:
                        //                       //       return '';
                        //                       //     case 40:
                        //                       //       return ' GOOD';
                        //                       //     case 60:
                        //                       //       return 'FAIR';
                        //                       //     case 80:
                        //                       //       return 'NONE';
                        //                       //   }
                        //                       //   return actualValue.toString();
                        //                       // },
                        //                       onChanged: (dynamic newValue) {
                        //                         setState(() {
                        //                           _value = newValue;
                        //                         });
                        //                       },
                        //                     ),
                        //                     Row(
                        //                       children: [
                        //                         Padding(
                        //                           padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                           child: Text(
                        //                             "PRICE/STONE",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     SfSlider(
                        //                       min: 0.0,
                        //                       max: 100.0,
                        //                       // interval: 20,
                        //                       showTicks: true,
                        //                       showLabels: true,
                        //                       value: _value,
                        //                       enableTooltip: true,
                        //                       // labelPlacement: LabelPlacement.betweenTicks,
                        //                       // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                        //                       //   switch (actualValue) {
                        //                       //     case 0:
                        //                       //       return '';
                        //                       //     case 20:
                        //                       //       return '';
                        //                       //     case 40:
                        //                       //       return ' GOOD';
                        //                       //     case 60:
                        //                       //       return 'FAIR';
                        //                       //     case 80:
                        //                       //       return 'NONE';
                        //                       //   }
                        //                       //   return actualValue.toString();
                        //                       // },
                        //                       onChanged: (dynamic newValue) {
                        //                         setState(() {
                        //                           _value = newValue;
                        //                         });
                        //                       },
                        //                     ),
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "CLARITY",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //             RangeSlider(
                        //               values: _currentRangeValues,
                        //               max: 100,
                        //               divisions: 5,
                        //               labels: RangeLabels(
                        //                 _currentRangeValues.start.round().toString(),
                        //                 _currentRangeValues.end.round().toString(),
                        //
                        //               ),
                        //               onChanged: (RangeValues values) {
                        //                 setState(() {
                        //                   _currentRangeValues = values;
                        //                 });
                        //               },
                        //             ),
                        //
                        //                     // SfSlider(
                        //                     //   min: 0,
                        //                     //   max: 120,
                        //                     //   showLabels: true,
                        //                     //   showDividers: true,
                        //                     //   interval: 10,
                        //                     //   value: _value,
                        //                     //   labelPlacement: LabelPlacement.betweenTicks,
                        //                     //   labelFormatterCallback:
                        //                     //       (dynamic actualValue, String formattedText) {
                        //                     //     switch (actualValue) {
                        //                     //       case 0:
                        //                     //         return 'FL';
                        //                     //       case 10:
                        //                     //         return 'IF';
                        //                     //       case 20:
                        //                     //         return 'VVS1';
                        //                     //       case 30:
                        //                     //         return 'VVS2';
                        //                     //       case 40:
                        //                     //         return 'VS1';
                        //                     //       case 50:
                        //                     //         return 'VS2';
                        //                     //       case 60:
                        //                     //         return 'SI1';
                        //                     //       case 70:
                        //                     //         return 'SI2';
                        //                     //       case 80:
                        //                     //         return 'SI3';
                        //                     //       case 90:
                        //                     //         return 'I1';
                        //                     //       case 100:
                        //                     //         return 'I2';
                        //                     //       case 120:
                        //                     //         return 'I3';
                        //                     //     }
                        //                     //     return actualValue.toString();
                        //                     //   },
                        //                     //   onChanged: (dynamic newValue) {
                        //                     //     setState(
                        //                     //       () {
                        //                     //         _value = newValue;
                        //                     //       },
                        //                     //     );
                        //                     //   },
                        //                     // ),
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "COLOR",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //
                        //                     RangeSlider(
                        //                       values: _currentRangeValues,
                        //                       max: 100,
                        //                       divisions: 5,
                        //                       labels: RangeLabels(
                        //                         _currentRangeValues.start.round().toString(),
                        //                         _currentRangeValues.end.round().toString(),
                        //
                        //                       ),
                        //                       onChanged: (RangeValues values) {
                        //                         setState(() {
                        //                           _currentRangeValues = values;
                        //                         });
                        //                       },
                        //                     ),
                        //
                        //                     // SfSlider(
                        //                     //   min: 0,
                        //                     //   max: 160,
                        //                     //   showLabels: true,
                        //                     //   showDividers: true,
                        //                     //   interval: 20,
                        //                     //   value: _value,
                        //                     //   labelPlacement: LabelPlacement.betweenTicks,
                        //                     //   labelFormatterCallback:
                        //                     //       (dynamic actualValue, String formattedText) {
                        //                     //     switch (actualValue) {
                        //                     //       case 0:
                        //                     //         return 'D';
                        //                     //       case 20:
                        //                     //         return 'E';
                        //                     //       case 40:
                        //                     //         return 'F';
                        //                     //       case 60:
                        //                     //         return 'G';
                        //                     //       case 80:
                        //                     //         return 'H';
                        //                     //       case 100:
                        //                     //         return 'I';
                        //                     //       case 120:
                        //                     //         return 'J';
                        //                     //       case 140:
                        //                     //         return 'K-O';
                        //                     //       case 160:
                        //                     //         return 'P-Z';
                        //                     //     }
                        //                     //     return actualValue.toString();
                        //                     //   },
                        //                     //   onChanged: (dynamic newValue) {
                        //                     //     setState(
                        //                     //       () {
                        //                     //         print(newValue.toStringAsFixed(0));
                        //                     //         _value = newValue;
                        //                     //       },
                        //                     //     );
                        //                     //   },
                        //                     // ),
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "CUT",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //
                        //                     SliderTheme(
                        //                       data: SliderTheme.of(context).copyWith(
                        //                         activeTrackColor: Colors.pink,
                        //                         inactiveTrackColor: Color(0xFF8D8E98),
                        //                         thumbColor: Color(0xFFEB1555),
                        //                         thumbShape:
                        //                         RoundSliderThumbShape(enabledThumbRadius: 15),
                        //                         overlayShape:
                        //                         RoundSliderOverlayShape(overlayRadius: 30.0),
                        //                         overlayColor: Color(0x29EB1555),
                        //                         showValueIndicator: ShowValueIndicator.always,
                        //                       ),
                        //                       child: SfRangeSlider(
                        //                         min: 0.0,
                        //                         max: 100.0,
                        //                         values: _values,
                        //                         interval: 20,
                        //                         showTicks: true,
                        //                         showLabels: true,
                        //                         enableTooltip: true,
                        //                         minorTicksPerInterval: 1,
                        //                         labelPlacement: LabelPlacement.betweenTicks,
                        //                         labelFormatterCallback: (dynamic actualValue, String formattedText) {
                        //                           switch (actualValue) {
                        //                             case 0:
                        //                               return 'IDEAL';
                        //                             case 20:
                        //                               return 'EXCELLENT';
                        //                             case 40:
                        //                               return 'VERY GOOD';
                        //                             case 60:
                        //                               return 'FAIR';
                        //                             case 80:
                        //                               return 'NONE';
                        //                           }
                        //                           return actualValue.toString();
                        //                         },
                        //                         onChanged: (SfRangeValues values) {
                        //                           setState(() {
                        //                             _values = values;
                        //                           });
                        //                         },
                        //                       ),
                        //                     ),
                        //                     // RangeSlider(
                        //                     //   values: _currentRangeValues,
                        //                     //   semanticFormatterCallback: ,
                        //                       // labelFormatterCallback:
                        //                       //       (dynamic actualValue, String formattedText) {
                        //                       //     switch (actualValue) {
                        //                       //       case 0:
                        //                       //         return 'IDEAL';
                        //                       //       case 20:
                        //                       //         return 'EXCELLENT';
                        //                       //       case 40:
                        //                       //         return 'VERY GOOD';
                        //                       //       case 60:
                        //                       //         return 'FAIR';
                        //                       //       case 80:
                        //                       //         return 'NONE';
                        //                       //     }
                        //                       //     return actualValue.toString();
                        //                       //   },
                        //                       //   onChanged: (dynamic newValue) {
                        //                       //     setState(() {
                        //                       //       _value = newValue;
                        //                       //     });
                        //                       //   },,
                        //                     //   max: 100,
                        //                     //   divisions: 5,
                        //                     //   labels: RangeLabels(
                        //                     //     _currentRangeValues.start.round().toString(),
                        //                     //     _currentRangeValues.end.round().toString(),
                        //                     //
                        //                     //   ),
                        //                     //   onChanged: (RangeValues values) {
                        //                     //     setState(() {
                        //                     //       _currentRangeValues = values;
                        //                     //     });
                        //                     //   },
                        //                     // ),
                        //
                        //                     // SfSlider(
                        //                     //   min: 0.0,
                        //                     //   max: 100.0,
                        //                     //   interval: 20,
                        //                     //   showTicks: true,
                        //                     //   showLabels: true,
                        //                     //   value: _value,
                        //                     //   labelPlacement: LabelPlacement.betweenTicks,
                        //                     //   labelFormatterCallback:
                        //                     //       (dynamic actualValue, String formattedText) {
                        //                     //     switch (actualValue) {
                        //                     //       case 0:
                        //                     //         return 'IDEAL';
                        //                     //       case 20:
                        //                     //         return 'EXCELLENT';
                        //                     //       case 40:
                        //                     //         return 'VERY GOOD';
                        //                     //       case 60:
                        //                     //         return 'FAIR';
                        //                     //       case 80:
                        //                     //         return 'NONE';
                        //                     //     }
                        //                     //     return actualValue.toString();
                        //                     //   },
                        //                     //   onChanged: (dynamic newValue) {
                        //                     //     setState(() {
                        //                     //       _value = newValue;
                        //                     //     });
                        //                     //   },
                        //                     // ),
                        //
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "REPORT",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //
                        //                     // _CheckBox(),
                        //                     _CheckBox(),
                        //
                        //                     // CheckboxListTile(
                        //                     //   title: Text("ap"),
                        //                     //   value: true,
                        //                     //   onChanged: (newValue) {},
                        //                     //   controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        //                     // ),
                        //
                        //                     Padding(
                        //                       padding: const EdgeInsets.only(top: 20, bottom: 8),
                        //                       child: Row(
                        //                         children: [
                        //                           Text(
                        //                             "LOT",
                        //                             style: TextStyle(fontSize: 20),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //
                        //                     _Cupan(),
                        //
                        //                     SizedBox(
                        //                       height: 30,
                        //                     )
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
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Icon(Icons.filter_list),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 440, top: 0),
                              child: Text(
                                "Diamond Filter",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                              ),
                            ),

                            // Container(
                            //     height: 30,
                            //     // margin: const EdgeInsets.only(top: 100),
                            //     // width: double.infinity,
                            //     // alignment: Alignment.centerRight,
                            //     child: bottomsheet()
                            // ),

                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
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
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(child: LoadMoreDemo())
                  ],
                ),
              ),
            ],
          ),
          const BottomCartView(),

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
        ],
      ),
    );
  }

  void bootomshett() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return Container(
                height: 999,
                color: Colors.white,
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

                            Container(
                                padding: EdgeInsets.only(top: 10),
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //backgroundColor: Color(0xffD9F3F2),
                                      backgroundColor: Colors.cyan,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(fontSize: 25),
                                    ))),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "SHAPE",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            // Divider(),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/1.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/image_2022_12_27T15_32_38_835Z.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/image_2022_12_27T15_32_38_838Z.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/image_2022_12_27T15_32_38_841Z.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/image_2022_12_27T15_32_38_853Z.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 16, right: 16, bottom: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xffEBEBEB),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Image.asset(
                                              "assets/diamond_shape/image_2022_12_27T15_32_38_856Z.png",
                                              height: 65,
                                              width: 65,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(),

                            SizedBox(
                              height: 30,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "CARAT",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SfRangeSlider(
                              // labelPlacement: LabelPlacement.betweenTicks,
                              // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                              // switch (actualValue) {
                              //   case 0:
                              //     return 'D';
                              //   case 20:
                              //     return 'E';
                              //   case 40:
                              //     return 'F';
                              //   case 60:
                              //     return 'G';
                              //   case 80:
                              //     return 'H';
                              //   case 100:
                              //     return 'I';
                              //   case 120:
                              //     return 'J';
                              //   case 140:
                              //     return 'K-O';
                              // // case 90:
                              // //   return 'NONE';
                              // }
                              // return actualValue.toString();
                              // },
                              min: 0.0,
                              max: 100.0,
                              values: _values1,
                              // interval: 20,
                              // showTicks: true,
                              showLabels: true,
                              // enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (SfRangeValues values) {
                                setState(() {
                                  _values1 = values;
                                });
                              },
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20, bottom: 8),
                                  child: Text(
                                    "PRICE/STONE",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),

                            SfRangeSlider(
                              // labelPlacement: LabelPlacement.betweenTicks,
                              // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                              // switch (actualValue) {
                              //   case 0:
                              //     return 'D';
                              //   case 20:
                              //     return 'E';
                              //   case 40:
                              //     return 'F';
                              //   case 60:
                              //     return 'G';
                              //   case 80:
                              //     return 'H';
                              //   case 100:
                              //     return 'I';
                              //   case 120:
                              //     return 'J';
                              //   case 140:
                              //     return 'K-O';
                              // // case 90:
                              // //   return 'NONE';
                              // }
                              // return actualValue.toString();
                              // },
                              min: 0.0,
                              max: 100.0,
                              values: _values2,
                              // interval: 20,
                              // showTicks: true,
                              showLabels: true,
                              // enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (SfRangeValues values) {
                                setState(() {
                                  _values2 = values;
                                });
                              },
                            ),
                            // SfSlider(
                            //   min: 0.0,
                            //   max: 100.0,
                            //   // interval: 20,
                            //   showTicks: true,
                            //   showLabels: true,
                            //   value: _value2,
                            //   enableTooltip: true,
                            //   // labelPlacement: LabelPlacement.betweenTicks,
                            //   // labelFormatterCallback: (dynamic actualValue, String formattedText) {
                            //   //   switch (actualValue) {
                            //   //     case 0:
                            //   //       return '';
                            //   //     case 20:
                            //   //       return '';
                            //   //     case 40:
                            //   //       return ' GOOD';
                            //   //     case 60:
                            //   //       return 'FAIR';
                            //   //     case 80:
                            //   //       return 'NONE';
                            //   //   }
                            //   //   return actualValue.toString();
                            //   // },
                            //   onChanged: (dynamic newValue) {
                            //     setState(() {
                            //       _value2 = newValue;
                            //     });
                            //   },
                            // ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "CLARITY",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SfRangeSlider(
                              labelPlacement: LabelPlacement.betweenTicks,
                              labelFormatterCallback: (dynamic actualValue, String formattedText) {
                                switch (actualValue) {
                                  case 0:
                                    return 'FL';
                                  case 20:
                                    return 'IF';
                                  case 40:
                                    return 'VVS1';
                                  case 60:
                                    return 'VVS2';
                                  case 80:
                                    return 'VS1';
                                  case 100:
                                    return 'VS2';
                                  case 120:
                                    return 'SI1';
                                  case 140:
                                    return 'SI2';
                                  case 160:
                                    return 'SI3';
                                  case 180:
                                    return 'I1';
                                  case 200:
                                    return 'I2';
                                  case 220:
                                    return 'I3';
                                }
                                return actualValue.toString();
                              },
                              showDividers: true,

                              min: 0.0,
                              max: 240.0,
                              values: _values3,
                              interval: 20,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (SfRangeValues values) {
                                setState(() {
                                  _values3 = values;
                                });
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "COLOR",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),

                            SfRangeSlider(
                              labelPlacement: LabelPlacement.betweenTicks,
                              labelFormatterCallback: (dynamic actualValue, String formattedText) {
                                switch (actualValue) {
                                  case 0:
                                    return 'D';
                                  case 20:
                                    return 'E';
                                  case 40:
                                    return 'F';
                                  case 60:
                                    return 'G';
                                  case 80:
                                    return 'H';
                                  case 100:
                                    return 'I';
                                  case 120:
                                    return 'J';
                                  case 140:
                                    return 'K-O';
                                  case 160:
                                    return 'P-Z';
                                  // case 90:
                                  //   return 'NONE';
                                }
                                return actualValue.toString();
                              },
                              min: 0.0,
                              max: 180.0,
                              values: _values4,
                              interval: 20,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (SfRangeValues values) {
                                setState(() {
                                  _values4 = values;
                                });
                              },
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "CUT",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),

                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.pink,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                                overlayColor: Color(0x29EB1555),
                                showValueIndicator: ShowValueIndicator.always,
                              ),
                              child: SfRangeSlider(
                                min: 0.0,
                                max: 100.0,
                                values: _values5,
                                interval: 20,
                                showTicks: true,
                                showLabels: true,
                                enableTooltip: true,
                                minorTicksPerInterval: 1,
                                labelPlacement: LabelPlacement.betweenTicks,
                                labelFormatterCallback:
                                    (dynamic actualValue, String formattedText) {
                                  switch (actualValue) {
                                    case 0:
                                      return 'IDEAL';
                                    case 20:
                                      return 'EXCELLENT';
                                    case 40:
                                      return 'VERY GOOD';
                                    case 60:
                                      return 'FAIR';
                                    case 80:
                                      return 'NONE';
                                  }
                                  return actualValue.toString();
                                },
                                onChanged: (SfRangeValues values) {
                                  setState(() {
                                    _values5 = values;
                                  });
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "REPORT",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),

                            _CheckBox(),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "LOT",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),

                            _Cupan(),

                            SizedBox(
                              height: 30,
                            )
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

  void getDaimondData() async {
    var headers = {
      "Accept": "application/json",
      "consumerKey": "bbae36baea2ef8dcd1f9a8a88cc59f06",
      "consumerSecret": "5edc426ec2965bba17c96e766c47ad73",
      "oauth_token": "819dc5826cd08cca9c57d392ba2b305e",
      "oauth_token_secret": "97565ea77d5c8c8f7c63b8f5f3916656",
    };

    var response = await http.get(
        Uri.parse('https://www.overnightmountings.com/api/rest/labgrowndiamond'),
        headers: headers);
    print("--------------------${response.statusCode}");
    print("--------------------${response.body}");
    // print("data  -----------${data}");
    var data = jsonDecode(response.body.toString());

    Iterable l = json.decode(response.body);
    daimondList = List<DaimondList>.from(l.map((model) => DaimondList.fromJson(model)));
    print("daimondList--------------------${daimondList.length}");
    _currentPerPage = daimondList.length;
    setState(() {
      _mockPullData();
    });
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
          // Text(entry.value.toString()),
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

class _CheckBox extends StatefulWidget {
  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Spacer(),

          // Spacer(),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              activeColor: Colors.blue[300],
              checkColor: Colors.white,
              value: _checkbox1,
              onChanged: (nValue) {
                setState(() {
                  _checkbox1 = nValue!;
                });
              },
            ),
          ),

          // Transform.scale(
          //   scale: 2.0,
          //   child: Checkbox(
          //     activeColor: Colors.blue[300],
          //     checkColor: Colors.white,
          //     value: true,
          //     onChanged: (value) {
          //       setState(() {
          //         _checkbox1 = !_checkbox1;
          //       });
          //       // widget.onChanged(value);
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Text("GIA", style: TextStyle(fontSize: 18)),
          ),
          // Spacer(),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              activeColor: Colors.blue[300],
              checkColor: Colors.white,
              value: _checkbox2,
              onChanged: (nValue) {
                setState(() {
                  _checkbox2 = nValue!;
                });
              },
            ),
          ),
          // Transform.scale(
          //   scale: 2.0,
          //   child: Checkbox(
          //     activeColor: Colors.blue[300],
          //     checkColor: Colors.white,
          //     value: true,
          //     onChanged: (value) {
          //       setState(() {
          //         _checkbox1 = !_checkbox1;
          //       });
          //       // widget.onChanged(value);
          //     },
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Text("IGI", style: TextStyle(fontSize: 18)),
          ),
          // Spacer(),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              activeColor: Colors.blue[300],
              checkColor: Colors.white,
              value: _checkbox3,
              onChanged: (nValue) {
                setState(() {
                  _checkbox3 = nValue!;
                });
              },
            ),
          ),
          // Transform.scale(
          //   scale: 2.0,
          //   child: Checkbox(
          //     activeColor: Colors.blue[300],
          //     checkColor: Colors.white,
          //     value: true,
          //     onChanged: (value) {
          //       setState(() {
          //         _checkbox1 = !_checkbox1;
          //       });
          //       // widget.onChanged(value);
          //     },
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Text("GCAL", style: TextStyle(fontSize: 18)),
          ),
          // Spacer(),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              activeColor: Colors.blue[300],
              checkColor: Colors.white,
              value: _checkbox4,
              onChanged: (nValue) {
                setState(() {
                  _checkbox4 = nValue!;
                });
              },
            ),
          ),
          // Transform.scale(
          //   scale: 2.0,
          //   child: Checkbox(
          //     activeColor: Colors.blue[300],
          //     checkColor: Colors.white,
          //     value: true,
          //     onChanged: (value) {
          //       setState(() {
          //         _checkbox1 = !_checkbox1;
          //       });
          //       // widget.onChanged(value);
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Text("HRD", style: TextStyle(fontSize: 18)),
          ),
          Transform.scale(
            scale: 2.0,
            child: Checkbox(
              activeColor: Colors.blue[300],
              checkColor: Colors.white,
              value: _checkbox5,
              onChanged: (nValue) {
                setState(() {
                  _checkbox5 = nValue!;
                });
              },
            ),
          ),

          //
          // Transform.scale(
          //   scale: 2.0,
          //   child: Checkbox(
          //     activeColor: Colors.blue[300],
          //     checkColor: Colors.white,
          //     value: true,
          //     onChanged: (value) {
          //       setState(() {
          //         _checkbox1 = !_checkbox1;
          //       });
          //       // widget.onChanged(value);
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Text("GSI", style: TextStyle(fontSize: 18)),
          ),
        ],
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
            width: 450,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 60,
            width: 150,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () => {},
              icon: Icon(Icons.search, color: Colors.cyan, size: 30),
              label: Text(
                'Search',
                style: TextStyle(color: Colors.cyan, fontSize: 22),
              ),
            ),
          ),
        ],
      ),

//
    );
  }
}
