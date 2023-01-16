import 'package:ecom/HomePage_Button/Diamond_jwellery.dart';
import 'package:ecom/HomePage_Button/Education.dart';
import 'package:ecom/HomePage_Button/mydashboard.dart';
import 'package:ecom/Diamond.dart';
import 'package:ecom/core/view/app_string.dart';
import 'package:ecom/totalorder.dart';
import 'package:ecom/totalearned.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  List<String> linPink = [
    'assets/images/diamond.png',
    'assets/images/jewelry.png',
    'assets/images/pngwing.com (6).png',
    'assets/images/book_1.png',
    'assets/images/ordericon.png',
    'assets/images/pngwing.com (7).png',
  ];

  List<String> Texts = ["Diamond", "Jewelry", "Dashboard", "Education", "Orders", "Points"];

  var colors = [
    Color(0xffE8F8F7),
    Color(0xffE8EDF6),
    Color(0xffEBF4F9),
    Color(0xffE7E7E7),
    Color(0xffE7E7E7),
    Color(0xffE7E7E7),
  ];

  List<Widget> route = [
    DataPage(),
    DiamondJewellery(
      apiUrl: AppString.seeAll,
    ),
    Mydashboard(),
    Education(),
    Totalorderpage(),
    Totalearnpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: linPink.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 95,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => route[index]
                        ));

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => route[index]));
                  },
                  color: colors[index],
                  textColor: Colors.white,
                  child: Image.asset(linPink[index], height: 35),
                  padding: EdgeInsets.all(12),
                  shape: CircleBorder(),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.5),
                ),
                Text(
                  Texts[index],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
