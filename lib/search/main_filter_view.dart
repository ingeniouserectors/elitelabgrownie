import 'package:ecom/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFilterView extends StatefulWidget {

  List<FilterItems> jewellery = [];
  List<FilterItems> centerShape = [];
  List<FilterItems> metal = [];

  MainFilterView({Key? key, required this.jewellery, required this.centerShape, required this.metal}) : super(key: key);

  @override
  State<MainFilterView> createState() => _MainFilterViewState();
}

class _MainFilterViewState extends State<MainFilterView> {

  @override
  Widget build(BuildContext context) {

    Widget _cancelApplyView(){
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              // style: ButtonStyle(
              //   foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              // ),
              onPressed: () {
                setState(() {
                  widget.jewellery.forEach((element) {element.isSelected = false;});
                  widget.centerShape.forEach((element) {element.isSelected = false;});
                  widget.metal.forEach((element) {element.isSelected = false;});
                });
                Navigator.pop(context, false);
              },
              child: Text('Reset', style: TextStyle(fontSize: 20, color: Colors.red),),
            ),
            SizedBox(width: 10,),
            TextButton(
              onPressed: () {
                // Get.back();
                Navigator.pop(context, true);
              },
              child: Text('Apply', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      );
    }

    Widget _listChild(int index, FilterItems item){
      return GestureDetector(
        onTap: (){
          setState(() {
            item.isSelected = !item.isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: item.isSelected ? Color(0xffD9F3F2) : Color(0xffEBEBEB),
            borderRadius: BorderRadius.circular(2),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          child: Text(item.name, style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
        ),
      );
    }

    Widget _imageChild(int index, FilterItems item){
      return GestureDetector(
        onTap: (){
          setState(() {
            item.isSelected = !item.isSelected;
          });
        },
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            // color: item.isSelected ? Color(0xffD9F3F2) : Color(0xffEBEBEB),
            borderRadius: BorderRadius.circular(2),
            // border: Border.all(color: Color(0xffEBEBEB)),
          ),
          child: Image.asset(item.imageName, color: item.isSelected ? Colors.cyan : Colors.black,),
        ),
      );
    }

    Widget _filterType(String title, List<FilterItems> list, {double height = 50}) {
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
              height: height,
              child: ListView.separated(
                  itemCount: list.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (height == 50){
                      return _listChild(index, list[index]);
                    }else{
                      return _imageChild(index, list[index]);
                    }
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
        height: Get.height * 0.45,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cancelApplyView(),
            SizedBox(height: 20,),
            _filterType('Jewellery', widget.jewellery),
            SizedBox(height: 40,),
            _filterType('Center Shape', widget.centerShape, height: 100),
            SizedBox(height: 40,),
            _filterType('Metal', widget.metal),
          ],
        ),
      );
    }

    return _allColumnWidget();
  }
}
