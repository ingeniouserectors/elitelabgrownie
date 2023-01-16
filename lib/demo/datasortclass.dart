import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmployeeDataSource1 extends DataGridSource {
  EmployeeDataSource1({required List<Employee2> employees}) {
    _employeeData = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(columnName: 'city', value: e.city),
      DataGridCell<int>(columnName: 'freight', value: e.freight),
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: ['id', 'freight'].contains(e.columnName)
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}

class Employee2{
  Employee2(this.id, this.name, this.city, this.freight);

  final int id;

  final String name;

  final String city;

  final int freight;
}