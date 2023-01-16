import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';




class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



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

  List<String> Price = [
    '\$20',
    '\$30',
    '\$40',
    '\$50',
    '\$60',
    '\$70',
    '\$80',
    '\$90'
  ];

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

  List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8"
  ];

  String dropdownvalue = ' 1';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final headerList =
      // height: 590,
       new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: linPink.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      linPink[index],
                      height: 250,
                      width: 200,
                    ),
                  ),
                  Divider(),
                  Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25,bottom: 3,top: 2),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(

                              Titels[index],
                              // textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 18),

                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 25,bottom: 1,top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Price[index], textAlign: TextAlign.left,
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "\$2",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              color: Colors.black54,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25,bottom: 1,top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(
                          stock[index], textAlign: TextAlign.left,
                          style: GoogleFonts.aclonica(
                            textStyle: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });


    final body = new Scaffold(
      appBar: new AppBar(
        title: new Text("ap"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){})
        ],
      ),
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 8.0),
                        child: new Text(
                          'Recent Items',
                          style: new TextStyle(color: Colors.white70),
                        )),
                  ),
                  // new Container(
                      // height: 300.0, width: _width, child: headerList),
                  // new Expanded
                  //   (child:
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: linPink.length,
                    itemBuilder: (context, index) {
                      return Container(

                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 50, bottom: 20),
                                  child: Icon(Icons.remove_circle_outline),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    linPink[index],
                                    height: 200,
                                    width: 250,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Titels[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: (TextStyle(color: Colors.black54)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(Price[index],style: TextStyle(color: Colors.black54),),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.black12, width: 1),
                                          borderRadius: BorderRadius.circular(3.5),
                                        ),
                                        // child: DropdownButtonHideUnderline(
                                        //   child: DropdownButton(
                                        //     // Initial Value
                                        //     value: dropdownvalue,
                                        //
                                        //     // Down Arrow Icon
                                        //     icon: const Icon(Icons.keyboard_arrow_down),
                                        //
                                        //     // Array list of items
                                        //     items: items.map((String items) {
                                        //       return DropdownMenuItem(
                                        //         value: items,
                                        //         child: Text(items),
                                        //       );
                                        //     }).toList(),
                                        //     // After selecting the desired option,it will
                                        //     // change button value to selected value
                                        //     onChanged: (String? newValue) {
                                        //       setState(() {
                                        //         dropdownvalue = newValue!;
                                        //       });
                                        //     },
                                        //   ),
                                        // ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {


                    // if (index % 2  == 0) {
                    //   return Container(height: 50, color: Colors.cyan,)  ;                  }

                    return const SizedBox();

                      },),
            // ),

                   Container(
                      height: 500.0, width: _width, child: headerList),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return new Container(
      decoration: new BoxDecoration(
        color: const Color(0XFFFFFFF),
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            // painter: new Background(),
          ),
          body,
        ],
      ),
    );
  }
}