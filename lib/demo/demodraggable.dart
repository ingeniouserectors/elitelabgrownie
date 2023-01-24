import 'package:ecom/Details/video_viewer_asset_edu.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/core/view/text_increase.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Details/video_viewer_asset.dart';
import '../Main_Page/Cart.dart';
import '../Main_Page/Profile.dart';
import '../Main_Page/catagory.dart';
import '../Main_Page/order.dart';
import '../bottom_navigation.dart';
import '../webview/videoplayer.dart';

class DraggableScrollableSheetExample extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample> createState() => _DraggableScrollableSheetExampleState();
}

class _DraggableScrollableSheetExampleState extends State<DraggableScrollableSheetExample> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];
  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationView(),
        drawer: const Drawer(
          child: drawer(),
        ),
        appBar: const customappbar(),
        body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: Stack(children: [
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.only(top: 60.0),
                    child: SizedBox(
                      width: double.infinity,
                      child:
                          // VideoApp(),
                          const VideoViewerAssetEdu(
                        url: "https://overnightmountings.com/media/whatcustomersay.mp4",
                        mHeight: 600,
                        mWidth: 600,
                        isPlay: true,
                      ),
                    ),
                    //  child:
                    // //  Image.asset(
                    // //   "assets/nimage/compare2_detail.png",

                    // //   // height: 270,
                    // //   width: double.infinity,
                    // //   fit: BoxFit.fill,
                    // // ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          color: Colors.white,
                          child:
                              //co
                              TopCategories(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 55,
                      margin: const EdgeInsets.only(top: 100),
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextIncrease(
                        fontSize: fontSize,
                        newFontSize: (value) {
                          setState(() {
                            fontSize = value;
                          });
                        },
                      ))
                  // Padding(
                  // padding: const EdgeInsets.all(6.0)

                  // ),
                ]),
              ),
              _buildDraggableScrollableSheet(),
            ],
          ),
        ));
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "What Consumers Say About Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Lab grown diamonds (also known as lab created diamonds, man made diamonds, engineered diamonds, and cultured diamonds) are grown in highly controlled laboratory environments using advanced technological processes that duplicate the conditions under which diamonds naturally develop when they form in the mantle, beneath the Earth’s crust. These lab created diamonds consist of actual carbon atoms arranged in the characteristic diamond crystal structure. Since they are made of the same material as natural diamonds, they exhibit the same optical and chemical properties. \n\n Our lab created diamonds are readily available in a variety of colorless ranges. Our lab created diamonds are also available in fancy colors that are considered very rare in nature, including popular hues of vivid yellow. Fancy colored lab created diamonds sell at comparatively reasonable prices compared to their natural colored diamond counterparts. Lab grown diamonds (also known as lab created diamonds, man made diamonds, engineered diamonds, and cultured diamonds) are grown in highly controlled laboratory environments using advanced technological processes that duplicate the conditions under which diamonds naturally develop when they form in the mantle, beneath the Earth’s crust. These lab created diamonds consist of actual carbon atoms arranged in the characteristic diamond crystal structure. Since they are made of the same material as natural diamonds, they exhibit the same optical and chemical properties. \n\n Our lab created diamonds are readily available in a variety of colorless ranges. Our lab created diamonds are also available in fancy colors that are considered very rare in nature, including popular hues of vivid yellow. Fancy colored lab created diamonds sell at comparatively reasonable prices compared to their natural colored diamond counterparts.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetExample1 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample1> createState() => _DraggableScrollableSheetExample1State();
}

class _DraggableScrollableSheetExample1State extends State<DraggableScrollableSheetExample1> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/why_choose_detail.png",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "Why Choose Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Mining Free \nLab grown diamonds are a responsible choice given that no mining is required. \n\nBeauty & Quality \nLab grown diamonds have the same physical, chemical, and optical properties as mined diamonds. \n\n Value \nLab grown diamonds offer excellent value. They are more cost-effective than natural diamonds of comparable size and quality. Mining Free \nLab grown diamonds are a responsible choice given that no mining is required. \n\nBeauty & Quality \nLab grown diamonds have the same physical, chemical, and optical properties as mined diamonds. \n\n Value \nLab grown diamonds offer excellent value. They are more cost-effective than natural diamonds of comparable size and quality. Mining Free \nLab grown diamonds are a responsible choice given that no mining is required. \n\nBeauty & Quality \nLab grown diamonds have the same physical, chemical, and optical properties as mined diamonds. \n\n Value \nLab grown diamonds offer excellent value. They are more cost-effective than natural diamonds of comparable size and quality. Mining Free \nLab grown diamonds are a responsible choice given that no mining is required. \n\nBeauty & Quality \nLab grown diamonds have the same physical, chemical, and optical properties as mined diamonds. \n\n Value \nLab grown diamonds offer excellent value. They are more cost-effective than natural diamonds of comparable size and quality.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetExample2 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample2> createState() => _DraggableScrollableSheetExample2State();
}

