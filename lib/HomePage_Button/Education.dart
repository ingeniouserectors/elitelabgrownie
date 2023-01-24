
import 'package:ecom/Details/video_viewer_asset_screen.dart';
import 'package:ecom/Head_footer/appbar.dart';
import 'package:ecom/Main_Page/Cart.dart';
import 'package:ecom/Main_Page/HomePage.dart';
import 'package:ecom/Main_Page/Profile.dart';
import 'package:ecom/Main_Page/catagory.dart';
import 'package:ecom/Head_footer/drawer.dart';
import 'package:ecom/demo/swippage.dart';
import 'package:ecom/horizontal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import '../bottom_navigation.dart';
import 'Diamond_jwellery.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> with WidgetsBindingObserver {

  Widget currentScreen = Education();
  final PageStorageBucket bucket = PageStorageBucket();

  List<String> linPink = [
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
    'assets/images/bridal.png',
    'assets/images/custom.png',
    'assets/images/Main_banner_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    double iconheight = MediaQuery.of(context).size.height;
    double iconwidth = MediaQuery.of(context).size.width;
    String? law;

    return Scaffold(
        floatingActionButton: BottomHomeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationView(),
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: customappbar(),
        body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       Color(0xff2297C3),
          //       Color(0xff0A9695),
          //     ]
          //   )
          //
          // ),
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: ClipRRect(
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: TopCategories(),
                        )),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 700,
                            child: Center(
                              child: ListView(
// mainAxisAlignment:
//     MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 14),
                                              child: Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  height: 10,
                                                  width: 80,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        ExpansionTile(
                                            initiallyExpanded: true,
                                            title: Text(
                                              "Sort by",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, bottom: 4, left: 11, right: 11),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Date : Latest",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Date : Oldest",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, bottom: 4, left: 11, right: 11),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Price : Low to High",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Price : High to Low",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, bottom: 4, left: 11, right: 11),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Title : A to Z",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffEBEBEB),
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            "Title : Z to A",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                        ExpansionTile(
                                            initiallyExpanded: true,
                                            title: Text(
                                              "By Price",
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            children: [
                                              Container(
// margin: EdgeInsets.all(1.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    RangeSliderItem(
                                                      title: '',
                                                      initialMinValue: 20,
                                                      initialMaxValue: 80,
                                                      onMinValueChanged: (v) {},
                                                      onMaxValueChanged: (v) {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: ImageIcon(
                            AssetImage("assets/images/read-book-icon.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 440, top: 0),
                          child: Text(
                            "Education Filter",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                          ),
                          child: Icon(
                            Icons.expand_more,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                _Educations().p2().expand(),
              ],
            ),
          ),
        ));
  }
}

class _Educations extends StatefulWidget {
  @override
  _EducationsState createState() => _EducationsState();
}

class _EducationsState extends State<_Educations> {
  VideoPlayerController? _controller;
  VideoPlayerController? _controller2;

  List<String> linPink = [
    'assets/images/consumers.jpeg',
    'assets/nimage/1.png',
    'assets/nimage/6.jpg',
    'assets/nimage/2.png',
    'assets/images/grown_diamonds.jpeg',
    'assets/nimage/5.png',
    'assets/nimage/compare23.png',
    'assets/nimage/education7_list.jpg',
    'assets/nimage/education8_list.jpg'
  ];

  List<String> Price = [
    'Lab grown diamonds (also known as lab created diamonds,man \nmade  diamonds, engineered diamonds, and cultured  diamonds) \nare grown in highly controlled laboratory environments using \nadvanced technological processes.',
    'Lab grown diamonds (also known as lab created diamonds,man \nmade  diamonds, engineered diamonds, and cultured  diamonds) \nare grown in highly controlled laboratory environments using \nadvanced technological processes.',
    'Our lab grown diamonds display the same physical, chemical, and \noptical characteristics as natural diamonds, and exhibit the same \nfire scintillation, and sparkle. ',
    'Lab grown diamonds are a responsible choice given that no mining \n is required.',
    'Our lab grown diamonds are created from the tiny carbon seeds of \n pre-existing diamonds. Advanced technology – either extreme pressure \nand heat or a special deposition process known as CVD – mimics \nthe method of natural diamond formation.',
    'It is important to note the major distinction between lab grown\ndiamonds and diamond simulants. Diamond simulants, such as  cubic \nzirconia andmoissanite, look similar to diamonds but are not true carbon .',
    'A diamond that is created in a lab is just as real as a mined diamond. \nThey have the same physical and chemical properties and are grown \nunder the same temperature and pressure conditions, but without \nthe conflict and questionable ethical practices that are common \nin some diamond mines.',
    'All lab grown diamonds are treated the same as mined diamonds. Once \n they are ready, they are sent to an independent gem lab to be certified \nby an expert.',
    'Together, with our partners, we are creating new standards in sustainable \n lab grown diamond production. ',
  ];

  List<String> Titels = [
    "What Consumers Say About Lab Grown Diamonds",
    "What Are Lab Grown Diamonds",
    "Lab Grown Diamonds vs. Natural Diamonds",
    "Why Choose Lab Grown Diamonds",
    "How Are Lab Grown Diamonds Made",
    "Lab Grown Diamonds vs. Diamond Simulants",
    "What Are The Benefits of Lab Grown Diamonds",
    "How Are Lab Grown Diamonds Certified And Graded",
    "What Are Sustainably Rated Lab Grown Diamonds",
  ];

  // Color primaryBlue = Color(0xFF586894);

  String dropdownvalue = ' 1';

// List of items in our dropdown menu

  @override
  void initState() {
    super.initState();
    videoPlay();
    //_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // scrollDirection: Axis.vertical,
      itemCount: linPink.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  try {
                    _controller2!.pause();
                  } catch (e) {
                    ///error
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                      SwipePage(
                                  index: index,
                                )
                      ));

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => SwipePage(
                  //           index: index,
                  //         )));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child:
                          // AspectRatio(
                          //   aspectRatio: 1,
                          //   child: getFileExtension(linPink[index].toLowerCase()) == "mp4"
                          //       ? VideoViewerAsset(
                          //     controller: _controller2!,
                          //     url: linPink[index],
                          //     mHeight: 150,
                          //     mWidth: 250,
                          //     isPlay: true,
                          //   )
                          //       : Image.asset(
                          //       linPink[index],
                          //       height: 150,
                          //       width: 250,
                          //     ),
                          //
                          //   ),

                          getFileExtension(linPink[index].toLowerCase()) == "mp4"
                              ? Center(
                                  child: VideoViewerAssetScreen(
                                    controller: _controller2!,
                                    url:
                                        "https://overnightmountings.com/media/HowareLabGrownDiamondsMade.mp4",
                                    mHeight: 150,
                                    mWidth: 260,
                                    isPlay: true,
                                  ),
                                )
                              : Image.asset(
                                  linPink[index],
                                  fit: BoxFit.fitWidth,
                                  height: 150,
                                  width: 260,
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15, top: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Titels[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            style: TextStyle(color: Colors.grey[900], fontSize: 18),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Text(
                                Price[index],
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[670],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
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

  void videoPlay() {
    if (getFileExtension("assets/nimage/daimond_video.mp4".toLowerCase()) == "mp4") {
      try {
        _controller = VideoPlayerController.asset("assets/nimage/daimond_video.mp4")
          ..initialize().then((_) {
            _controller!.addListener(() {
              //custom Listner
              setState(() {
                if (!_controller!.value.isPlaying &&
                    _controller!.value.isInitialized &&
                    (_controller!.value.duration == _controller!.value.position)) {
                  //checking the duration and position every time
                  //widget.playDone();
                }
              });
            });
            setState(() {});
            _controller!.play();
          });
      } catch (e) {
        ///
      }

      _controller2 = VideoPlayerController.network(
          "https://overnightmountings.com/media/HowareLabGrownDiamondsMade.mp4")
        ..initialize().then((_) {
          _controller2!.addListener(() {
            //custom Listner
            setState(() {
              if (!_controller2!.value.isPlaying &&
                  _controller2!.value.isInitialized &&
                  (_controller2!.value.duration == _controller2!.value.position)) {
                //checking the duration and position every time
                //widget.playDone();
              }
            });
          });
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _controller2!.dispose();
    super.dispose();
  }
}
