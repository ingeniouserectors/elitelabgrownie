import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final List<Data> dataList = <Data>[
    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),    Data("Ronak",1, true),
    Data("Ronak",2, true),
    Data("Ronak",3, true),
    Data("Ronak",4, true),
    Data("Ronak",5, true),
    Data("Ronak",6, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
    Data("Ronak",1, true),
  ];
  List<Data> currentDataList = <Data>[];
  int page = 1;
  int pageCount = 20;
  int startAt = 0;
  int? endAt;
  int totalPages = 0;
  // Data? data;

  @override
  void initState() {
    //Data("1", 1, true);

     // for (var i = 1; i <= 1000; i++) dataList.add(
     //     Data("Ronak",1, true));

    endAt = startAt + pageCount;
    totalPages = (dataList.length / pageCount).floor();
    if (dataList.length / pageCount > totalPages) {
      totalPages = totalPages + 1;
    }

    currentDataList = dataList.getRange(startAt, endAt!).toList();
    super.initState();
  }

  void loadPreviousPage() {
    if (page > 1) {
      setState(() {
        startAt = startAt - pageCount;
        endAt = page == totalPages
            ? endAt! - currentDataList.length
            : endAt! - pageCount;
        currentDataList = dataList.getRange(startAt, endAt!).toList();
        page = page - 1;
      });
    }
  }

  void loadNextPage() {
    if (page < totalPages) {
      setState(() {
        startAt = startAt + pageCount;
        endAt = dataList.length > endAt! + pageCount ? endAt! + pageCount : dataList.length;
        currentDataList = dataList.getRange(startAt, endAt!).toList();
        page = page + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: currentDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Text(
                    currentDataList[index].name! +
                        currentDataList[index].id.toString(),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: page > 1 ? loadPreviousPage : null,
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                ),
              ),
              Text("$page / $totalPages"),
              IconButton(
                onPressed: page < totalPages ? loadNextPage : null,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Data {

  String? name;
  int? id;
  bool? active;

  Data(this.name, this.id, this.active);

}

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.from(
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
//       ),
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text("Number Paginator"),
//             bottom: const TabBar(
//               tabs: [
//                 Tab(child: Text("Hidden")),
//                 Tab(child: Text("Numbers")),
//                 Tab(child: Text("Dropdown")),
//                 Tab(child: Text("Custom Builder")),
//               ],
//             ),
//           ),
//           body:  TabBarView(
//             children: [
//               OnlyArrowsPage(),
//               NumbersPage(),
//               DropdownPage(),
//               BuilderPage(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