class _DraggableScrollableSheetExample2State extends State<DraggableScrollableSheetExample2> {
  double fontSize = 18;
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Container(
                  color: Colors.black,
                  width: double.infinity,
                  child: VideoViewerAssetEdu(
                    url: "https://overnightmountings.com/media/HowareLabGrownDiamondsMade.mp4",
                    mHeight: 600,
                    mWidth: 600,
                    isPlay: true,
                  ),
                ),
                //  child:
                // //  Image.asset(
                // //   "assets/nimage/compare2_detail.png",

                // //   // height: 270,
                // //   width: double.infinity,
                // //   fit: BoxFit.fill,
                // // ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "How Are Lab Grown Diamonds Made",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Our lab grown diamonds are created from the tiny carbon seeds of pre-existing diamonds. Advanced technology – either extreme pressure and heat or a special deposition process known as CVD – mimics the method of natural diamond formation. Some man made diamonds created through deposition may also undergo pressure and heat treatment after they are grown. Man made fancy colored diamonds are formed when small amounts of specific trace elements are present during the growth phase of the created diamond, just like in nature. In both white and fancy colored man made diamonds, the exact composition of trace elements may differ from their natural diamond counterparts. A man made diamond can only be distinguished from natural diamonds using specialized equipment that can detect the minor differences in trace elements and crystal growth. Our lab grown diamonds are created from the tiny carbon seeds of pre-existing diamonds. Advanced technology – either extreme pressure and heat or a special deposition process known as CVD – mimics the method of natural diamond formation. Some man made diamonds created through deposition may also undergo pressure and heat treatment after they are grown. Man made fancy colored diamonds are formed when small amounts of specific trace elements are present during the growth phase of the created diamond, just like in nature. In both white and fancy colored man made diamonds, the exact composition of trace elements may differ from their natural diamond counterparts. A man made diamond can only be distinguished from natural diamonds using specialized equipment that can detect the minor differences in trace elements and crystal growth.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }
}

class DraggableScrollableSheetExample3 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample3> createState() => _DraggableScrollableSheetExample3State();
}

class _DraggableScrollableSheetExample3State extends State<DraggableScrollableSheetExample3> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/compare_detail.png",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "Lab Grown Diamonds vs. Diamond Simulants",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "It is important to note the major distinction between lab grown diamonds and diamond simulants. Diamond simulants, such as cubic zirconia and moissanite, look similar to diamonds but are not true carbon crystals. Simulants do not have the same chemical and physical properties as natural diamonds and therefore sell at much lower prices than lab created diamonds. Simulants can be distinguished from natural or lab created diamonds using only the naked eye. \n\n Natural and lab created diamonds have thermal conductivity properties that differentiate them from cubic zirconia with a handheld diamond tester. Some lab created diamonds, along with some natural colored diamonds, may be mistakenly identified as moissanites when using certain diamond testers due to similarity in their electrical conductivity. However, gemologists can typically distinguish between diamond and moissanite due to their differing refractive properties, with moissanites being double refractive and diamonds being single refractive. Learn more about moissanite vs. diamond. It is important to note the major distinction between lab grown diamonds and diamond simulants. Diamond simulants, such as cubic zirconia and moissanite, look similar to diamonds but are not true carbon crystals. Simulants do not have the same chemical and physical properties as natural diamonds and therefore sell at much lower prices than lab created diamonds. Simulants can be distinguished from natural or lab created diamonds using only the naked eye. \n\n Natural and lab created diamonds have thermal conductivity properties that differentiate them from cubic zirconia with a handheld diamond tester. Some lab created diamonds, along with some natural colored diamonds, may be mistakenly identified as moissanites when using certain diamond testers due to similarity in their electrical conductivity. However, gemologists can typically distinguish between diamond and moissanite due to their differing refractive properties, with moissanites being double refractive and diamonds being single refractive. Learn more about moissanite vs. diamond.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

///--------01
class DraggableScrollableSheetExample01 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample01> createState() =>
      _DraggableScrollableSheetExample01State();
}

