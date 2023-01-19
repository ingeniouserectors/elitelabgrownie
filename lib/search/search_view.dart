import 'dart:convert';
import 'dart:developer';

import 'package:ecom/Details/DetailPage.dart';
import 'package:ecom/core/view/app_string.dart';
import 'package:ecom/search/main_filter_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Head_footer/appbar.dart';
import '../Head_footer/drawer.dart';
import '../HomePage_Button/model/model_custom_products.dart';
import '../Main_Page/Cart.dart';
import '../Main_Page/HomePage.dart';
import '../Main_Page/Profile.dart';
import '../Main_Page/catagory.dart';
import '../Main_Page/order.dart';
import '../constant.dart';
import '../core/view/db_provider.dart';
import '../core/view/image_viewer_network.dart';
import '../horizontal_list.dart';
import 'package:http/http.dart' as http;

class FilterItems{
  String name;
  String id;
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
  List<FilterItems> filters = [FilterItems('+ Filter', '')];
  int currentTab = 3;
  List<ModelCustomProducts> products = [];

  List<FilterItems> jewellery = [
    FilterItems('Engagement Rings', '1201'),
    FilterItems('Wedding Bands', '1202'),
    FilterItems('Fashion Rings', '1203'),
    FilterItems('Bracelets', '1204'),
    FilterItems('Necklace', '1205'),
    FilterItems('Pendants', '1206'),
    FilterItems('Earrings', '1207'),
  ];


  List<FilterItems> centerShape = [
    FilterItems('Round', 'Round', imageName: AppIcons.diamond_round),
    FilterItems('Princess', 'Princess', imageName: AppIcons.diamond_princess),
    FilterItems('Marquise', 'Marquise', imageName: AppIcons.diamond_marquise),
    FilterItems('Cushion', 'Cushion', imageName: AppIcons.diamond_cushion),
    FilterItems('Oval', 'Oval', imageName: AppIcons.diamond_oval),
    FilterItems('Pear', 'Pear', imageName: AppIcons.diamond_pear),
    FilterItems('Emerald', 'Emerald', imageName: AppIcons.diamond_emerald),
    FilterItems('Asscher', 'Asscher', imageName: AppIcons.diamond_asscher),
    FilterItems('Radiant', 'Radiant', imageName: AppIcons.diamond_radiant),
    FilterItems('Heart', 'Heart', imageName: AppIcons.diamond_heart),
  ];

  List<FilterItems> metal = [
    FilterItems('White Gold', 'W'),
    FilterItems('Yellow Gold', 'Y'),
    FilterItems('Rose Gold', 'R'),
    FilterItems('Platinum', 'P'),
  ];

  List<FilterItems> selectedJwe = [];
  List<FilterItems> selectedShape = [];
  List<FilterItems> selectedMetal = [];

  String productURL = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    isCart() {
      if (DbProvider().getCart().isNotEmpty) {
        print('not empty------------');
        products.forEach((element) {element.isCart = false;});

        for (int i = 0; i < products.length; i++) {
          for (int j = 0; j < DbProvider().getCart().length; j++) {
            if (DbProvider().getCart()[j].entityId != null &&
                DbProvider().getCart()[j].entityId.toString() ==
                    products[i].entityId.toString()) {
              products[i].isCart = true;
            }
          }
        }
        setState(() {});
      } else {
        setState(() {
          // for (int i = 0; i < products.length; i++) {
          //   products[i].isCart = false;
          // }
          products.forEach((element) {element.isCart = false;});
        });
      }
    }

    _apiCall() async {

      productURL = AppString.seeAll;

      if (txtSearch.text != ''){
        productURL = productURL + '?searchword=${txtSearch.text.replaceAll(" ", "%20")}';
      }

      if (selectedJwe.length > 0){
        List<String> ids = selectedJwe.map((e) {return e.id;}).toList();

        if (txtSearch.text != ''){
          productURL = productURL + '&category_id=${ids.join(',')}';
        }else{
          productURL = productURL + '?category_id=${ids.join(',')}';
        }
      }

      if (selectedShape.length > 0){
        List<String> ids = selectedShape.map((e) {return e.id;}).toList();

        if (txtSearch.text != '' || selectedJwe.length > 0){
          productURL = productURL+'&shapes=${ids.join(',')}';
        }else{
          productURL = productURL+'?shapes=${ids.join(',')}';
        }
      }

      if (selectedMetal.length > 0){
        List<String> ids = selectedMetal.map((e) {return e.id;}).toList();

        if (txtSearch.text != '' || selectedJwe.length > 0 || selectedShape.length > 0){
          productURL = productURL+'&metalcolor=${ids.join(',')}';
        }else{
          productURL = productURL+'?metalcolor=${ids.join(',')}';
        }
      }

      setState(() {
        isLoading = true;
      });

      var headers = {
        "Accept": "application/json",
        "consumerKey": "bbae36baea2ef8dcd1f9a8a88cc59f06",
        "consumerSecret": "5edc426ec2965bba17c96e766c47ad73",
        "oauth_token": "819dc5826cd08cca9c57d392ba2b305e",
        "oauth_token_secret": "97565ea77d5c8c8f7c63b8f5f3916656",
      };

      print('url--$productURL');
      print('Header--$headers');

      var response = await http.get(Uri.parse(productURL), headers: headers);
      print('widget.statusCode--${response.statusCode}');
      log('widget.body--${response.body.toString()}');

      setState(() {
        isLoading = response.body == [];
        products = [];
      });

      Map<String, dynamic> valueMap = jsonDecode(response.body.toString());
      valueMap.forEach((key, value) {
        try {
          ModelCustomProducts streams = ModelCustomProducts.fromJson(value);
          products.add(streams);
        } catch (e) {
          // isLoading = false;
          log('catch--$e');
        }
      });
      print('Total ${products.length} Found');

      setState(() {
        isLoading = false;
        isCart();
      });

    }

