import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../core/view/load_more_demo.dart';
import 'datasortclass.dart';

class DataSort extends StatefulWidget {
  DataSort({Key? key}) : super(key: key);

  @override
  _DataSortState createState() => _DataSortState();
}

class _DataSortState extends State<DataSort> {
  late EmployeeDataSource1 _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource1(employees: populateData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: _employeeDataSource,
        allowSorting: true,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'ID',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                  ))),
          GridColumn(
              columnName: 'city',
              width: 110,
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'City',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'Freight',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text('Freight'))),
        ],
      ),
    );
  }

  List<Employee2> populateData() {
    return <Employee2>[
      Employee2(10001, 'James', 'Bruxelles', 20000),
      Employee2(10002, 'Kathryn', 'Rosario', 30000),
      Employee2(10003, 'Lara', 'Recife', 15000),
      Employee2(10004, 'Michael', 'Graz', 15000),
      Employee2(10005, 'Martin', 'Montreal', 15000),
      Employee2(10006, 'Newberry', 'Tsawassen', 15000),
      Employee2(10007, 'Balnc', 'Campinas', 15000),
      Employee2(10008, 'Perry', 'Resende', 15000),
      Employee2(10009, 'Gable', 'Resende', 15000),
      Employee2(10010, 'Grimes', 'Recife', 15000),
      Employee2(10011, 'Newberry', 'Tsawassen', 15000),
      Employee2(10012, 'Balnc', 'Campinas', 15000),
      Employee2(10013, 'Perry', 'Resende', 15000),
      Employee2(10014, 'Gable', 'Resende', 15000),
      Employee2(10015, 'Grimes', 'Recife', 15000),
    ];
  }
}

