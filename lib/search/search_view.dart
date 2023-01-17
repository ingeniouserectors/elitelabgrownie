import 'package:ecom/search/main_filter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Head_footer/appbar.dart';
import '../horizontal_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  TextEditingController txtSearch = TextEditingController();
  List<String> filters = ['+ Filter'];

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
          onTap: (){
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                isScrollControlled: true,
                enableDrag: false,
                builder: (BuildContext context) {
                  return MainFilterView(filters: filters,);
                });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 15),
            child: Text(filters[index], style: TextStyle(fontSize: 15, color: Colors.black),),
          ),
        );
      }else{
        return Container(
          // color: Colors.black,
          padding: EdgeInsets.only(right: 15),
          child: Row(
            children: [
              Text(filters[index], style: TextStyle(fontSize: 15, color: Colors.cyan),),
              SizedBox(width: 4,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    filters.removeAt(index);
                  });
                },
                child: Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
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
