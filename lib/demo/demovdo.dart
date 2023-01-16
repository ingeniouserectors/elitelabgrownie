// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
//
//
//
// class vdo extends StatefulWidget {
//   const vdo({Key? key}) : super(key: key);
//
//   @override
//   State<vdo> createState() => _vdoState();
// }
//
// class _vdoState extends State<vdo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//
//
//       VideoPlayerController videoPlayerController = VideoPlayerController.network(videoUrl);
//         videoPlayerController.initialize().then((_) {
//       setState(() {
//         videoPlayerController.play();
//         videoPlayerController.setLooping(true);
//         videoPlayerController.setVolume(1.0);
//         videoPlayerController.setAutoPlay(true);
//       });
//     });
//
//       VideoPlayerController controller = VideoPlayerController.asset('assets/video.mp4');
//         controller.setVolume(1.0);
//     controller.play();
//     controller.setLooping(true);
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// VideoPlayerController controller = VideoPlayerController.asset('assets/video.mp4');
// controller.setVolume(1.0);
// controller.play();
// controller.setLooping(true);
//
// import 'package:flutter/material.dart';
// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:video_player/video_player.dart';
//
// class SamplePlayer extends StatefulWidget {
//   // SamplePlayer({required Key key}) : super(key: key);
//
//   @override
//   _SamplePlayerState createState() => _SamplePlayerState();
// }
//
// class _SamplePlayerState extends State<SamplePlayer> {
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//           VideoPlayerController.asset("assets/nimage/51043-E.video.yellow.mp4"),
//     );
//   }
//
//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SizedBox(
//         height: 200,
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             FlickVideoPlayer(flickManager: flickManager),
//             Image.asset("assets/nimage/51043-E.side.alt.jpg"),
//             // FlickVideoPlayer(
//             //     flickManager: flickManager
//             // ),
//           ],
//         ),
//       ),
//       //   FlickVideoPlayer(
//       //     flickManager: flickManager
//       // ),
//     ]);
//   }
// }

import 'package:ecom/demo/Diamond_Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../Api/Apiclass.dart';

class SfDataGridDemo extends StatefulWidget {
  const SfDataGridDemo({Key? key}) : super(key: key);

  @override
  _SfDataGridDemoState createState() => _SfDataGridDemoState();
}

class _SfDataGridDemoState extends State<SfDataGridDemo> {
  List<Employee> _employees = <Employee>[];
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter SfDataGrid'),
      ),
      body: SfDataGridTheme(
        data: SfDataGridThemeData(
          headerColor: const Color(0xff505050),
        ),
        child: SfDataGrid(source: _employeeDataSource, columns: [
          GridColumn(
            columnName: 'Lot',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Lot',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Shape',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Shape',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Carat',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Carat',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Clarity',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Clarity',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          GridColumn(
            columnName: 'Color',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Color',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Cut',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Cut',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Report',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Report',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Price/CT',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Price/CT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Est.Price',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Est.Price',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GridColumn(
            columnName: 'Action',
            label: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              alignment: Alignment.center,
              child: const Text(
                'Action',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // GridColumn(
          //   columnName: 'designation',
          //   label: Container(
          //     padding: const EdgeInsets.all(8.0),
          //     alignment: Alignment.center,
          //     child: const Text('Designation'),
          //   ),
          // ),
        ]),
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
      Employee(1012721, 'Round', '0.01', 'Fl', 'F', 'Very Good', '10', '20', '20'),
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(List<Employee> employees) {
    buildDataGridRow(employees);
  }

  void buildDataGridRow(List<Employee> employeeData) {
    dataGridRow = employeeData.map<DataGridRow>((employee) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: employee.Lot),
        DataGridCell<String>(columnName: 'name', value: employee.Shape),
        DataGridCell<String>(columnName: 'designation', value: employee.Carat),
        DataGridCell<String>(columnName: 'name', value: employee.Clarity),
        DataGridCell<String>(columnName: 'name', value: employee.Color),
        DataGridCell<String>(columnName: 'name', value: employee.Cut),
        DataGridCell<String>(columnName: 'name', value: employee.Report),
        DataGridCell<String>(columnName: 'name', value: employee.Price),
        DataGridCell<String>(columnName: 'name', value: employee.Est),
        const DataGridCell<Widget>(columnName: 'button', value: null),
      ]);
    }).toList();
  }

  List<DataGridRow> dataGridRow = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: Alignment.center,
          child: dataGridCell.columnName == 'button'
              ? LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  return
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => DetailPage1()));
                      //     // showDialog(
                      //     //     context: context,
                      //     //     builder: (context) => AlertDialog(
                      //     //         content: SizedBox(
                      //     //             height: 100,
                      //     //             child: Column(
                      //     //               mainAxisAlignment:
                      //     //               MainAxisAlignment.spaceBetween,
                      //     //               children: [
                      //     //                 Text(
                      //     //                     'Employee ID: ${row.getCells()[0].value.toString()}'),
                      //     //                 Text(
                      //     //                     'Employee Name: ${row.getCells()[1].value.toString()}'),
                      //     //                 Text(
                      //     //                     'Employee Designation: ${row.getCells()[2].value.toString()}'),
                      //     //               ],
                      //     //             ))));
                      //   },
                      //   child: const Text('Details'));

                      IconButton(
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      // color: currentIndex == 0 ? Colors.orange : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailPage1(
                                mLot: '',
                              )));
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => AlertDialog(
                      //         content: SizedBox(
                      //             height: 100,
                      //             child: Column(
                      //               mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text(
                      //                     'Employee ID: ${row.getCells()[0].value.toString()}'),
                      //                 Text(
                      //                     'Employee Name: ${row.getCells()[1].value.toString()}'),
                      //                 Text(
                      //                     'Employee Designation: ${row.getCells()[2].value.toString()}'),
                      //               ],
                      //             ))));
                    },
                    splashColor: Colors.white,
                  );
                })
              : Text(dataGridCell.value.toString()));
    }).toList());
  }
}

class Employee {
  Employee(this.Lot, this.Shape, this.Carat, this.Clarity, this.Color, this.Cut, this.Report,
      this.Price, this.Est);
  final int Lot;
  final String Shape;
  final String Carat;
  final String Clarity;
  final String Color;
  final String Cut;
  final String Report;
  final String Price;
  final String Est;
}
