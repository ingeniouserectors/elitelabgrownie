import 'package:ecom/search/main_filter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Head_footer/appbar.dart';
import '../Head_footer/drawer.dart';
import '../constant.dart';
import '../horizontal_list.dart';

class FilterItems{
  String name;
  int id;
  bool isSelected;
  String imageName;

  FilterItems(this.name, this.id, {this.isSelected = false, this.imageName = ''});
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  TextEditingController txtSearch = TextEditingController();
  List<FilterItems> filters = [FilterItems('+ Filter', 0)];


  List<FilterItems> jewellery = [
    FilterItems('Engagement Rings', 1201),
    FilterItems('Wedding Bands', 1202),
    FilterItems('Fashion Rings', 1203),
    FilterItems('Bracelets', 1204),
    FilterItems('Necklace', 1205),
    FilterItems('Pendants', 1206),
    FilterItems('Earrings', 1207),
  ];


  List<FilterItems> centerShape = [
    FilterItems('Round', 0, imageName: AppIcons.diamond_round),
    FilterItems('Princess', 0, imageName: AppIcons.diamond_princess),
    FilterItems('Marquise', 0, imageName: AppIcons.diamond_marquise),
    FilterItems('Cushion', 0, imageName: AppIcons.diamond_cushion),
    FilterItems('Oval', 0, imageName: AppIcons.diamond_oval),
    FilterItems('Pear', 0, imageName: AppIcons.diamond_pear),
    FilterItems('Emerald', 0, imageName: AppIcons.diamond_emerald),
    FilterItems('Asscher', 0, imageName: AppIcons.diamond_asscher),
    FilterItems('Radiant', 0, imageName: AppIcons.diamond_radiant),
    FilterItems('Heart', 0, imageName: AppIcons.diamond_heart),
  ];

  List<FilterItems> metal = [
    FilterItems('White Gold', 0),
    FilterItems('Yellow Gold', 0),
    FilterItems('Rose Gold', 0),
    FilterItems('Platinum', 0),
  ];

  @override
  Widget build(BuildContext context) {


    Widget _searchBar(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15 ),
        height: 50,
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: TextField(
                controller: txtSearch,
                decoration: InputDecoration(
                  hintText: 'Search for items',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (str) {
                  // print(str);
                },
                textInputAction: TextInputAction.search,
                onSubmitted: (str) {
                  print(str);
                },

              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
      );
    }

    
    Widget _listChild(int index){
      if (index == 0){
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                isScrollControlled: true,
                enableDrag: false,
                builder: (BuildContext context) {
                  return MainFilterView(
                    jewellery: jewellery,
                    centerShape: centerShape,
                    metal: metal,
                  );
                }).then((value) {
                  if (value){
                    print('apply filter');
                    var selectedJwe = jewellery.filter((element) {return element.isSelected == true;});
                    var selectedShape = centerShape.filter((element) {return element.isSelected == true;});
                    var selectedMetal = metal.filter((element) {return element.isSelected == true;});

                    setState(() {
                      filters = [FilterItems('+ Filter', 0)];
                      selectedJwe.forEach((element) {filters.add(element);});
                      selectedShape.forEach((element) {filters.add(element);});
                      selectedMetal.forEach((element) {filters.add(element);});
                    });
                  }else{
                    setState(() {
                      filters = [FilterItems('+ Filter', 0)];
                    });
                  }
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 15),
            child: Text(filters[index].name, style: TextStyle(fontSize: 15, color: Colors.black),),
          ),
        );
      }else{
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 15),
          child: Text(filters[index].name, style: TextStyle(fontSize: 15, color: Colors.cyan),),
          // child: Row(
          //   children: [
          //     Text(filters[index].name, style: TextStyle(fontSize: 15, color: Colors.cyan),),
          //     SizedBox(width: 4,),
          //     GestureDetector(
          //       onTap: (){
          //         setState(() {
          //           filters.removeAt(index);
          //         });
          //       },
          //       child: Icon(
          //         Icons.cancel,
          //         size: 20,
          //         color: Colors.cyan,
          //       ),
          //     ),
          //   ],
          // ),
        );
      }
    }
    
    Widget _filterListView() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15 ),
        height: 50,
        child: ListView.builder(
            itemCount: filters.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _listChild(index);
            }),
      );
    }

    Widget _allColumnWidget(){
      return Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: TopCategories(),
                )
            ),
            Divider(
              thickness: 1.0,
            ),
            SizedBox(height: 10,),
            _searchBar(),
            // SizedBox(height: 15,),
            _filterListView(),
          ],
        ),
      );
    }


    return Scaffold(
      drawer: Drawer(
        child: drawer(),
      ),
      appBar: customappbar(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: _allColumnWidget()
      ),
    );
  }
}