class _DraggableScrollableSheetExample01State extends State<DraggableScrollableSheetExample01> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/what_are_lab_grown_diamonds_detail.png",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "What Are Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Lab grown diamonds (also known as lab created diamonds, man made diamonds, engineered diamonds, and cultured diamonds) are grown in highly controlled laboratory environments using advanced technological processes that duplicate the conditions under which diamonds naturally develop when they form in the mantle, beneath the Earth’s crust. These lab created diamonds consist of actual carbon atoms arranged in the characteristic diamond crystal structure. Since they are made of the same material as natural diamonds, they exhibit the same optical and chemical properties. \n\n Our lab created diamonds are readily available in a variety of colorless ranges. Our lab created diamonds are also available in fancy colors that are considered very rare in nature, including popular hues of vivid yellow. Fancy colored lab created diamonds sell at comparatively reasonable prices compared to their natural colored diamond counterparts. Lab grown diamonds (also known as lab created diamonds, man made diamonds, engineered diamonds, and cultured diamonds) are grown in highly controlled laboratory environments using advanced technological processes that duplicate the conditions under which diamonds naturally develop when they form in the mantle, beneath the Earth’s crust. These lab created diamonds consist of actual carbon atoms arranged in the characteristic diamond crystal structure. Since they are made of the same material as natural diamonds, they exhibit the same optical and chemical properties. \n\n Our lab created diamonds are readily available in a variety of colorless ranges. Our lab created diamonds are also available in fancy colors that are considered very rare in nature, including popular hues of vivid yellow. Fancy colored lab created diamonds sell at comparatively reasonable prices compared to their natural colored diamond counterparts.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

///--------4
class DraggableScrollableSheetExample4 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample4> createState() => _DraggableScrollableSheetExample4State();
}

class _DraggableScrollableSheetExample4State extends State<DraggableScrollableSheetExample4> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/comparelab_detail.jpg",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "Lab Grown Diamonds vs. Natural Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Our lab grown diamonds display the same physical, chemical, and optical characteristics as natural diamonds, and exhibit the same fire, scintillation, and sparkle. Using a jewelry loupe, lab created diamonds are nearly impossible to differentiate from natural diamonds. Lab created diamonds may exhibit different trace elements than natural diamonds that do not affect the appearance of the diamond. Lab created diamonds can be distinguished from natural diamonds only with tests using specialized equipment. Lab created diamonds available for purchase should always come with a gem certification identifying them as laboratory grown. \n\n Select your perfect lab created diamond by searching our online inventory. Or search our selection of Beyond Conflict Free™ natural diamonds. Once selected, lab created diamonds can be expertly set in the recycled gold or platinum setting of your choice. Our lab grown diamonds display the same physical, chemical, and optical characteristics as natural diamonds, and exhibit the same fire, scintillation, and sparkle. Using a jewelry loupe, lab created diamonds are nearly impossible to differentiate from natural diamonds. Lab created diamonds may exhibit different trace elements than natural diamonds that do not affect the appearance of the diamond. Lab created diamonds can be distinguished from natural diamonds only with tests using specialized equipment. Lab created diamonds available for purchase should always come with a gem certification identifying them as laboratory grown. \n\n Select your perfect lab created diamond by searching our online inventory. Or search our selection of Beyond Conflict Free™ natural diamonds. Once selected, lab created diamonds can be expertly set in the recycled gold or platinum setting of your choice.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetExample5 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample5> createState() => _DraggableScrollableSheetExample5State();
}

