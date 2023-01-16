import 'dart:convert';
import 'package:ecom/Api/Apiclass.dart';
import 'package:ecom/core/bloc/cart_bloc.dart';
import 'package:ecom/core/view/db_provider.dart';
import 'package:ecom/demo/Diamond_Details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class LoadMoreDemo extends StatefulWidget {
  const LoadMoreDemo({Key? key}) : super(key: key);

  @override
  _LoadMoreDemoState createState() => _LoadMoreDemoState();
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() =>
      replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

class _LoadMoreDemoState extends State<LoadMoreDemo> {
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    getDaimondData();
    super.initState();
  }

  int page = 1;
  List<DaimondList> daimondList = [];
  void getDaimondData() async {
    var headers = {
      "Accept": "application/json",
      "consumerKey": "bbae36baea2ef8dcd1f9a8a88cc59f06",
      "consumerSecret": "5edc426ec2965bba17c96e766c47ad73",
      "oauth_token": "819dc5826cd08cca9c57d392ba2b305e",
      "oauth_token_secret": "97565ea77d5c8c8f7c63b8f5f3916656",
    };

    var response = await http.get(
        Uri.parse(
            'https://www.overnightmountings.com/api/rest/labgrowndiamond?page=$page&limit=30'),
        headers: headers);

    Iterable l = json.decode(response.body);
    daimondList.addAll(List<DaimondList>.from(l.map((model) => DaimondList.fromJson(model))));

    ///  _populateEmployeeData(20);
    _employeeDataSource = EmployeeDataSource(mDaimondList: daimondList);
    setState(() {});
  }

  final DataGridController _dataGridController = DataGridController();

  @override
  Widget build(BuildContext context) {
    return daimondList.isEmpty
        ? Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json'))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // decoration: const BoxDecoration(
              //   border: Border(
              //     right: BorderSide(
              //       color: Colors.grey,
              //       width: 0.4,
              //     ),
              //   ),
              // ),
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                  frozenPaneElevation: 0.0,
                  frozenPaneLineColor: Colors.transparent,
                  frozenPaneLineWidth: 0.0,
                  gridLineColor: Colors.white,
                  sortIconColor: Colors.white,
                  sortIcon: const Icon(Icons.expand_more, color: Colors.white),
                  headerColor: const Color(0xff505050),
                ),
                child: SfDataGrid(
                  //gridLinesVisibility: GridLinesVisibility.horizontal,
                  headerGridLinesVisibility: GridLinesVisibility.none,
                  footerFrozenColumnsCount: 1,
                  controller: _dataGridController,
                  navigationMode: GridNavigationMode.row,
                  // columnWidthMode: ColumnWidthMode.fill,
                  allowSorting: true,
                  //horizontalScrollPhysics: const NeverScrollableScrollPhysics(),
                  headerRowHeight: 45,
                  source: _employeeDataSource,
                  loadMoreViewBuilder: (BuildContext context, LoadMoreRows loadMoreRows) {
                    Future<String> loadRows() async {
                      // Call the loadMoreRows function to call the
                      // DataGridSource.handleLoadMoreRows method. So, additional
                      // rows can be added from handleLoadMoreRows method.
                      await loadMoreRows();
                      return Future<String>.value('Completed');
                    }

                    return FutureBuilder<String>(
                        initialData: 'loading',
                        future: loadRows(),
                        builder: (context, snapShot) {
                          if (snapShot.data == 'loading') {
                            return Container(
                                height: 64.0,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    border: BorderDirectional(
                                        top: BorderSide(width: 0.0, color: Colors.transparent))),
                                alignment: Alignment.center,
                                child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json'));
                          } else {
                            return SizedBox.fromSize(size: Size.zero);
                          }
                        });
                  },
                  onCellTap: (DataGridCellTapDetails details) {
                    if (details.rowColumnIndex.rowIndex != 0) {
                      var data =
                          _employeeDataSource.rows.elementAt(details.rowColumnIndex.rowIndex - 1);
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage1(
                                      mLot: data.getCells()[0].value,
                                    )));
                      } catch (e) {
                        ///Error
                      }
                    }
                  },
                  columns: <GridColumn>[
                    GridColumn(
                        width: getColumnWidth(2),
                        columnName: 'lot',
                        label: Container(
                          color: const Color(0xff505050),
                          // padding: const EdgeInsets.only(left: 30.0),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(
                              'Lot#',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    GridColumn(
                        width: getColumnWidth(1.5),
                        columnName: 'shape',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 17.0),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Shape',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.20),
                        columnName: 'carat',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 5.0),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Carat',
                              style: TextStyle(color: Colors.white),
                              //overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.35),
                        columnName: 'clarity',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 7.0),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Clarity',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.27),
                        columnName: 'color',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.center,
                            child: Text(
                              'Color',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.7),
                        columnName: 'cut',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Cut',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.90),
                        columnName: 'price_stone',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Price/Stone',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        columnWidthMode: ColumnWidthMode.none,
                        width: getColumnWidth(2.65),
                        columnName: 'measurement',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.center,
                            child: const Text(
                              'Measurement',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.8),
                        columnName: 'price_carat',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Price/Carat',
                              style: TextStyle(color: Colors.white),
                            ))),
                    GridColumn(
                        width: getColumnWidth(1.6),
                        columnName: 'report',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: const Text(
                                'Report',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    GridColumn(
                        width: getColumnWidth(2),
                        columnName: 'certificate',
                        label: Container(
                            color: const Color(0xff505050),
                            padding: const EdgeInsets.only(left: 8.0),
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: const Text(
                                'Certificate',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))),
                    GridColumn(
                        width: getColumnWidth(0.9),
                        columnName: 'id',
                        allowSorting: false,
                        label: Container(
                          color: const Color(0xff505050),
                          //padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment.centerRight,
                        )),
                  ],
                ),
              ),
            ),
          );
  }

  /// [getColumnWidth] which is a use to get ColumnW Width
  double getColumnWidth(double part) {
    double width = (MediaQuery.of(context).size.width);
    return (width / 12) * part;
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);

  final int id;

  final String name;

  final String designation;

  final int salary;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<DaimondList> mDaimondList}) {
    _employeeData = mDaimondList
        .map<DataGridRow>((item) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'lot', value: item.lot!.toString()),
              DataGridCell<String>(
                  columnName: 'shape', value: item.shape!.toString().toTitleCase()),
              DataGridCell<String>(
                  columnName: 'carat', value: "${double.parse(item.weight!).toStringAsFixed(2)}ct"),
              DataGridCell<String>(columnName: 'clarity', value: item.clarity!.toString()),
              DataGridCell<String>(
                  columnName: 'color', value: item.color!.toString().toTitleCase()),
              DataGridCell<String>(
                  columnName: 'cut', value: item.cutgrade!.toString().toTitleCase()),
              DataGridCell<String>(
                  columnName: 'price_stone',
                  value: "\$${double.parse(item.markupprice!).toStringAsFixed(2)}"),
              DataGridCell<String>(
                  columnName: 'measurement', value: "${item.measurement!.toString()}mm"),
              DataGridCell<String>(
                  columnName: 'price_carat',
                  value: "\$${double.parse(item.pricect!).toStringAsFixed(2)}"),
              DataGridCell<String>(columnName: 'report', value: item.lab!.toString()),
              DataGridCell<String>(columnName: 'certificate', value: item.certificate!.toString()),
              DataGridCell<DaimondList>(columnName: 'id', value: item),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  int page = 1;
  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    final String? value1 = a
        ?.getCells()
        .firstWhereOrNull((element) => element.columnName == sortColumn.name)
        ?.value
        .toString();
    final String? value2 = b
        ?.getCells()
        .firstWhereOrNull((element) => element.columnName == sortColumn.name)
        ?.value
        .toString();

    if (value1 == null || value2 == null) {
      return 0;
    }

    if (sortColumn.sortDirection == DataGridSortDirection.ascending) {
      return value1.toLowerCase().compareTo(value2.toLowerCase());
    } else {
      return value2.toLowerCase().compareTo(value1.toLowerCase());
    }
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
        Uri.parse(
            'https://www.overnightmountings.com/api/rest/labgrowndiamond?page=$page&limit=30'),
        headers: headers);

    ///var data = jsonDecode(response.body.toString());
    List<DaimondList> daimondList = [];
    Iterable l = json.decode(response.body);
    daimondList.addAll(List<DaimondList>.from(l.map((model) => DaimondList.fromJson(model))));
    for (int i = 0; i < daimondList.length; i++) {
      var item = daimondList[i];
      _employeeData.add(DataGridRow(cells: [
        DataGridCell<String>(columnName: 'lot', value: item.lot!.toString()),
        DataGridCell<String>(columnName: 'shape', value: item.shape!.toString().toTitleCase()),
        DataGridCell<String>(
            columnName: 'carat', value: "${double.parse(item.weight!).toStringAsFixed(2)}ct"),
        DataGridCell<String>(columnName: 'clarity', value: item.clarity!.toString()),
        DataGridCell<String>(columnName: 'color', value: item.color!.toString().toTitleCase()),
        DataGridCell<String>(columnName: 'cut', value: item.cutgrade!.toString().toTitleCase()),
        DataGridCell<String>(
            columnName: 'price_stone',
            value: "\$${double.parse(item.markupprice!).toStringAsFixed(2)}"),
        DataGridCell<String>(columnName: 'measurement', value: "${item.measurement!.toString()}mm"),
        DataGridCell<String>(
            columnName: 'price_carat',
            value: "\$${double.parse(item.pricect!).toStringAsFixed(2)}"),
        DataGridCell<String>(columnName: 'report', value: item.lab!.toString()),
        DataGridCell<String>(columnName: 'certificate', value: item.certificate!.toString()),
        DataGridCell<DaimondList>(columnName: 'id', value: item),
      ]));
    }
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await Future.delayed(const Duration(seconds: 5));
    page++;
    getDaimondData();
    notifyListeners();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.grey[100],
        cells: row.getCells().map<Widget>((e) {
          switch (e.columnName) {
            case 'id':
              return CardDataView(mDaimondList: e.value);
            default:
              return DataView(
                value: e.value,
                mDaimondList: e.value,
              );
          }
        }).toList());
  }
}

class CardDataView extends StatefulWidget {
  final DaimondList mDaimondList;
  const CardDataView({Key? key, required this.mDaimondList}) : super(key: key);

  @override
  State<CardDataView> createState() => _CardDataViewState();
}

class _CardDataViewState extends State<CardDataView> {
  DaimondList mDaimondList = DaimondList();

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  void init() {
    setState(() {
      mDaimondList = widget.mDaimondList;
    });
    isCart();
  }

  bool addedCart = false;
  void isCart() {
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartResponse) {
          isCart();
        }
      },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            height: 36,
            width: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xfffcfcfc),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: InkWell(
              onTap: () {
                if (addedCart) {
                  DbProvider().deleteCart(mDaimondList.diamonddetailsId.toString(), true, context);
                } else {
                  DbProvider().addCart(jsonEncode(mDaimondList), true, context);
                }
                isCart();
              },
              child: addedCart
                  ? const Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                      color: const Color(0xff5FC2BF),
                    )
                  : Icon(
                      Icons.add_shopping_cart,
                      size: 20,
                    ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class DataView extends StatelessWidget {
  final String value;
  final dynamic mDaimondList;
  const DataView({Key? key, required this.value, required this.mDaimondList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        value.toString(),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
