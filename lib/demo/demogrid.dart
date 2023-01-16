import 'package:ecom/Details/DetailPage.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../HomePage_Button/model/model_custom_products.dart';

class gridd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: context.canvasColor,

      body: Column(
        children: [
          ClipRRect(
            child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: TopCategories(),
                )),
          ),
          Divider(
            height: 3,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    "TOTAL  1 items",
                    style: TextStyle(color: Colors.cyan),
                  ),
                  trailing: Text(
                    "Clear Cart",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          Divider(),

          Grib().p2().expand(),
          Divider(),
          // _Cupan(),
          Divider(),
          // _CartTotal(),
          //
          Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                height: 70,
                width: 70,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Color(0xffD9F3F2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        // topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                ),
              )),

          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class Grib extends StatefulWidget {
  const Grib({Key? key}) : super(key: key);

  @override
  State<Grib> createState() => _GribState();
}

class _GribState extends State<Grib> {
  List<String> linPink = [
    'assets/Jewellery/image_2022_12_24T18_43_37_625Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_639Z (1).png',
    'assets/Jewellery/image_2022_12_24T18_43_37_643Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_647Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_654Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_656Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_659Z.png',
    'assets/Jewellery/image_2022_12_24T18_43_37_664Z.png'
  ];

  List<String> Price = ['\$20', '\$30', '\$40', '\$50', '\$60', '\$70', '\$80', '\$90'];

  List<String> Titels = [
    'Pandal',
    'Breslet',
    'Earrings',
    'Earrings',
    'Gold Ring',
    'Gold Ring',
    'Necklace',
    'Necklace'
  ];

  List<String> stock = [
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // physics: ScrollPhysics(),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: linPink.length,
        // scrollDirection: Axis.horizontal,

        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 410),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: 270,
                color: Colors.white,
                child: InkWell(
                  onTap: () {

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                                mModelCustomProducts: ModelCustomProducts(),
                              )
                        ));

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => DetailPage(
                    //           mModelCustomProducts: ModelCustomProducts(),
                    //         )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Image.asset(
                          linPink[index],
                          height: 270,
                          // width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[100],
                                // borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {}),
                            ),
                          ),
                        )),
                      ]),
                      Divider(),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              Titels[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      )),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Text(
                              Price[index],
                              style: GoogleFonts.aclonica(
                                textStyle: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\$2",
                              style: GoogleFonts.aclonica(
                                textStyle: TextStyle(
                                    color: Colors.black54,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Text(
                              stock[index],
                              style: GoogleFonts.aclonica(
                                textStyle: TextStyle(
                                    color: Colors.green, fontWeight: FontWeight.w300, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // shadowColor: Colors.black,
          );
        });
  }
}