    _setSelectedFilter(){
      filters = [FilterItems('+ Filter', '')];

      selectedJwe = jewellery.filter((element) {return element.isSelected == true;}).toList();
      selectedShape = centerShape.filter((element) {return element.isSelected == true;}).toList();
      selectedMetal = metal.filter((element) {return element.isSelected == true;}).toList();

      selectedJwe.forEach((element) {filters.add(element);});
      selectedShape.forEach((element) {filters.add(element);});
      selectedMetal.forEach((element) {filters.add(element);});
      _apiCall();
    }

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
                  setState(() {
                    _apiCall();
                  });
                },
                textInputAction: TextInputAction.search,
                onSubmitted: (str) {
                  // setState(() {
                  //   _apiCall();
                  // });
                },
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
                _apiCall();
              },
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
      );
    }

    
    Widget _listChild(int index, FilterItems filter){
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

                    setState(() {
                      _setSelectedFilter();
                    });
                  }else{
                    setState(() {
                      filters = [FilterItems('+ Filter', '')];
                      selectedJwe = [];
                      selectedShape = [];
                      selectedMetal = [];
                    });
                  }
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 15),
            child: Text(filter.name, style: TextStyle(fontSize: 15, color: Colors.black),),
          ),
        );
      }else{
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 15),
          // child: Text(filters[index].name, style: TextStyle(fontSize: 15, color: Colors.cyan),),
          child: Row(
            children: [
              Text(filter.name, style: TextStyle(fontSize: 15, color: Colors.cyan),),
              SizedBox(width: 4,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    print('-----${filter.name} ${filter.id}----');
                    jewellery.forEach((element) {
                      if (element.id == filter.id){
                        element.isSelected = false;
                      }
                    });

                    centerShape.forEach((element) {
                      if (element.id == filter.id){
                        element.isSelected = false;
                      }
                    });

                    metal.forEach((element) {
                      if (element.id == filter.id){
                        element.isSelected = false;
                      }
                    });
                    _setSelectedFilter();
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
              return _listChild(index, filters[index]);
            }),
      );
    }

    Widget _productImage(ModelCustomProducts product){
      return Container(
        height: 100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageViewerNetwork(
            url:
            product.imageUrl.toString(),
            width: double.infinity,
            height: 250,
            mFit: BoxFit.contain,
          ),
        ),
      );
    }

    Widget _namePrice(ModelCustomProducts product){
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(
              "\$${double.parse(product.finalprice).toStringAsFixed(2)}",
              textAlign: TextAlign.left,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            // Text('\u0024 ${product.finalprice}', style: TextStyle(fontSize: 15),),
          ],
        ),
      );
    }

    _addToCart(ModelCustomProducts product) {
      if (product.isInStock == '1') {
        var data = product;
        data.qty = 1;
        DbProvider().addCart(jsonEncode(data), false, context);
        isCart();
      }
    }

    Widget _productCell(int index, ModelCustomProducts product){
      return InkWell(
        onTap: (){
          Get.to(DetailPage(mModelCustomProducts: product));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 150,
          width: Get.width,
          // color: Colors.red,
          child: Row(
            children: [
              _productImage(product),
              SizedBox(width: 20,),
              _namePrice(product),
              Spacer(),
              product.isCart != null && product.isCart!
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        print('add to cart');
                        _addToCart(product);
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 25,
                        ),
                      ),
                    ),
              // SizedBox(width: 20,),
            ],
          ),
        ),
      );
    }

    Widget _productListView() {
      return Container(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return _productCell(index, products[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
        },
      ),
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
            _filterListView(),
            SizedBox(height: 15,),
            isLoading ? Container(
              height: 60,
              alignment: Alignment.center,
              child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json'),
            ) : products.length == 0 ?
            Container(
              alignment: Alignment.center,
              child: Text('No Product Found', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
            ) : Expanded(child: _productListView()),
          ],
        ),
      );
    }


    return Scaffold(
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[700],
              child: const ImageIcon(AssetImage("assets/images/Bottom/home.png")),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                });
              }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Category(),
                            ));
                        // currentScreen = Category();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/first.png"),
                          color: currentTab == 0 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Order(),
                            ));
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: currentTab == 1 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 220,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Cart(),
                            ));
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/cart.png"),
                          color: currentTab == 4 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 120,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ));
                        currentTab = 5;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/Bottom/profile.png"),
                          color: currentTab == 5 ? Colors.blueAccent[700] : Colors.grey,
                        ),
                        // Text("AP")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
