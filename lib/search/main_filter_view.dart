import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFilterView extends StatefulWidget {
  List<String> filters;

  MainFilterView({Key? key, required this.filters}) : super(key: key);

  @override
  State<MainFilterView> createState() => _MainFilterViewState();
}

class _MainFilterViewState extends State<MainFilterView> {

  @override
  Widget build(BuildContext context) {

    List<String> tags = ['#sfsfsf', '#qwqw', '#fffff', '#qwqer', '#zxcv','#sfsfsf', '#qwqw', '#fffff', '#qwqer', '#zxcv'];
    List<String> cat = ['Diamonds', 'Jewellery ', 'Dashboard', 'Education', 'Orders','Points'];
    // List<String> attributes = ['#sfsfsf', '#qwqw', '#fffff', '#qwqer', '#zxcv','#sfsfsf', '#qwqw', '#fffff', '#qwqer', '#zxcv'];

    Widget _cancelApplyView(){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              // style: ButtonStyle(
              //   foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              // ),
              onPressed: () { },
              child: Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            SizedBox(width: 10,),
            TextButton(
              onPressed: () { },
              child: Text('Apply', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      );
    }

    Widget _listChild(int index, String text){
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(),),
      );
    }

    Widget _filterType(String title, List<String> list) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.separated(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _listChild(index, list[index]);
                  },
                separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10,);
                },),
            ),
          ],
        ),
      );
    }

    Widget _allColumnWidget(){
      return Container(
        padding: EdgeInsets.all(20),
        height: Get.height * 0.5,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cancelApplyView(),
            SizedBox(height: 20,),
            _filterType('Tags', tags),
            SizedBox(height: 40,),
            _filterType('Categories', cat),
            SizedBox(height: 40,),
            _filterType('Attributes', cat),
          ],
        ),
      );
    }

    return _allColumnWidget();
  }
}
