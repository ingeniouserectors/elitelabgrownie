import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Details/video_viewer_asset_big.dart';
import 'package:ecom/core/view/image_viewer_network.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../pdfview/demopdf.dart';
import '../webview/webview.dart';
import '../zoom_image/zoom_image.dart';

class DaimondProductImages extends StatefulWidget {
  final List<String> mFile;
  const DaimondProductImages({super.key, required this.mFile});

  @override
  DaimondProductImagesState createState() => DaimondProductImagesState();
}

class DaimondProductImagesState extends State<DaimondProductImages> {
  int _current = 0;
  final CarouselController carouselController = CarouselController();

  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  var size, height, width;

  List<String> mLink = [];
  int selectedImage = 0;
  Color _favIconColor = Colors.grey[500]!;
  Color _favIconColor1 = Colors.grey[100]!;
  late FlickManager flickManager;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    setState(() {
      mLink = widget.mFile;
    });
    videoPlay();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color:  Color(0XFFE4E9FF),
              width: 780,
              height: 700,
              child: GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context,
                      builder: (_) => Dialog(
                            child: Container(
                              child: FittedBox(
                              fit:BoxFit.contain,
                              child: Container(
                                height: 1200,
                                width: 1000,
                                child:  CarouselSlider(
                                  items: <Widget>[
                                    for (var i = 0; i < mLink.length; i++)
                                      getFileExtension(mLink[i].toLowerCase()) ==
                                          "mp4"
                                          ? Center(
                                        child: VideoViewerAssetBig(
                                          url: mLink[i],
                                          mHeight: 300,
                                          mWidth: 300,
                                          isPlay: true,
                                        ),
                                      )
                                          : getFileExtension(
                                          mLink[selectedImage].toLowerCase()) ==
                                          'pdf'
                                          ? const Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.red,
                                        size: 100,
                                      )
                                          :
                                      Zoom_ImageViewerNetwork(
                                        mFit: BoxFit.contain,
                                        url: mLink[i],
                                        // width: width,
                                        // height: height,
                                      ),
                                      // ImageViewerNetwork(
                                      //   mFit: BoxFit.contain,
                                      //   url: mLink[i],
                                      //   // width: width,
                                      //   // height: height,
                                      // ),
                                  ],
                                  carouselController: carouselController,
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
                              // Stack(
                              //   children: [
                              //     getFileExtension(mLink[selectedImage].toLowerCase()) == "mp4"
                              //         ? Center(
                              //             child: VideoViewerAsset(
                              //               controller: _controller2,
                              //               url: mLink[selectedImage],
                              //               mHeight: width,
                              //               mWidth: height,
                              //               isPlay: true,
                              //             ),
                              //           )
                              //         : getFileExtension(mLink[selectedImage].toLowerCase()) ==
                              //                 'pdf'
                              //             ? MyHomePage(
                              //                 pdflink: mLink[selectedImage].toString(),
                              //               )
                              //             : getFileExtension(mLink[selectedImage].toLowerCase()) ==
                              //                     'html'
                              //                 ? webcon(
                              //                    // uri: mLink[selectedImage].toString(),
                              //                    uri: "https://www.youtube.com/",
                              //                   )
                              //                 : ImageViewerNetwork(
                              //                     mFit: BoxFit.contain,
                              //                     url: mLink[selectedImage],
                              //                     width: width,
                              //                     height: height,
                              //                   ),
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
                          ));
                },
                child: mLink.isNotEmpty
                    ? AspectRatio(
                        aspectRatio: 1,
                        child: getFileExtension(mLink[selectedImage].toLowerCase()) == "mp4"
                            ?
                            // ImageViewerNetwork(
                            //   mFit: BoxFit.contain,
                            //   url: "https://www.overnightmountings.com/media/images/360-degrees-video-play-icon.jpg",
                            //   height: 90,
                            //   width: 90,
                            // )
                            VideoViewerAssetBig(
                                url: mLink[selectedImage],
                                mHeight: height,
                                mWidth: width,
                                isPlay: true,
                              )
                            : getFileExtension(mLink[selectedImage].toLowerCase()) == 'pdf'
                                ? MyHomePage(
                                    pdflink: mLink[selectedImage].toString(),
                                  )
                                : getFileExtension(mLink[selectedImage].toLowerCase()) == 'html'
                                    ?
                        // Stack(
                        //                 children: [
                        //                   IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        //                   // V1App( uri: mLink[selectedImage].toString(),),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 50),
                                            child: webcon(
                                              uri: mLink[selectedImage].toString(),
                                            ),
                                          )
                                    :
                        ImageViewerNetwork(
                                       // mFit: BoxFit.scaleDown,
                                        url: mLink[selectedImage],
                                        // height: 250,
                                        // width: 250,
                                      ),
                      )
                    : Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        child: Text(
                          'No Image',
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
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
              itemCount: mLink.length,
              itemBuilder: (BuildContext context, int index) => buildSmallProductPreview(index),
            ))*/
        Container(
            height: 180,
            padding: const EdgeInsets.only(left: 10),
            child: SingleChildScrollView(scrollDirection :Axis.horizontal,child: Row(children: List.generate(mLink.length, (index) => buildSmallProductPreview(index)),)))
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedImage = index;
            videoPlay();
          });
        },
        child: Container(
          padding: const EdgeInsets.only(top: 12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.all(8),
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    (selectedImage == index) ? const Color(0xff5FC2BF).withOpacity(1) : Colors.grey,
                //Color(0xff8ec7ff).withOpacity(1),
                // color: const Color(0xff5FC2BF).withOpacity(selectedImage == index ? 1 : 0)),
              ),
            ),
            child: getFileExtension(mLink[index].toLowerCase()) == "mp4"
                ? ImageViewerNetwork(
                    mFit: BoxFit.contain,
                    url:
                        "https://www.overnightmountings.com/media/images/360-degrees-video-play-icon.jpg",
                    height: 90,
                    width: 90,
                  )
                // VideoViewerAssetThum(
                //         url: mLink[index],
                //         mHeight: 90,
                //         mWidth: 90,
                //         isPlay: false,
                //       )
                : getFileExtension(mLink[index].toLowerCase()) == 'pdf'
                    ? ImageViewerNetwork(
                        mFit: BoxFit.contain,
                        url: "https://www.overnightmountings.com/media/images/certificate.png",
                        height: 90,
                        width: 90,
                      )

                    // Container(
                    //   child: Image.network("https://www.overnightmountings.com/media/images/certificate.png"),
                    // )
                    // const Icon(
                    //             Icons.picture_as_pdf,
                    //             color: Colors.red,
                    //             size: 50,
                    //           )
                    : getFileExtension(mLink[index].toLowerCase()) == 'html'
                        ? ImageViewerNetwork(
                            mFit: BoxFit.contain,
                            url:
                                "https://www.overnightmountings.com/media/images/360-degrees-video-play-icon.jpg",
                            height: 90,
                            width: 90,
                          )
                        // const Icon(
                        //   Icons.video_collection_outlined,
                        //   color: Colors.grey,
                        //   size: 50,
                        // )

                        : ImageViewerNetwork(
                            mFit: BoxFit.contain,
                            url: mLink[index],
                            height: 90,
                            width: 90,
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

  void videoPlay() {
    if (mLink.isNotEmpty && getFileExtension(mLink[selectedImage].toLowerCase()) == "mp4") {
      try {
        _controller = VideoPlayerController.network(mLink[selectedImage])
          ..initialize().then((_) {
            _controller.addListener(() {
              //custom Listner
              /*setState(() {
                if (!_controller.value.isPlaying &&
                    _controller.value.isInitialized &&
                    (_controller.value.duration == _controller.value.position)) {
                  //checking the duration and position every time
                  //widget.playDone();
                }
              });*/
            });
            setState(() {});
            _controller.play();
          });
        _controller2 = VideoPlayerController.network(mLink[selectedImage])
          ..initialize().then((_) {
            _controller2.addListener(() {
              //custom Listner
              /*setState(() {
                if (!_controller2.value.isPlaying &&
                    _controller2.value.isInitialized &&
                    (_controller2.value.duration == _controller2.value.position)) {
                  //checking the duration and position every time
                  //widget.playDone();
                }
              });*/
            });
            setState(() {});
            _controller2.play();
          });
      } catch (e) {
        ///
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
