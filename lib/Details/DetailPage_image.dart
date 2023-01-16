import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Details/video_viewer_asset_big.dart';
import 'package:ecom/Details/video_viewer_asset_thum.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

import '../zoom_image/zoom_image.dart';

class ProductImages extends StatefulWidget {
  final List<String> mLink;
  const ProductImages({super.key, required this.mLink});

  @override
  ProductImagesState createState() => ProductImagesState();
}

class ProductImagesState extends State<ProductImages> {
  var size, height, width;

  Color _favIconColor = Colors.grey[500]!;
  Color _favIconColor1 = Colors.grey[100]!;

  int selectedImage = 0;

  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
  }

  PageController controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    List<Widget> _demo = [
      Container(
        child: Image.asset(
          "assets/images/Mobile_Template_O1.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
      Container(
        child: Image.asset(
          "assets/images/Mobile_Template_O3.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
      Container(
        child: Image.asset(
          "assets/images/Mobile_Template_O2.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    ];
    int _current = 0;
    final CarouselController _controller = CarouselController();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 600,
              height: 600,
              child: PageView.builder(
                itemCount: widget.mLink.length,
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int itemIndex) {
                  return GestureDetector(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            child: FittedBox(
                              fit:BoxFit.contain,
                              child: Container(
                                height: 1200,
                                width: 1000,
                                child:  CarouselSlider(
                                  options: CarouselOptions(
                                      autoPlay: false,
                                      viewportFraction: 1.0,
                                      aspectRatio: 1.0,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _current = index;
                                        });
                                      }
                                  ),
                                  items: <Widget>[
                                    for (var i = 0; i < widget.mLink.length; i++)
                                  getFileExtension(widget.mLink[i].toLowerCase()) ==
                                  "mp4"
                                  ? Center(
                                child: VideoViewerAssetBig(
                                  url: widget.mLink[i],
                                  mHeight: 300,
                                  mWidth: 300,
                                  isPlay: true,
                                ),
                              )
                                  : getFileExtension(
                                  widget.mLink[selectedImage].toLowerCase()) ==
                                  'pdf'
                                  ? const Icon(
                                Icons.picture_as_pdf,
                                color: Colors.red,
                                size: 100,
                              )
                                  :
                                  Zoom_ImageViewerNetwork(
                                      mFit: BoxFit.contain,
                                      url: widget.mLink[i],
                                      // width: width,
                                      // height: height,
                                    ),

                              //     ImageViewerNetwork(
                              //   mFit: BoxFit.contain,
                              //   url: widget.mLink[i],
                              //   // width: width,
                              //   // height: height,
                              // ),
                              //         // Container(
                              //         Container(
                              //           margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                              //           decoration: BoxDecoration(
                              //             image: DecorationImage(
                              //               image: NetworkImage(widget.mLink[i]),
                              //               fit: BoxFit.contain,
                              //             ),
                              //             // border:
                              //             //     Border.all(color: Theme.of(context).accentColor),
                              //             borderRadius: BorderRadius.circular(32.0),
                              //           ),
                              //         ),
                                  ],
                                  carouselController: _controller,
                                ),

                                // child: Stack(
                                //   children: [
                                //     getFileExtension(widget.mLink[selectedImage].toLowerCase()) ==
                                //         "mp4"
                                //         ? Center(
                                //       child: VideoViewerAssetBig(
                                //         url: widget.mLink[selectedImage],
                                //         mHeight: width,
                                //         mWidth: height,
                                //         isPlay: true,
                                //       ),
                                //     )
                                //         : getFileExtension(
                                //         widget.mLink[selectedImage].toLowerCase()) ==
                                //         'pdf'
                                //         ? const Icon(
                                //       Icons.picture_as_pdf,
                                //       color: Colors.red,
                                //       size: 100,
                                //     )
                                //         : ImageViewerNetwork(
                                //       mFit: BoxFit.contain,
                                //       url: widget.mLink[selectedImage],
                                //       width: width,
                                //       height: height,
                                //     ),
                                //     IconButton(
                                //       icon: const Icon(
                                //         Icons.close,
                                //         size: 30,
                                //       ),
                                //       onPressed: () {
                                //         Navigator.pop(context);
                                //       },
                                //     ),
                                //   ],
                                // ),
                              ),
                            ),
                          ));
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: getFileExtension(widget.mLink[selectedImage].toLowerCase()) == "mp4"
                          ? VideoViewerAssetBig(
                        url: widget.mLink[selectedImage],
                        mHeight: 850,
                        mWidth: 550,
                        isPlay: true,
                      )
                          : ImageViewerNetwork(
                        mFit: BoxFit.contain,
                        url: widget.mLink[selectedImage],
                        width: width,
                        height: height,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _favIconColor1,
                      // borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:
                    //
                    IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        icon: _favIconColor == Colors.red
                            ? Icon(Icons.favorite, color: _favIconColor)
                            : Icon(Icons.favorite_outline, color: _favIconColor),
                        onPressed: () {
                          // selectedImage = index;

                          setState(() {
                            // selectedImage = index;
                            if (_favIconColor == Colors.grey[500]) {
                              _favIconColor = Colors.red;
                              _favIconColor1 = Colors.red[100]!;
                            } else {
                              _favIconColor = Colors.grey[500]!;
                              _favIconColor1 = Colors.grey[100]!;
                            }
                          });
                        }),
                    // icon: Icon(
                    //   Icons.favorite_border,
                    //   color: _favIconColor,
                    //   size: 20,
                    // ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        /*Container(
            height: 180,
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.mLink.length,
              itemBuilder: (BuildContext context, int index) => buildSmallProductPreview(index),
            ))*/
        Container(
            height: 180,
            padding: const EdgeInsets.only(left: 10),
            child: SingleChildScrollView(scrollDirection :Axis.horizontal,child: Row(children: List.generate(widget.mLink.length, (index) => buildSmallProductPreview(index)),)))
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
        onTap: () {
          controller.animateToPage(index,
              curve: Curves.decelerate, duration: Duration(milliseconds: 300)); //

          setState(() {
            selectedImage = index;
            try {} catch (e) {
              ///Error
            }
          });
          // videoPlay();
        },
        child: Container(
          height: 180,
          padding: EdgeInsets.only(top: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.all(8),
            height: 90,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: (selectedImage == index) ? Color(0xff5FC2BF).withOpacity(1) : Colors.grey,
                // color: const Color(0xff5FC2BF).withOpacity(selectedImage == index ? 1 : 0)),
              ),
            ),
            child: getFileExtension(widget.mLink[index].toLowerCase()) == "mp4"
                ? VideoViewerAssetThum(
              url: widget.mLink[index],
              mHeight: 90,
              mWidth: 90,
              isPlay: false,
            )
                : ImageViewerNetwork(
              mFit: BoxFit.contain,
              url: widget.mLink[index],
              width: 90,
              height: 90,
            ) /*VideoPlayerController.asset('assets/Butterfly-209.mp4')*/,
          ),
        ));
  }

  String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }
}