class _DraggableScrollableSheetExample5State extends State<DraggableScrollableSheetExample5> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/compare2.png",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "What Are The Benefits of Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "A diamond that is created in a lab is just as real as a mined diamond. They have the same physical and chemical properties and are grown under the same temperature and pressure conditions, but without the conflict and questionable ethical practices that are common in some diamond mines. In fact, lab created diamonds are often of better quality due to the highly controlled environment and fully monitored process. Some of the biggest advantages of a lab created diamond include: \n\nMore beautiful due to better, brighter quality and higher purity \n \u25CF Fewer defectsEnvironmentally friendly \n \u25CF Greater affordability\n \u25CF Colors that are rarely found in nature can be created, making unique and coveted pieces more obtainable\n \u25CF Trackable origin sources allow you to source diamonds from reputable places that don't engage in poor treatment of workers or communities  \n\n Lab created diamonds are grown through a sustainable process using chemical vapor deposition (CVD), making it easier to keep up with demand without sacrificing quality or engaging in harmful processes or conflicts. A diamond that is created in a lab is just as real as a mined diamond. They have the same physical and chemical properties and are grown under the same temperature and pressure conditions, but without the conflict and questionable ethical practices that are common in some diamond mines. In fact, lab created diamonds are often of better quality due to the highly controlled environment and fully monitored process. Some of the biggest advantages of a lab created diamond include: \n\nMore beautiful due to better, brighter quality and higher purity \n \u25CF Fewer defectsEnvironmentally friendly \n \u25CF Greater affordability\n \u25CF Colors that are rarely found in nature can be created, making unique and coveted pieces more obtainable\n \u25CF Trackable origin sources allow you to source diamonds from reputable places that don't engage in poor treatment of workers or communities  \n\n Lab created diamonds are grown through a sustainable process using chemical vapor deposition (CVD), making it easier to keep up with demand without sacrificing quality or engaging in harmful processes or conflicts. ",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetExample6 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample6> createState() => _DraggableScrollableSheetExample6State();
}

class _DraggableScrollableSheetExample6State extends State<DraggableScrollableSheetExample6> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  double fontSize = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/education7 (1).jpg",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "How Are Lab Grown Diamonds Certified And Graded",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "All lab grown diamonds are treated the same as mined diamonds. Once they are ready, they are sent to an independent gem lab to be certified by an expert. \n\n  The process for grading lab grown diamonds is the same as traditional diamonds and focuses on the cut, clarity, carat, and color of each gemstone. The cut is responsible for the brilliance of the diamond, and arguably the most important factor. Clarity refers to the appearance and lack of cracks and defects. When referencing clear diamonds, the lack of color makes a higher grade. Finally, carat is the measure of the diamond's size and weight. Each diamond is examined carefully and assigned a quality rating. \n\n A piece of diamond jewelry can be a wonderful gift for yourself or someone you love. Diamonds are highly versatile and can be worn as everyday jewelry, or for special occasions. When you choose a lab grown diamond, you can invest in a high-quality and stunning piece that is also ethical and environmentally friendly. All lab grown diamonds are treated the same as mined diamonds. Once they are ready, they are sent to an independent gem lab to be certified by an expert. \n\n  The process for grading lab grown diamonds is the same as traditional diamonds and focuses on the cut, clarity, carat, and color of each gemstone. The cut is responsible for the brilliance of the diamond, and arguably the most important factor. Clarity refers to the appearance and lack of cracks and defects. When referencing clear diamonds, the lack of color makes a higher grade. Finally, carat is the measure of the diamond's size and weight. Each diamond is examined carefully and assigned a quality rating. \n\n A piece of diamond jewelry can be a wonderful gift for yourself or someone you love. Diamonds are highly versatile and can be worn as everyday jewelry, or for special occasions. When you choose a lab grown diamond, you can invest in a high-quality and stunning piece that is also ethical and environmentally friendly.",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class DraggableScrollableSheetExample7 extends StatefulWidget {
  @override
  State<DraggableScrollableSheetExample7> createState() => _DraggableScrollableSheetExample7State();
}

class _DraggableScrollableSheetExample7State extends State<DraggableScrollableSheetExample7> {
  List<String> linPink = [
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_09_253Z.png',
    'assets/diamond_shape/image_2022_12_29T12_34_26_100Z.png'
  ];

  double fontSize = 18;
  Widget currentScreen = DraggableScrollableSheetExample();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BottomHomeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationView(),
      drawer: const Drawer(
        child: drawer(),
      ),
      appBar: const customappbar(),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 95.0),
                child: Image.asset(
                  "assets/nimage/education8 (1).jpg",
                  // height: 270,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      color: Colors.white,
                      child:
                          //co
                          TopCategories(),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: TextIncrease(
                    fontSize: fontSize,
                    newFontSize: (value) {
                      setState(() {
                        fontSize = value;
                      });
                    },
                  ))
              // Padding(
              // padding: const EdgeInsets.all(6.0)

              // ),
            ]),
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue, width: 2),

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, left: 30, bottom: 30, right: 30),
                          child: Text(
                            "What Are Sustainably Rated Lab Grown Diamonds",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. Together, with our partners, we are creating new standards in sustainable lab grown diamond production. This collection of lab grown diamonds is independently Sustainably Rated based on climate neutrality efforts and investments in clean technology, enhancing an already responsible choice. ",
                            style:
                                TextStyle(fontSize: fontSize, color: Colors.grey[670], height: 1.5),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
